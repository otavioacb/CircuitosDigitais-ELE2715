library ieee;
use ieee.std_logic_1164.all;

entity reg_13_bits is
		port(A            : in  std_logic_vector (12 downto 0);
			  ld, clr, clk : in  std_logic;
			  R		      : out std_logic_vector (12 downto 0));
end reg_13_bits;


architecture ckt of reg_13_bits is

------ COMPONENTES ------------------------------------------------------------ 
	COMPONENT ffd IS
		PORT(
			ck, clr, set, en, d : IN  std_logic;
			q : OUT std_logic
		);
	END COMPONENT;
	

--------- EXECUCA?O DO CODIGO---------------------------------------------------		

begin
		
		R0:  ffd port map(clk, clr, '1', ld, A(0),  R(0));
		R1:  ffd port map(clk, clr, '1', ld, A(1),  R(1));
		R2:  ffd port map(clk, clr, '1', ld, A(2),  R(2));	
		R3:  ffd port map(clk, clr, '1', ld, A(3),  R(3));
		R4:  ffd port map(clk, clr, '1', ld, A(4),  R(4));
		R5:  ffd port map(clk, clr, '1', ld, A(5),  R(5));
		R6:  ffd port map(clk, clr, '1', ld, A(6),  R(6));
		R7:  ffd port map(clk, clr, '1', ld, A(7),  R(7));
		R8:  ffd port map(clk, clr, '1', ld, A(8),  R(8));
		R9:  ffd port map(clk, clr, '1', ld, A(9),  R(9));
		R10: ffd port map(clk, clr, '1', ld, A(10), R(10));
		R11: ffd port map(clk, clr, '1', ld, A(11), R(11));
		R12: ffd port map(clk, clr, '1', ld, A(12), R(12));
		
			
end ckt;