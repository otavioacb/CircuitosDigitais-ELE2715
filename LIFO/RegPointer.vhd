LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegPointer IS
	PORT(
		clk, clear, en : IN STD_LOGIC;
		pnt_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		pnt_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END RegPointer;

ARCHITECTURE pointer OF RegPointer IS
	
	COMPONENT ffd IS
		PORT(
			ck, clr, set, en, d : IN  std_logic;
			q : OUT std_logic
		);
	END COMPONENT;
	
	SIGNAL out_init : STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '1');
	
BEGIN

S0: ffd PORT MAP(clk, NOT clear, '1', en, pnt_in(0), out_init(0));
S1: ffd PORT MAP(clk, NOT clear, '1', en, pnt_in(1), out_init(1));
S2: ffd PORT MAP(clk, NOT clear, '1', en, pnt_in(2), out_init(2));
S3: ffd PORT MAP(clk, NOT clear, '1', en, pnt_in(3), out_init(3));

pnt_out <= out_init;

END pointer;
