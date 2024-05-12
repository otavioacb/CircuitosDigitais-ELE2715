
library ieee;
use ieee.std_logic_1164.all;

entity Registradorsenha is
   port (ck, clr , load: in  std_logic;
				S_V6: in std_logic_vector(5 downto 0);
                       S_V18 : out std_logic_vector(17 downto 0));
end Registradorsenha;

architecture logic of Registradorsenha is

component ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;

component Contador3 is
   port (ck, load: in  std_logic;
                       S_C3 : out std_logic_vector(1 downto 0));
end component;

component Demux is
  port(S_C3 : in std_logic_vector(1 downto 0);
       V: in std_logic_vector(5 downto 0);
       V_S1,V_S2,V_S3: out std_logic_vector(5 downto 0));
  end component;

   signal aux_C3: std_logic_vector(1 downto 0);
	signal aux_VS1,aux_VS2,aux_VS3: std_logic_vector(5 downto 0);
	signal S_Vaux1,S_Vaux2,S_Vaux3: std_logic_vector(5 downto 0);
	signal S_V18aux : std_logic_vector (17 downto 0);
   begin
	 
	  CR: Contador3 port map (ck,load,aux_C3);
	  DM: Demux port map (aux_C3,S_V6,aux_VS1,aux_VS2,aux_VS3);
	  
	  S_Vaux1(0)<=S_V18aux(0) or (aux_C3(0)  and not aux_C3(1) and aux_VS1(0));
	  S_Vaux1(1)<=S_V18aux(1) or (aux_C3(0)  and not aux_C3(1) and aux_VS1(1));
	  S_Vaux1(2)<=S_V18aux(2) or (aux_C3(0)  and not aux_C3(1) and aux_VS1(2));
	  S_Vaux1(3)<=S_V18aux(3) or (aux_C3(0)  and not aux_C3(1) and aux_VS1(3));
	  S_Vaux1(4)<=S_V18aux(4) or (aux_C3(0)  and not aux_C3(1) and aux_VS1(4));
	  S_Vaux1(5)<=S_V18aux(5) or (aux_C3(0)  and not aux_C3(1) and aux_VS1(5));
	  S_Vaux2(0)<= S_V18aux(6) or (not  aux_C3(0) and  aux_C3(1) and aux_VS2(0));
	  S_Vaux2(1) <= S_V18aux(7) or (not  aux_C3(0) and  aux_C3(1) and aux_VS2(1));
	  S_Vaux2(2)<= S_V18aux(8) or (not  aux_C3(0) and  aux_C3(1) and aux_VS2(2));
	  S_Vaux2(3)<= S_V18aux(9) or (not  aux_C3(0) and  aux_C3(1)and aux_VS2(3));
	  S_Vaux2(4) <= S_V18aux(10) or (not  aux_C3(0) and  aux_C3(1) and aux_VS2(4));
	  S_Vaux2(5) <= S_V18aux(11) or (not  aux_C3(0) and  aux_C3(1) and aux_VS2(5));
	  S_Vaux3(0) <= S_V18aux(12) or (aux_C3(0) and aux_C3(1) and aux_VS3(0));
	  S_Vaux3(1) <= S_V18aux(13) or (aux_C3(0) and aux_C3(1) and aux_VS3(1));
	  S_Vaux3(2) <= S_V18aux(14) or (aux_C3(0) and aux_C3(1) and aux_VS3(2));
	  S_Vaux3(3) <= S_V18aux(15) or (aux_C3(0) and aux_C3(1) and aux_VS3(3));
	  S_Vaux3(4) <= S_V18aux(16) or (aux_C3(0) and aux_C3(1) and aux_VS3(4));
	  S_Vaux3(5)<= S_V18aux(17) or (aux_C3(0) and aux_C3(1) and aux_VS3(5));
	  
	  V1: ffd port map(ck,clr,'1',S_Vaux1(0),S_V18aux(0));
	  V2: ffd port map(ck,clr,'1',S_Vaux1(1),S_V18aux(1));
     V3: ffd port map(ck,clr,'1',S_Vaux1(2),S_V18aux(2));
	  V4: ffd port map(ck,clr,'1',S_Vaux1(3),S_V18aux(3));	
	  V5: ffd port map(ck,clr,'1',S_Vaux1(4),S_V18aux(4));	
	  V6: ffd port map(ck,clr,'1',S_Vaux1(5),S_V18aux(5));		
	  
	  V7: ffd port map(ck,clr,'1',S_Vaux2(0),S_V18aux(6));
	  V8: ffd port map(ck,clr,'1',S_Vaux2(1),S_V18aux(7));
     V9: ffd port map(ck,clr,'1',S_Vaux2(2),S_V18aux(8));
	  V10: ffd port map(ck,clr,'1',S_Vaux2(3),S_V18aux(9));	
	  V11: ffd port map(ck,clr,'1',S_Vaux2(4),S_V18aux(10));	
	  V12: ffd port map(ck,clr,'1',S_Vaux2(5),S_V18aux(11));
	  
	  V13: ffd port map(ck,clr,'1',S_Vaux3(0),S_V18aux(12));
	  V14: ffd port map(ck,clr,'1',S_Vaux3(1),S_V18aux(13));
     V15: ffd port map(ck,clr,'1',S_Vaux3(2),S_V18aux(14));
	  V16: ffd port map(ck,clr,'1',S_Vaux3(3),S_V18aux(15));	
	  V17: ffd port map(ck,clr,'1',S_Vaux3(4),S_V18aux(16));	
	  V18: ffd port map(ck,clr,'1',S_Vaux3(5),S_V18aux(17));		  
	  
	  S_V18 <= S_V18aux;

end logic;