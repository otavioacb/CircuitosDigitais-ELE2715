LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ReconhecerPilha IS
	PORT(
		clk, en_r, en_w : IN STD_LOGIC;
		point_r, point_w : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		em, fu : OUT STD_LOGIC
	);
END ReconhecerPilha;

ARCHITECTURE reconhecimento OF ReconhecerPilha IS
	
	COMPONENT CompPointer IS
		PORT(
			a, b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			out_eq, out_gt, out_lt : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT ffjk is
		port (ck, clr, set, en, j, k : in  std_logic;
									  q : out std_logic);
	end COMPONENT;
	
	SIGNAL last_f, eq, gt, lt : STD_LOGIC;
	
BEGIN

LAST: ffjk PORT MAP(clk, '1', '1', '1', en_w, en_r, last_f);

COMP_EM: CompPointer PORT MAP(point_w, "0000", eq, gt, lt);

em <= eq AND NOT last_f;
fu <= eq AND last_f;
END reconhecimento;