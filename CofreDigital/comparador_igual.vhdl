library ieee;
use ieee.std_logic_1164.all;

entity comparador_igual is
    port (reg_senha,senha: in  std_logic_vector(17 downto 0);
          result: out std_logic
);
end comparador_igual;

architecture log of comparador_igual is
    signal igual : std_logic_vector(17 downto 0);
begin 
    result <= (reg_senha(0) xnor senha(0)) and
             (reg_senha(1) xnor senha(1)) and
             (reg_senha(2) xnor senha(2)) and 
             (reg_senha(3) xnor senha(3)) and
             (reg_senha(4) xnor senha(4)) and 
             (reg_senha(5) xnor senha(5)) and 
             (reg_senha(6) xnor senha(6)) and 
             (reg_senha(7) xnor senha(7)) and 
             (reg_senha(8) xnor senha(8)) and  
             (reg_senha(9) xnor senha(9)) and 
             (reg_senha(10) xnor senha(10)) and 
             (reg_senha(11) xnor senha(11)) and 
             (reg_senha(12) xnor senha(12)) and 
             (reg_senha(13) xnor senha(13)) and 
             (reg_senha(14) xnor senha(14)) and 
             (reg_senha(15) xnor senha(15)) and 
             (reg_senha(16) xnor senha(16)) and 
             (reg_senha(17) xnor senha(17));
end architecture log;