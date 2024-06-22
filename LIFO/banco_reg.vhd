---============================================================================
library ieee;
use ieee.std_logic_1164.all;

entity banco_reg is
		port(w_data      : in  std_logic_vector (12 downto 0);
			  clr, clk     : in  std_logic;
			  load         : in std_logic_vector (15 downto 0);
			  S_reg0, S_reg1, S_reg2, S_reg3, S_reg4, S_reg5, S_reg6, S_reg7, S_reg8, S_reg9, S_reg10, S_reg11, S_reg12, S_reg13, S_reg14, S_reg15 : out std_logic_vector (12 downto 0));
end banco_reg;


architecture ckt of banco_reg is

------ COMPONENTES ------------------------------------------------------------ 
component reg_13_bits is
		port(A            : in  std_logic_vector (12 downto 0);
			  ld, clr, clk : in  std_logic;
			  R		      : out std_logic_vector (12 downto 0));
end component;

--------- EXECUCA?O DO CODIGO---------------------------------------------------		

begin
		
REG0 : reg_13_bits port map(w_data, load(0), clr, clk, S_reg0);
REG1 : reg_13_bits port map(w_data, load(1), clr, clk, S_reg1);	
REG2 : reg_13_bits port map(w_data, load(2), clr, clk, S_reg2);	
REG3 : reg_13_bits port map(w_data, load(3), clr, clk, S_reg3);	
REG4 : reg_13_bits port map(w_data, load(4), clr, clk, S_reg4);	
REG5 : reg_13_bits port map(w_data, load(5), clr, clk, S_reg5);	
REG6 : reg_13_bits port map(w_data, load(6), clr, clk, S_reg6);	
REG7 : reg_13_bits port map(w_data, load(7), clr, clk, S_reg7);	
REG8 : reg_13_bits port map(w_data, load(8), clr, clk, S_reg8);	
REG9 : reg_13_bits port map(w_data, load(9), clr, clk, S_reg9);	
REG10 : reg_13_bits port map(w_data, load(10), clr, clk, S_reg10);	
REG11 : reg_13_bits port map(w_data, load(11), clr, clk, S_reg11);	
REG12 : reg_13_bits port map(w_data, load(12), clr, clk, S_reg12);	
REG13 : reg_13_bits port map(w_data, load(13), clr, clk, S_reg13);	
REG14 : reg_13_bits port map(w_data, load(14), clr, clk, S_reg14);	
REG15 : reg_13_bits port map(w_data, load(15), clr, clk, S_reg15);			
		
			
end ckt;
