LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY REG_11BITS IS
	PORT(
		CLR, CLK: IN STD_LOGIC;
		V: IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		S: OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
);
END REG_11BITS;

ARCHITECTURE REG_11BITS OF REG_11BITS IS

	COMPONENT ffd is
   		PORT (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
	END COMPONENT ffd;
	
BEGIN

S10: FFD PORT MAP (CLK, CLR, '1', V(10), S(10));
S9:  FFD PORT MAP (CLK, CLR, '1',  V(9),  S(9));
S8:  FFD PORT MAP (CLK, CLR, '1',  V(8),  S(8));
S7:  FFD PORT MAP (CLK, CLR, '1',  V(7),  S(7));
S6:  FFD PORT MAP (CLK, CLR, '1',  V(6),  S(6));
S5:  FFD PORT MAP (CLK, CLR, '1',  V(5),  S(5));
S4:  FFD PORT MAP (CLK, CLR, '1',  V(4),  S(4));
S3:  FFD PORT MAP (CLK, CLR, '1',  V(3),  S(3));
S2:  FFD PORT MAP (CLK, CLR, '1',  V(2),  S(2));
S1:  FFD PORT MAP (CLK, CLR, '1',  V(1),  S(1));
S0:  FFD PORT MAP (CLK, CLR, '1',  V(0),  S(0));

END ARCHITECTURE;