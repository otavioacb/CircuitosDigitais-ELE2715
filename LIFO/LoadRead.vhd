LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LoadRead IS
	PORT(
		clk, clear, en : IN STD_LOGIC;
		data_in : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		data_out : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
	);
END LoadRead;

ARCHITECTURE load_data OF LoadRead IS
	
	COMPONENT ffd IS
		PORT(
			ck, clr, set, en, d : IN  std_logic;
			q : OUT std_logic
		);
	END COMPONENT;
	
BEGIN

S0: ffd PORT MAP(clk, NOT clear, '1', en, data_in(0), data_out(0));
S1: ffd PORT MAP(clk, NOT clear, '1', en, data_in(1), data_out(1));
S2: ffd PORT MAP(clk, NOT clear, '1', en, data_in(2), data_out(2));
S3: ffd PORT MAP(clk, NOT clear, '1', en, data_in(3), data_out(3));
S4: ffd PORT MAP(clk, NOT clear, '1', en, data_in(4), data_out(4));
S5: ffd PORT MAP(clk, NOT clear, '1', en, data_in(5), data_out(5));
S6: ffd PORT MAP(clk, NOT clear, '1', en, data_in(6), data_out(6));
S7: ffd PORT MAP(clk, NOT clear, '1', en, data_in(7), data_out(7));
S8: ffd PORT MAP(clk, NOT clear, '1', en, data_in(8), data_out(8));
S9: ffd PORT MAP(clk, NOT clear, '1', en, data_in(9), data_out(9));
S10: ffd PORT MAP(clk, NOT clear, '1', en, data_in(10), data_out(10));
S11: ffd PORT MAP(clk, NOT clear, '1', en, data_in(11), data_out(11));
S12: ffd PORT MAP(clk, NOT clear, '1', en, data_in(12), data_out(12));

END load_data;
