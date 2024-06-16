LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ContadorPasso IS 
	PORT(
		clk, t: IN STD_LOGIC;
		z: OUT STD_LOGIC
	);
END ContadorPasso;

ARCHITECTURE cont OF ContadorPasso IS

	COMPONENT ffd IS
		PORT(
			ck, clr, set, d : IN  std_logic;
			q : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Somador8Bits IS
		PORT(
			A_S8, B_S8: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			CI_S8: IN STD_LOGIC;
			S_S8: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			CO_S8: OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL q, inc, reg : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL en_sum, sel : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL cout, cont_0, cont_5, cont_25 : STD_LOGIC;
	
BEGIN

-- Vetor selecao
en_sum <= (OTHERS => t);

sel <= ( "00000" AND en_sum ) OR ( q(4 DOWNTO 0) AND NOT en_sum );

REG0: ffd PORT MAP(clk, '1', '1', sel(0), reg(0));
REG1: ffd PORT MAP(clk, '1', '1', sel(1), reg(1));
REG2: ffd PORT MAP(clk, '1', '1', sel(2), reg(2));
REG3: ffd PORT MAP(clk, '1', '1', sel(3), reg(3));
REG4: ffd PORT MAP(clk, '1', '1', sel(4), reg(4));

-- Subtrator
inc(0) <= ( '0' AND t ) OR ( '1' AND NOT t );

SUB: Somador8Bits PORT MAP(reg, inc, '0', q, cout);

-- Saida
cont_25 <= reg(4) AND NOT reg(3) AND reg(2) AND NOT reg(1) AND NOT reg(0);
-- cont_0 <= NOT reg(4) AND NOT reg(3) AND NOT reg(2) AND NOT reg(1) AND NOT reg(0);

z <= cont_25;

END cont;