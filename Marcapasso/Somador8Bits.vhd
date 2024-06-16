LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Somador8Bits IS
	PORT(
		A_S8, B_S8: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		CI_S8: IN STD_LOGIC;
		S_S8: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		CO_S8: OUT STD_LOGIC
	);
END Somador8Bits;

ARCHITECTURE soma OF Somador8Bits IS
	COMPONENT SomadorCompleto IS
		PORT(
			A_SC, B_SC, CI_SC: IN STD_LOGIC;
			S_SC, CO_SC: OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL COs: STD_LOGIC_VECTOR (6 DOWNTO 0);
BEGIN

S0: SomadorCompleto PORT MAP(A_S8(0), B_S8(0), CI_S8, S_S8(0), COs(0));
S1: SomadorCompleto PORT MAP(A_S8(1), B_S8(1), COs(0), S_S8(1), COs(1));
S2: SomadorCompleto PORT MAP(A_S8(2), B_S8(2), COs(1), S_S8(2), COs(2));
S3: SomadorCompleto PORT MAP(A_S8(3), B_S8(3), COs(2), S_S8(3), COs(3));
S4: SomadorCompleto PORT MAP(A_S8(4), B_S8(4), COs(3), S_S8(4), COs(4));
S5: SomadorCompleto PORT MAP(A_S8(5), B_S8(5), COs(4), S_S8(5), COs(5));
S6: SomadorCompleto PORT MAP(A_S8(6), B_S8(6), COs(5), S_S8(6), COs(6));
S7: SomadorCompleto PORT MAP(A_S8(7), B_S8(7), COs(6), S_S8(7), CO_S8);

END soma;