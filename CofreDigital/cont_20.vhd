library ieee;
use ieee.std_logic_1164.all;

entity cont_20 is 
    port (
		ck_20 : in std_logic;
      estado: in std_logic_vector(2 downto 0);
      tempo: out std_logic    
	);
 end cont_20;

 architecture main of cont_20 is 
  component ffd is
	port (ck, clr, set, d : in  std_logic;
							  q : out std_logic
		 );
end component;

 
  component  somador IS
PORT(
		  A_somador       : IN std_logic;
		  P_somador       : IN std_logic;
		  C_IN_somador    : IN std_logic;
		  O_somador       : OUT std_logic;
		  C_OUT_somador   : OUT std_logic
);
		  END component;



signal CK,clk_20 : std_logic_vector (4 downto 0) := (others => '0');
signal clk_out,c_out_0, c_out_1,c_out_2,c_out_3,c_out_4,clr_result : std_logic; 
signal pin_soma: std_logic;       

  begin 
  
 
	temp_0: ffd port map(ck_20,clr_result,'1',ck(0),clk_20(0));
	temp_1: ffd port map(ck_20,clr_result,'1',ck(1),clk_20(1));
	temp_2: ffd port map(ck_20,clr_result,'1',ck(2),clk_20(2));
	temp_3: ffd port map(ck_20,clr_result,'1',ck(3),clk_20(3));
	temp_4: ffd port map(ck_20,clr_result,'1',ck(4),clk_20(4));

	clr_result <= not((clk_20(0)xnor'1') and (clk_20(1)xnor'0') and (clk_20(2)xnor'1') and (clk_20(3)xnor'0') and (clk_20(4)xnor'1'));
	
	pin_soma <= estado(2) and not(estado(1)) and not(estado(0));
	
	soma_0 : somador port map (clk_20(0),'0',pin_soma,ck(0),c_out_0);
	soma_1 : somador port map (clk_20(1),'0',c_out_0,ck(1),c_out_1);
	soma_2 : somador port map (clk_20(2),'0',c_out_1,ck(2),c_out_2);
	soma_3 : somador port map (clk_20(3),'0',c_out_2,ck(3),c_out_3);
	soma_4 : somador port map (clk_20(4),'0',c_out_3,ck(4),c_out_4);
	
	
   tempo<= (clk_20(0) and not(clk_20(1)) and clk_20(2) and not(clk_20(3)) and clk_20(4));
  
  end main;