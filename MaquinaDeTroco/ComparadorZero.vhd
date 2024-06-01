library ieee;
use ieee.std_logic_1164.all;


entity comparador_zero is
    port (diff_resul: in  std_logic_vector(10 downto 0);
          result: out std_logic
);
end comparador_zero;

architecture log of comparador_zero is
    signal igual : std_logic_vector(17 downto 0);
begin 
    result <= (diff_resul(0) xnor '0') and
              (diff_resul(1) xnor '0') and
              (diff_resul(2) xnor '0') and 
              (diff_resul(3) xnor '0') and
              (diff_resul(4) xnor '0') and 
              (diff_resul(5) xnor '0') and 
              (diff_resul(6) xnor '0') and 
              (diff_resul(7) xnor '0') and 
              (diff_resul(8) xnor '0') and  
              (diff_resul(9) xnor '0') and 
              (diff_resul(10) xnor'0');
             
end log;