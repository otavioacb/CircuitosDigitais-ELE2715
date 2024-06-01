LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Subtrator_11Bits is
    Port(
        A, B: IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        S: OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END Subtrator_11Bits;

ARCHITECTURE Subtrator_11Bits OF Subtrator_11Bits IS
	COMPONENT SomadorCompleto is
		 Port(
			  A_SC, B_SC, CI_SC: IN STD_LOGIC;
			  S_SC, CO_SC: OUT STD_LOGIC
		 );
	END COMPONENT SomadorCompleto;

	SIGNAL B_SUB: STD_LOGIC_VECTOR(10 DOWNTO 0);
	SIGNAL CO0, CO1, CO2, CO3, CO4, CO5, CO6, CO7, CO8, CO9, CO10: STD_LOGIC;

BEGIN

B_SUB(10)<= '1' XOR B(10);
B_SUB(9) <= '1' XOR B(9);
B_SUB(8) <= '1' XOR B(8);
B_SUB(7) <= '1' XOR B(7);
B_SUB(6) <= '1' XOR B(6);
B_SUB(5) <= '1' XOR B(5);
B_SUB(4) <= '1' XOR B(4);
B_SUB(3) <= '1' XOR B(3);
B_SUB(2) <= '1' XOR B(2);
B_SUB(1) <= '1' XOR B(1);
B_SUB(0) <= '1' XOR B(0);

SUB0: SomadorCompleto PORT MAP (A(0), B_SUB(0), '1', S(0),CO0);
SUB1: SomadorCompleto PORT MAP (A(1), B_SUB(1), CO0, S(1),CO1);
SUB2: SomadorCompleto PORT MAP (A(2), B_SUB(2), CO1, S(2),CO2);
SUB3: SomadorCompleto PORT MAP (A(3), B_SUB(3), CO2, S(3),CO3);
SUB4: SomadorCompleto PORT MAP (A(4), B_SUB(4), CO3, S(4),CO4);
SUB5: SomadorCompleto PORT MAP (A(5), B_SUB(5), CO4, S(5),CO5);
SUB6: SomadorCompleto PORT MAP (A(6), B_SUB(6), CO5, S(6),CO6);
SUB7: SomadorCompleto PORT MAP (A(7), B_SUB(7), CO6, S(7),CO7);
SUB8: SomadorCompleto PORT MAP (A(8), B_SUB(8), CO7, S(8),CO8);
SUB9: SomadorCompleto PORT MAP (A(9), B_SUB(9), CO8, S(9),CO9);
SUB10:SomadorCompleto PORT MAP(A(10), B_SUB(10),CO9, S(10),CO10);

END Subtrator_11Bits;