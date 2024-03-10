LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY matriz_leds IS 
PORT(
	A, B, C, D : IN STD_logiC;
	L0,L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14: OUT std_logic
);
END matriz_leds;

ARCHITECTURE logic OF matriz_leds IS
SIGNAL p_and0, p_and1, p_and2, p_and3, p_and4, p_and5, p_and6, p_and7, p_and9: STD_LOGIC;
BEGIN 

p_and0 <= NOT(A) AND NOT(B) AND NOT(C) AND NOT(D);
p_and1 <= NOT(A) AND NOT(B) AND NOT(C) AND D; 
p_and2 <= NOT(A) AND NOT(B) AND C AND NOT(D);
p_and3 <= NOT(A) AND NOT(B) AND C AND D;
p_and4 <= NOT(A) AND B AND NOT(C) AND NOT(D);
p_and5 <= NOT(A) AND B AND NOT(C) AND D;
p_and6 <= NOT(A) AND B AND C AND NOT(D);
p_and7 <= NOT(A) AND B AND C AND D;
p_and9 <= A AND NOT(B) AND NOT(C) AND D;


L0 <= NOT(p_and1 OR p_and7);
L1 <= NOT(p_and4 OR p_and7);
L2 <= NOT(p_and1 OR p_and4);
L3 <= NOT(p_and1 OR p_and2 OR p_and7);
L4 <= p_and1;
L5 <= NOT(p_and1 OR p_and3 OR p_and4 OR p_and5 OR p_and9);
L6 <= NOT(p_and1 OR p_and7);
L7 <= NOT(p_and0);
L8 <= NOT(p_and1 OR p_and7);
L9 <= NOT(p_and1 OR p_and5);
L10 <= p_and1;
L11 <= NOT(p_and2 OR p_and3 OR p_and6 OR p_and7);
L12 <= NOT(p_and1);
L13 <= NOT(p_and4);
L14 <= NOT(p_and1);


END logic;