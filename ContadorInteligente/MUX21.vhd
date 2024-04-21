library ieee;
use ieee.std_logic_1164.all;

entity MUX21 is
port(A_mx, B_mn : in std_logic_vector (3 downto 0);updw: in std_logic;S_mxn: out std_logic_vector (3 downto 0));

end MUX21;

architecture logic of MUX21 is

component MUX1bit 

port(A_mx, B_mn ,updw: in std_logic;S_mxn: out std_logic);

end component ; 

begin

MUX1:	MUX1bit port map (A_mx(0),B_mn(0),updw,S_mxn(0));
MUX2: MUX1bit port map (A_mx(1),B_mn(1),updw,S_mxn(1));
MUX3:	MUX1bit port map (A_mx(2),B_mn(2),updw,S_mxn(2));
MUX4: MUX1bit port map (A_mx(3),B_mn(3),updw,S_mxn(3));

end logic;