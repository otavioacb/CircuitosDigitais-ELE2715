library ieee;
use ieee.std_logic_1164.all;


entity display7 is
	port (A, B, C, D: in std_logic;
			X, Y, Z, W,e,f,g: out std_logic);
		
end display7;


architecture log of display7 is

begin

g <= (NOT B AND C) OR (B AND NOT C) OR (B AND NOT D) OR A;

f <= (NOT C AND NOT D) OR (B AND NOT C) OR (B AND NOT D) OR A;

e <=  (NOT B AND NOT D) OR (C AND NOT D);

W <= (B AND NOT C AND D) OR (NOT B AND NOT D) OR (NOT B AND C) OR (C AND NOT D);

Z <= NOT C OR D OR B;

Y <= (NOT C AND NOT D) OR (C AND D) OR (NOT B);

X <= (NOT B AND NOT D) OR (B AND D) OR (C) OR (A);




end log;