LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SeletorDeMoedas IS
	PORT(
		m : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		x, y, z : OUT STD_LOGIC
	);
END SeletorDeMoedas;

ARCHITECTURE seletor OF SeletorDeMoedas IS
	
BEGIN 

x <= m(5) OR m(4) OR m(3);
y <= ( NOT m(4) AND NOT m(3) AND m(1) ) OR ( NOT m(4) AND NOT m(3) AND m(2) ) OR m(5);
z <= ( NOT m(5) AND NOT m(3) AND NOT m(1) AND m(0) ) OR ( NOT m(5) AND NOT m(3) AND m(2) ) OR ( NOT m(5) AND m(4));

END seletor;
