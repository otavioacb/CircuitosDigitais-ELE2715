LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Subtrator IS
	PORT(
		A_SUC, B_SUC: IN STD_LOGIC_VECTOR (3 DOWNTO 0); 
		TI_SUC: IN STD_LOGIC;
		S_SUC: OUT STD_LOGIC_VECTOR (3 DOWNTO 0) ;
		TO_SUC: OUT STD_LOGIC
	);
END Subtrator;

ARCHITECTURE sub4bits OF Subtrator IS

	COMPONENT SubtratorCompleto IS
		PORT(
			A_MS, B_MS, TI_MS: IN STD_LOGIC;
			S_MS, TO_MS: OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL TOS: STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');

BEGIN
	

SU0: SubtratorCompleto PORT MAP(A_SUC(0), B_SUC(0), TI_SUC, S_SUC(0), TOS(0));
SU1: SubtratorCompleto PORT MAP(A_SUC(1), B_SUC(1), TOS(0), S_SUC(1), TOS(1));
SU2: SubtratorCompleto PORT MAP(A_SUC(2), B_SUC(2), TOS(1), S_SUC(2), TOS(2));
SU3: SubtratorCompleto PORT MAP(A_SUC(3), B_SUC(3), TOS(2), S_SUC(3), TO_SUC);
	

END sub4bits;