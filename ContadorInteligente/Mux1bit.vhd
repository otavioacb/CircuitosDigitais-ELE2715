library ieee;
use ieee.std_logic_1164.all;

entity MUX1bit is

port(A_mx, B_mn ,updw: in std_logic;S_mxn: out std_logic);

end MUX1bit;

architecture logic of MUX1bit is

begin

S_mxn <= (A_mx and updw) or  (B_mn and (not updw));

end logic;