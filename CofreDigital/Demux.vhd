library ieee;
use ieee.std_logic_1164.all;

entity Demux is
  port(S_C3 : in std_logic_vector(1 downto 0);
       V: in std_logic_vector(5 downto 0);
       V_S1,V_S2,V_S3: out std_logic_vector(5 downto 0));
  end Demux;
  
  architecture logic of Demux is
  begin
    V_S1(0)<= ( S_C3(0)  and not S_C3(1) and V(0));
	 V_S1(1)<=( S_C3(0)  and not S_C3(1)  and V(1));
	 V_S1(2)<=(S_C3(0)  and not S_C3(1)  and V(2)) ;
	 V_S1(3)<=(  S_C3(0)  and not S_C3(1)  and V(3));
	 V_S1(4)<=( S_C3(0) and not S_C3(1) and V(4)) ;
	 V_S1(5)<=(  S_C3(0) and not S_C3(1) and V(5)) ;
	 
    V_S2(0)<= ( not  S_C3(0) and  S_C3(1) and V(0));
	 V_S2(1)<=(  not S_C3(0) and  S_C3(1) and V(1));
	 V_S2(2)<=( not  S_C3(0) and  S_C3(1)  and V(2)) ;
	 V_S2(3)<=(  not S_C3(0) and  S_C3(1)  and V(3));
	 V_S2(4)<=(  not S_C3(0) and  S_C3(1) and V(4)) ;
	 V_S2(5)<=(  not S_C3(0) and  S_C3(1)  and V(5)) ;
	 
    V_S3(0)<= ( S_C3(0) and S_C3(1) and V(0));
	 V_S3(1)<=(S_C3(0) and S_C3(1)  and V(1));
	 V_S3(2)<=(S_C3(0) and S_C3(1)  and V(2)) ;
	 V_S3(3)<=( S_C3(0) and S_C3(1)  and V(3));
	 V_S3(4)<=(  S_C3(0) and S_C3(1) and V(4)) ;
	 V_S3(5)<=(  S_C3(0) and S_C3(1)  and V(5)) ;
    
   end logic;