library ieee;
use ieee.std_logic_1164.all;

entity MUX_moeda is 
    port (
        key_comp : in STD_LOGIC_VECTOR (2 downto 0);
        S_sub : out STD_LOGIC_VECTOR (10 downto 0)
    );
end MUX_moeda;
    
architecture main of MUX_moeda is 

 signal key_comp_v0, key_comp_v1, key_comp_v2 : STD_LOGIC_VECTOR (10 downto 0);
 signal real01, cent50 ,cent25, cent10, cent05, cent01, cent00  : STD_LOGIC_VECTOR (10 downto 0);
 
begin

real01 <= "00010000000";
cent50 <= "00000110010";
cent25 <= "00000011001";
cent10 <= "00000001010";
cent05 <= "00000000101";
cent01 <= "00000000001";
cent00 <= "00000000000";

key_comp_v2 <= (OTHERS => key_comp(2));
key_comp_v1 <= (OTHERS => key_comp(1));
key_comp_v0 <= (OTHERS => key_comp(0));
  
S_sub <= (cent00 and (not (key_comp_v2) and not (key_comp_v1) and  not (key_comp_v0))) or 
		  (cent01 and (not (key_comp_v2) and not (key_comp_v1) and      (key_comp_v0))) or 
		  (cent05 and (not (key_comp_v2) and     (key_comp_v1) and  not (key_comp_v0))) or 
		  (cent10 and (not (key_comp_v2) and     (key_comp_v1) and      (key_comp_v0))) or 
		  (cent25 and (    (key_comp_v2) and not (key_comp_v1) and  not (key_comp_v0))) or 
		  (cent50 and (    (key_comp_v2) and not (key_comp_v1) and      (key_comp_v0))) or 
		  (real01 and (    (key_comp_v2) and     (key_comp_v1) and  not (key_comp_v0)));
end main;