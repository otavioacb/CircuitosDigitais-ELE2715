LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Display7Segmentos IS 
	PORT(
		A_D7S: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		S_D7S: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END Display7Segmentos;

ARCHITECTURE visual OF Display7Segmentos IS
	SIGNAL A, B, C, D: STD_LOGIC;
BEGIN 

A <= A_D7S(3);
B <= A_D7S(2);
C <= A_D7S(1);
D <= A_D7S(0);

S_D7S(6) <= ( NOT(A) AND NOT(B) AND NOT(C) AND D ) OR ( B AND NOT(D) ) OR ( A AND C ) OR ( A AND B );
S_D7S(5) <= ( B AND NOT(C) AND D ) OR ( B AND C AND NOT(D) ) OR ( A AND C ) OR ( A AND B );
S_D7S(4) <= ( NOT(B) AND C AND NOT(D) ) OR ( A AND C ) OR ( A AND B );
S_D7S(3) <= ( NOT(A) AND NOT(B) AND NOT(C) AND D ) OR ( B AND NOT(C) AND NOT(D) ) OR ( B AND C AND D ) OR ( A AND C ) OR ( A AND B ); 
S_D7S(2) <= D OR ( B AND NOT(C) ) OR ( A AND C );
S_D7S(1) <= ( NOT(A) AND NOT(B) AND D ) OR ( NOT(B) AND C ) OR ( C AND D ) OR ( A AND B );
S_D7S(0) <= ( NOT(A) AND NOT(B) AND NOT(C) ) OR ( B AND C AND D ) OR ( A AND C ) OR ( A AND B );



END visual;