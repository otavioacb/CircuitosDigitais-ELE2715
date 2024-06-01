LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Demux IS
	PORT(
		S: IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
		I: IN  STD_LOGIC;
		O: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
END Demux;

ARCHITECTURE slt OF Demux IS

BEGIN

-- O(0) <= I AND NOT S(2) AND NOT S(1) AND NOT S(0);
O(0) <= I AND NOT S(2) AND NOT S(1) AND S(0);
O(1) <= I AND NOT S(2) AND S(1) AND NOT S(0);
O(2) <= I AND NOT S(2) AND S(1) AND S(0);
O(3) <= I AND S(2) AND NOT S(1) AND NOT S(0);
O(4) <= I AND S(2) AND NOT S(1) AND S(0);
O(5) <= I AND S(2) AND S(1) AND NOT S(0);
-- O(7) <= I AND S(2) AND S(1) AND S(0);

END slt;