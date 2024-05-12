library ieee;
use ieee.std_logic_1164.all;


entity U is
	port (A3,A2,A1,A0: in std_logic;
			S3,S2,S1,S0: out std_logic);
	end U;

		architecture log of U is
	
begin	
 
 S3 <=( A3 and not A2 and not A1) or (not A3 and A2 and A0) or ( not A3 and  A2 and A1);
  
 S2 <=(not A3 and  A2 and not A1 and not A0) or ( A3 and not A2 and not A1 and A0) ;
 
 S1 <=(not A3 and not A2 and A1) or (not A3 and  A1 and A0) or ( A3 and not A2 and not A1 and not A0);
 
 S0 <=(not A3 and not A2 and A0) or (not A3 and A2 and A1 and not A0) or ( A3 and not A2 and not A1 and not A0);
 
 
end log;