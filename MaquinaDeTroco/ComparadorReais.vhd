LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ComparadorReais IS
	PORT(
		reais_a, reais_b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		reais_out_lt : OUT STD_LOGIC
	);
END ComparadorReais;

ARCHITECTURE reais OF ComparadorReais IS
	
	COMPONENT Comparador1Bit IS
		PORT(
			a, b, in_gt, in_lt, in_eq : IN STD_LOGIC;
			out_gt, out_lt, out_eq : OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL gts, lts, eqs : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

C3: Comparador1Bit PORT MAP(reais_a(3), reais_b(3), '0', '0', '1', gts(3), lts(3), eqs(3));
C2: Comparador1Bit PORT MAP(reais_a(2), reais_b(2), gts(3), lts(3), eqs(3), gts(2), lts(2), eqs(2));
C1: Comparador1Bit PORT MAP(reais_a(1), reais_b(1), gts(2), lts(2), eqs(2), gts(1), lts(1), eqs(1));		
C0: Comparador1Bit PORT MAP(reais_a(0), reais_b(0), gts(1), lts(1), eqs(1), gts(0), lts(0), eqs(0));		

reais_out_lt <= lts(0);

END reais;