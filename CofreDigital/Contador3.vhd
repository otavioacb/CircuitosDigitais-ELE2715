library ieee;
use ieee.std_logic_1164.all;

entity Contador3 is
   port (ck,load: in  std_logic;
                       S_C3 : out std_logic_vector(1 downto 0));
end Contador3;

architecture logic of Contador3 is

component ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;

component somador1bit is
  port( A,B,Cin: in std_logic;
	O: out std_logic;
	Cout: out std_logic);
end component;


component Clock5 is
   port (ck, load : in  std_logic;
                       S_Ck5 : out std_logic);
end component;

signal S_Reg : std_logic_vector (1 downto 0):=(others =>'0'); 
signal I_inc : std_logic_vector (1 downto 0):=(others=>'0');
signal Ck5 : std_logic:='0';
signal aux_Couti : std_logic_vector(1 downto 0):=(others =>'0');
signal clr_c3 : std_logic:='0';
begin


	  C5: Clock5 port map (ck,load,Ck5);
	  
	  
	  Temp2: ffd port map(ck,clr_c3,'1',I_inc(0),S_Reg(0));
	  Temp1: ffd port map(ck,clr_c3,'1',I_inc(1),S_Reg(1));

	  
	 I1: somador1bit port map(S_Reg(0),'0',CK5,I_inc(0), aux_Couti(0));
	 I2: somador1bit port map(S_Reg(1),'0',aux_Couti(0),I_inc(1),aux_Couti(1));

	  clr_c3 <= Not(aux_Couti(1) and not I_inc(0) and not I_inc(1));
	  
	  S_C3 <= I_inc;
end logic;