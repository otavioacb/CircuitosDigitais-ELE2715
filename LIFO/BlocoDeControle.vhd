LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BlocoDeControle IS
	PORT(
		clk, clear : IN STD_LOGIC;
		rd, wr : IN STD_LOGIC;
		en_r, en_w, rst : OUT STD_LOGIC
	);
END BlocoDeControle;

ARCHITECTURE controle OF BlocoDeControle IS
	
	COMPONENT MDE IS
		PORT(
			ck, rst : IN STD_LOGIC;
			rd, wr  : IN STD_LOGIC;
		   s : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
	END COMPONENT;
	
	SIGNAL s : STD_LOGIC_VECTOR (1 DOWNTO 0);
	
BEGIN

FSM: MDE PORT MAP(clk, clear, rd, wr, s);

en_r <= s(1) AND NOT s(0);
en_w <= NOT s(1) AND s(0);
rst <= NOT s(1) AND NOT s(0);

END controle;
