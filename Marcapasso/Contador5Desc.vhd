LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Contador5Desc IS 
	PORT(
		clk, t: IN STD_LOGIC;
		z: OUT STD_LOGIC
	);

END Contador5Desc;

ARCHITECTURE cont OF Contador5Desc IS

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
	
	SIGNAL q, dec, t_vec_sub : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	SIGNAL reg : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
	SIGNAL t_vec_reg, sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL cout : STD_LOGIC;
	
BEGIN

-- Vetor selecao
t_vec_reg <= (OTHERS => t);
t_vec_sub <= (OTHERS => t);

-- Substrator
dec <= ( "00000000" AND t_vec_sub ) OR ( "00000001" AND NOT t_vec_sub );

SUB: Somador8Bits PORT MAP(reg, dec, '1', q, cout);

-- Mux 
sel <= ( "000" AND t_vec_reg ) OR ( q(2 DOWNTO 0) AND NOT t_vec_reg );

-- Registrador
REG0: ffd PORT MAP(clk, '1', '1', sel(0), reg(0));
REG1: ffd PORT MAP(clk, '1', '1', sel(1), reg(1));
REG2: ffd PORT MAP(clk, '1', '1', sel(2), reg(2));

-- Saida
z <= reg(2) AND NOT reg(1) AND NOT reg(0);

END cont;