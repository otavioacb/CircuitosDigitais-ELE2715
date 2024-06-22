LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MDE IS
	PORT(
		ck, rst : IN STD_LOGIC;
		rd, wr  : IN STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END MDE;

ARCHITECTURE moore OF MDE IS

	TYPE ST IS (Inicio, Esperar, Ler, Escrever);
	
	SIGNAL state: ST;
	
BEGIN
	
	PROCESS (ck, rst)
	BEGIN
    IF rst = '1' THEN                 
      state <= Inicio;                   
    ELSIF (ck'EVENT AND ck ='1') THEN    
      CASE state IS
        WHEN Inicio =>
			 IF (wr = '1') THEN state <= Escrever;
			 ELSE state <= Inicio;
			 END IF;
        WHEN Esperar =>
		    IF (rd = '1') AND (wr = '0') THEN state <= Ler;
			 ELSIF (rd = '0') AND (wr = '1') THEN state <= Escrever;
			 ELSE state <= Esperar;
			 END IF;
        WHEN Ler => 
			 IF (rd = '0') THEN state <= Esperar;
			 ELSIF (rd = '1') THEN state <= Ler;
			 END IF;
        WHEN Escrever =>   
			 IF (wr = '0') THEN state <= Esperar;
			 ELSIF (wr = '1') THEN state <= Escrever;
			 END IF;
		 END CASE;
    END IF;
	END PROCESS;
	WITH state SELECT  
    s <= "00" WHEN Inicio,
         "01" WHEN Escrever, 
         "10" WHEN Ler,
			"11" WHEN Esperar;
			
END moore;
