--===============================
--  MUX com 8 selecoes
--================================
library ieee;
use ieee.std_logic_1164.all;

entity MUX8x1 is
    port(
        i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic;
        s : in std_logic_vector(2 downto 0);
        q : out std_logic
    );
end MUX8x1;

architecture ckt of MUX8x1 is

    begin

        q <= (i0 and not s(2) and not s(1) and not s(0)) or
        (i1 and not s(2) and not s(1) and s(0)) or
        (i2 and not s(2) and s(1) and not s(0)) or
        (i3 and not s(2) and s(1) and s(0)) or
        (i4 and s(2) and not s(1) and not s(0)) or
        (i5 and s(2) and not s(1) and s(0)) or
        (i6 and s(2) and s(1) and not s(0)) or
        (i7 and s(2) and s(1) and s(0));

end ckt;