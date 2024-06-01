LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_2x1_vec is
	PORT (
        	A, B : in  STD_LOGIC_VECTOR (10 DOWNTO 0);
        	SLT    : in  STD_LOGIC;
        	Y    : out STD_LOGIC_VECTOR (10 DOWNTO 0)
   	);
END mux_2x1_vec;

ARCHITECTURE mux OF mux_2x1_vec IS

	SIGNAL key : STD_LOGIC_VECTOR (10 DOWNTO 0);

BEGIN

key <= (OTHERS => SLT);

Y <= (NOT key AND A) OR (key AND B);

END mux;