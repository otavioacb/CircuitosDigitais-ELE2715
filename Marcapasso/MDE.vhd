LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MDE IS
	PORT(
		ck, rst : IN STD_LOGIC;
		sa, sv, za, zv: IN STD_LOGIC;
		ta, tv, pa, pv: OUT STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END MDE;

ARCHITECTURE moore OF MDE IS 
	
	TYPE ST IS (ResetTempA, EsperaA, ContracaoA, ResetTempV, EsperaV, ContracaoV);
	
	SIGNAL state: ST;
	
BEGIN
	
	PROCESS (ck, rst)
	BEGIN
    IF rst = '1' THEN                 
      state <= ResetTempA;                   
    ELSIF (ck'EVENT AND ck ='1') THEN    
      CASE state IS
        WHEN ResetTempA =>
			state <= EsperaA;
			tv <= '1'; 
			ta <= '0';
			pa <= '0';
			pv <= '0';
        WHEN EsperaA => 
			  IF sa = '1' THEN state <= ResetTempV;
			  ELSIF (sa = '0') AND (za = '0') THEN state <= EsperaA;
			  ELSIF (sa = '0') AND (za = '1') THEN state <= ContracaoA;
			  END IF;
			  tv <= '1'; 
			  ta <= '0';
			  pa <= '0';
			  pv <= '0';
        WHEN ContracaoA =>      
			state <= ResetTempV;
			
			  tv <= '1'; 
			  ta <= '0';
			  pa <= '1';
			  pv <= '0';
        WHEN ResetTempV =>                         
          state <= EsperaV;
			 
			  tv <= '1'; 
			  ta <= '1';
			  pa <= '0';
			  pv <= '0';
		  WHEN EsperaV => 
			 IF sv = '1' THEN state <= ResetTempA;
			 ELSIF (sv = '0') AND (zv = '0') THEN state <= EsperaV;
			 ELSIF (sv = '0') AND (zv = '1') THEN state <= ContracaoV;
			 END IF;
			 
			  tv <= '0'; 
			  ta <= '1';
			  pa <= '0';
			  pv <= '0';
		  WHEN ContracaoV =>
				state <= ResetTempA;
			
			  tv <= '0'; 
			  ta <= '1';
			  pa <= '0';
			  pv <= '1';
		 END CASE;
    END IF;
	END PROCESS;
	
	WITH state SELECT  
    s <= "000" WHEN ResetTempA,
         "001" WHEN EsperaA, 
         "010" WHEN ContracaoA, 
         "011" WHEN ResetTempV,
			"100" WHEN EsperaV,
			"101" WHEN ContracaoV;
END moore;