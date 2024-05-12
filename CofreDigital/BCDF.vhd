library ieee;
use ieee.std_logic_1164.all;

ENTITY BCDF IS
	port (SW, SW2: in std_logic_vector(5 downto 0); 	-------SW(senha), SW2(registrador)
         KEY: IN STD_lOGIC_VECTOR(2 DOWNTO 0);
			HEX0, HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
	end BCDF;

architecture log of BCDF is
	
component U is ----conversor
		port (A3,A2,A1,A0: in std_logic;
			S3,S2,S1,S0: out std_logic);
		
end component;


component display7 is
	port (A, B, C, D: in std_logic;
			X, Y, Z, W,e,f,g: out std_logic);
		
end component;
	
component MUX8X8 is
	port(
        i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic_vector(7 downto 0);
        s : in std_logic_vector(2 downto 0);
        q : out std_logic_vector(7 downto 0)
    );
END COMPONENT;

component MUX8X1 is
	port(
        i0, i1, i2, i3, i4, i5, i6, i7, i8: in std_logic;
        s : in std_logic_vector(2 downto 0);
        q : out std_logic
    );
END COMPONENT;

component MUX_FINAL is
         port(
        i0, i1, i2, i3, i4, i5, i6, i7 : in std_logic_vector(13 downto 0);
        s : in std_logic_vector(2 downto 0);
        unidades, dezenas : out std_logic_vector(6 downto 0)
         );

end component;

component B is
	port (SW, SW2: in std_logic_vector(5 downto 0);
         KEY: IN STD_lOGIC_VECTOR(2 DOWNTO 0);	-------SW(senha), SW2(registrador)
			HEX0, HEX1: BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
end component;


signal T0, T1, T3, T4, T5, T6, T7: std_logic_vector(13 downto 0);
signal S: std_logic_vector(0 to 19);	
signal S1: std_logic_vector(0 to 19);	
signal bcd, bcd2: std_logic_vector(13 downto 0);
signal H, H1: STD_LOGIC_VECTOR(6 DOWNTO 0);



begin

U1: U port map('0','0','0',SW(5),S(3),S(2),S(1),S(0));
U2: U port map(S(2),S(1),S(0),SW(4),S(7),S(6),S(5),S(4));
U3: U port map(S(6),S(5),S(4),SW(3),S(11),S(10),S(9),S(8));
U4: U port map('0',S(3),S(7),S(11),bcd(9),S(15),S(14),S(13));
U5: U port map(S(10),S(9),S(8),SW(2),S(19),S(18),S(17),S(16));
U6: U port map(S(15),S(14),S(13),S(19),bcd(8),bcd(7),bcd(6),bcd(5));
U7: U port map(S(18),S(17),S(16),SW(1),bcd(4),bcd(3),bcd(2),bcd(1));
 
 bcd(0)<=SW(0);
 bcd(0)<=SW(0);
 bcd(13)<= '0';
 bcd(12)<= '0';
 bcd(11)<= '1';
 bcd(10)<= '1';



 U8: U port map('0','0','0',SW2(5),S1(3),S1(2),S1(1),S1(0));
 U9: U port map(S1(2),S1(1),S1(0),SW2(4),S1(7),S1(6),S1(5),S1(4));
 U10: U port map(S1(6),S1(5),S1(4),SW2(3),S1(11),S1(10),S1(9),S1(8));
 U11: U port map('0',S1(3),S1(7),S1(11),bcd2(9),S1(15),S1(14),S1(13));
 U12: U port map(S1(10),S1(9),S1(8),SW2(2),S1(19),S1(18),S1(17),S1(16));
 U13: U port map(S1(15),S1(14),S1(13),S1(19),bcd2(8),bcd2(7),bcd2(6),bcd2(5));
 U14: U port map(S1(18),S1(17),S1(16),SW2(1),bcd2(4),bcd2(3),bcd2(2),bcd2(1));
 
bcd2(0)<=SW2(0);
bcd2(0)<=SW2(0);
bcd2(0)<=SW2(0);
bcd2(13)<= '0';
bcd2(12)<= '0';
bcd2(11)<= '0';
bcd2(10)<= '0';


T0 <= "00000000000000";
T1 <= "00000000000000";
T4 <= "00000010000001";
T5 <= "10010011001001";
T6 <= "00000000000000";
T7 <= "00000000000000";



MN: MUX_FINAL port map(T0, T1, bcd(13 downto 0), bcd2(13 downto 0), T4, T5, T6, T7, key, H(6 DOWNTO 0), H1(6 DOWNTO 0));
MN1: display7 port map(H(3), H(2), H(1), H(0), HEX0(6), HEX0(5), HEX0(4), HEX0(3), HEX0(2), HEX0(1), HEX0(0));
MN2: display7 port map('0', H(6), H(5), H(4), HEX1(6), HEX1(5), HEX1(4), HEX1(3), HEX1(2), HEX1(1), HEX1(0));
end log;