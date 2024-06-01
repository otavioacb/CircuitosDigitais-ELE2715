LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Comparador1Bit IS
	PORT(
		a, b, in_gt, in_lt, in_eq : IN STD_LOGIC;
		out_gt, out_lt, out_eq : OUT STD_LOGIC
	);
END Comparador1Bit;

ARCHITECTURE comparador OF Comparador1Bit IS

BEGIN
		
out_gt <= in_gt OR ( in_eq AND a AND NOT b );
out_lt <= in_lt OR ( in_eq AND NOT a AND b );		
out_eq <= in_eq AND ( a XNOR b );
	
END comparador;