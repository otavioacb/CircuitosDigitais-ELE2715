LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MDE IS
	PORT(
		ck, rst : IN STD_LOGIC;
		set, load, tmp5, tmp20, result: IN STD_LOGIC;
		cont_senha: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		s : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END MDE;

ARCHITECTURE moore OF MDE IS 
	
	TYPE ST IS (FECHADO, INICIANDO, VALOR, SENHA, ABERTO, CANCELANDO);
	
	SIGNAL state: ST;
	
BEGIN
	
	PROCESS (ck, rst)
	BEGIN
    IF rst = '1' THEN                 
      state <= FECHADO;                   
    ELSIF (ck'EVENT AND ck ='1') THEN    
      CASE state IS
        WHEN FECHADO =>                         
          IF set = '1' THEN state <= INICIANDO;
          END IF;
        WHEN INICIANDO =>                         
          IF tmp5 = '1' THEN state <= VALOR;
          END IF;
        WHEN VALOR =>                         
          IF set = '1' THEN state <= CANCELANDO;
          ELSIF load = '1' THEN state <= SENHA; 
          END IF;
        WHEN SENHA =>                         
          IF (result = '1' AND (cont_senha = "11") ) THEN state <= ABERTO;
          ELSIF (result = '0' AND cont_senha = "11") THEN state <= FECHADO;
          ELSIF tmp5 = '1' THEN state <= VALOR;
			 END IF;
		  WHEN ABERTO => 
			 IF (tmp20 = '1') THEN state <= FECHADO; 
			 END IF;
		  WHEN CANCELANDO => 
			 IF (tmp5 = '1') THEN state <= FECHADO;
			 END IF;
		 END CASE;
    END IF;
	END PROCESS;
	
	WITH state SELECT  
    s <= "000" WHEN FECHADO,
         "001" WHEN INICIANDO, 
         "010" WHEN VALOR, 
         "011" WHEN SENHA,
			"100" WHEN ABERTO,
			"101" WHEN CANCELANDO;
	 
END moore;