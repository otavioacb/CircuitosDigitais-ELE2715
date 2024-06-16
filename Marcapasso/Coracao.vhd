LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Coracao IS
	PORT(
		clk : IN STD_LOGIC;
		en_a, en_v : IN STD_LOGIC;
		sa_c, sv_c : OUT STD_LOGIC
	);
END Coracao;

ARCHITECTURE batimento OF Coracao IS
	
	COMPONENT Contador5Desc IS 
		PORT(
			clk, t: IN STD_LOGIC;
			z: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT Contador20Desc IS 
		PORT(
			clk, t: IN STD_LOGIC;
			z: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL zs : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN 

TEMP5: Contador5Desc PORT MAP(clk, en_a AND zs(1), zs(0));

TEMP20: Contador20Desc PORT MAP(clk, en_v AND zs(0), zs(1));

sa_c <= zs(0);
sv_c <= zs(1);

END batimento;