LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MDE IS
	PORT(
		ck, rst : IN STD_LOGIC;
		T, vazio, resto_d, resto_e: IN STD_LOGIC;
		L, BS: OUT STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END MDE;

ARCHITECTURE moore OF MDE IS 
	
	TYPE ST IS (A, B, C, D, E);
	
	SIGNAL state: ST;
	
BEGIN
	
	PROCESS (ck, rst)
	BEGIN
    IF rst = '1' THEN                 
      state <= A;                   
    ELSIF (ck'EVENT AND ck ='1') THEN    
      CASE state IS
        WHEN A =>                         
          IF T = '1' THEN state <= B;
          END IF;
			 L <= '1';
			 BS <= '0';
        WHEN B => 
			 state <= C;
			 L <= '1';
			 BS <= '1';
        WHEN C =>                         
          IF resto_d = '0' THEN state <= D; 
          END IF;
			 L <= '0';
			 BS <= '0';
        WHEN D =>                         
          IF (vazio = '0') AND (resto_d = '0') THEN state <= C;
          ELSIF (vazio = '1') AND (resto_d  = '0') THEN state <= A; 
          ELSIF resto_d  = '1' THEN state <= E; 
          END IF;
			 L <= '1';
			 BS <= '0';
		  WHEN E => 
			 IF (resto_e = '1') THEN state <= A; 
			 END IF;
			 L <= '0';
			 BS <= '0';
		 END CASE;
    END IF;
	END PROCESS;
	
	WITH state SELECT  
    s <= "000" WHEN A,
         "001" WHEN B, 
         "010" WHEN C, 
         "011" WHEN D,
			"100" WHEN E;
	 
END moore;