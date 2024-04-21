library ieee;
use ieee.std_logic_1164.all;


entity ComparadorMagnitude is

port(mx_mn,S_C: in std_logic_vector(3 downto 0); a_Igual_b: in std_logic;Sa_Igual_b: out std_logic);

end ComparadorMagnitude;

architecture logic of ComparadorMagnitude is

begin

Sa_Igual_b <= ((mx_mn(0) xnor S_C(0)) and (mx_mn(1) xnor S_C(1)) and (mx_mn(2) xnor S_C(2))and (mx_mn(3) xnor S_C(3)) and a_igual_b);

end logic;