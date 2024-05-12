library ieee;
use ieee.std_logic_1164.all;

entity MUX_FINAL is
    port(
        i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic_vector(13 downto 0);
        s : in std_logic_vector(2 downto 0);
        unidades, dezenas : out std_logic_vector(6 downto 0)
    );
end MUX_FINAL;


architecture ckt of MUX_FINAL is

    component MUX8x8 is
        port(
            i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic_vector(6 downto 0);
            s : in std_logic_vector(2 downto 0);
            q : out std_logic_vector(6 downto 0)
        );
    end component;

    begin

        PORT_UNIDADE : MUX8x8 port map(i0(6 downto 0), i1(6 downto 0), i2(6 downto 0), i3(6 downto 0), 
                                            i4(6 downto 0), i5(6 downto 0), i6(6 downto 0), 
                                            i7(6 downto 0), s, unidades);
        PORT_DEZENA : MUX8x8 port map(i0(13 downto 7), i1(13 downto 7), i2(13 downto 7), i3(13 downto 7), 
                                        i4(13 downto 7), i5(13 downto 7), i6(13 downto 7), 
                                        i7(13 downto 7), s, dezenas);

end ckt;