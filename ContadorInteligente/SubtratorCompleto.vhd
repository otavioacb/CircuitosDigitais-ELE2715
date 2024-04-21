LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SubtratorCompleto IS
	PORT(
		A_MS, B_MS, TI_MS: IN STD_LOGIC;
		S_MS, TO_MS: OUT STD_LOGIC
	);
END SubtratorCompleto;

ARCHITECTURE sub OF SubtratorCompleto IS

BEGIN
	
S_MS <= A_MS XOR B_MS XOR TI_MS;
TO_MS <= ( NOT(A_MS) AND B_MS ) OR ( NOT(A_MS) AND TI_MS ) OR ( B_MS AND TI_MS );
	
END sub;