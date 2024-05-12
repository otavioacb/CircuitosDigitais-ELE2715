library ieee;
use ieee.std_logic_1164.all;

entity MUX8x8 is
    port(
        i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic_vector(6 downto 0);
        s : in std_logic_vector(2 downto 0);
        q : out std_logic_vector(6 downto 0)
    );
end MUX8x8;

architecture ckt of MUX8x8 is

    component MUX8x1 is
        port(
            i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic;
            s : in std_logic_vector(2 downto 0);
            q : out std_logic
        );
    end component;

    begin

        
        OUT0 : MUX8x1 port map(i0(0), i1(0), i2(0), i3(0), i4(0), i5(0), i6(0), i7(0), s, q(0));
        OUT1 : MUX8x1 port map(i0(1), i1(1), i2(1), i3(1), i4(1), i5(1), i6(1), i7(1), s, q(1));
        OUT2 : MUX8x1 port map(i0(2), i1(2), i2(2), i3(2), i4(2), i5(2), i6(2), i7(2), s, q(2));
        OUT3 : MUX8x1 port map(i0(3), i1(3), i2(3), i3(3), i4(3), i5(3), i6(3), i7(3), s, q(3));
        OUT4 : MUX8x1 port map(i0(4), i1(4), i2(4), i3(4), i4(4), i5(4), i6(4), i7(4), s, q(4));
        OUT5 : MUX8x1 port map(i0(5), i1(5), i2(5), i3(5), i4(5), i5(5), i6(5), i7(5), s, q(5));
        OUT6 : MUX8x1 port map(i0(6), i1(6), i2(6), i3(6), i4(6), i5(6), i6(6), i7(6), s, q(6));

end ckt;