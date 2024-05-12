library ieee;
use ieee.std_logic_1164.all;

entity Clock5 is
   port (ck, load : in  std_logic;
                       S_ck5 : out std_logic);
end Clock5;

architecture logic of Clock5 is

component ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;


COMPONENT SomadorCompleto IS
	PORT(
		A_SC, B_SC, CI_SC: IN STD_LOGIC;
		S_SC, CO_SC: OUT STD_LOGIC
	);
END COMPONENT;


signal S_Reg: std_logic_vector (2 downto 0):=(others=> '0'); 
signal I_inc5 : std_logic_vector (2 downto 0):=(others=>'0');
signal aux_Couti : std_logic_vector(2 downto 0):=(others=>'0');
signal clr_cl5 : std_logic:='0';
   begin
	
		
	 clr_cl5 <= NOT((I_inc5(0) xnor '0') and (I_inc5(1) xnor '1') and (I_inc5(2) xnor '1'));
	  
	 Tempo0: ffd port map(ck,clr_cl5,'1',I_inc5(0),S_Reg(0));
	 Tempo1: ffd port map(ck,clr_cl5,'1',I_inc5(1),S_Reg(1));
    Tempo2: ffd port map(ck,clr_cl5,'1',I_inc5(2),S_Reg(2));	
	  
    I1: SomadorCompleto port map(S_Reg(0), '0', load, I_inc5(0), aux_Couti(0));
	 I2: SomadorCompleto port map(S_Reg(1), '0', aux_Couti(0), I_inc5(1), aux_Couti(1));
	 I3: SomadorCompleto port map(S_Reg(2), '0', aux_Couti(1), I_inc5(2), aux_Couti(2));
		
	 S_Ck5 <= ( I_inc5(0) and not I_inc5(1) and I_inc5(2));

end logic;