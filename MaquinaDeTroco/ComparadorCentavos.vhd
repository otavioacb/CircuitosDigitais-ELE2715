LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ComparadorCentavos IS
	PORT(
		cent_a, cent_b : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		cent_out_lt : OUT STD_LOGIC
	);
END ComparadorCentavos;

ARCHITECTURE centavos OF ComparadorCentavos IS
	
	COMPONENT Comparador1Bit IS
		PORT(
			a, b, in_gt, in_lt, in_eq : IN STD_LOGIC;
			out_gt, out_lt, out_eq : OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL gts, lts, eqs : STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN

C6: Comparador1Bit PORT MAP(cent_a(6), cent_b(6), '0', '0', '1', gts(6), lts(6), eqs(6));
C5: Comparador1Bit PORT MAP(cent_a(5), cent_b(5), gts(6), lts(6), eqs(6), gts(5), lts(5), eqs(5));
C4: Comparador1Bit PORT MAP(cent_a(4), cent_b(4), gts(5), lts(5), eqs(5), gts(4), lts(4), eqs(4));
C3: Comparador1Bit PORT MAP(cent_a(3), cent_b(3), gts(4), lts(4), eqs(4), gts(3), lts(3), eqs(3));
C2: Comparador1Bit PORT MAP(cent_a(2), cent_b(2), gts(3), lts(3), eqs(3), gts(2), lts(2), eqs(2));
C1: Comparador1Bit PORT MAP(cent_a(1), cent_b(1), gts(2), lts(2), eqs(2), gts(1), lts(1), eqs(1));		
C0: Comparador1Bit PORT MAP(cent_a(0), cent_b(0), gts(1), lts(1), eqs(1), gts(0), lts(0), eqs(0));		

cent_out_lt <= lts(0);

END centavos;