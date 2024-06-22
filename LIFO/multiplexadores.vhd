--#####################################
--# MUX 16x1_13  #  16 entradas de 13 bit #
--#####################################
---============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity mux_16x1_13 is
		port( P,O,N,M     : in  std_logic_vector(12 downto 0);
				L,K,J,I     : in  std_logic_vector(12 downto 0);
				H,G,F,E     : in  std_logic_vector(12 downto 0);
				D,C,B,A     : in  std_logic_vector(12 downto 0);
		      S3,S2,S1,S0	: in  std_logic;  
				W     	   : out std_logic_vector(12 downto 0));
end mux_16x1_13;

architecture ckt of mux_16x1_13 is
  
component mux_16x1 is
		port( enable      : in  std_logic;
		      P,O,N,M     : in  std_logic;
				L,K,J,I     : in  std_logic;
				H,G,F,E     : in  std_logic;
				D,C,B,A     : in  std_logic;
		      S3,S2,S1,S0	: in  std_logic;  
				W     	   : out std_logic);
end component;

------ SINAIS AUXILIARES ------------------------------------------------------	
signal enable : std_logic;

--------- EXECU��O DO CODIGO---------------------------------------------------
begin
  
enable <= '1';

MUX_00: mux_16x1 port map (enable,P(0),O(0),N(0),M(0),L(0),K(0),J(0),I(0),H(0),G(0),F(0),E(0),D(0),C(0),B(0),A(0),S3,S2,S1,S0, W(0));
MUX_01: mux_16x1 port map (enable,P(1),O(1),N(1),M(1),L(1),K(1),J(1),I(1),H(1),G(1),F(1),E(1),D(1),C(1),B(1),A(1),S3,S2,S1,S0, W(1));
MUX_02: mux_16x1 port map (enable,P(2),O(2),N(2),M(2),L(2),K(2),J(2),I(2),H(2),G(2),F(2),E(2),D(2),C(2),B(2),A(2),S3,S2,S1,S0, W(2));
MUX_03: mux_16x1 port map (enable,P(3),O(3),N(3),M(3),L(3),K(3),J(3),I(3),H(3),G(3),F(3),E(3),D(3),C(3),B(3),A(3),S3,S2,S1,S0, W(3));
MUX_04: mux_16x1 port map (enable,P(4),O(4),N(4),M(4),L(4),K(4),J(4),I(4),H(4),G(4),F(4),E(4),D(4),C(4),B(4),A(4),S3,S2,S1,S0, W(4));
MUX_05: mux_16x1 port map (enable,P(5),O(5),N(5),M(5),L(5),K(5),J(5),I(5),H(5),G(5),F(5),E(5),D(5),C(5),B(5),A(5),S3,S2,S1,S0, W(5));
MUX_06: mux_16x1 port map (enable,P(6),O(6),N(6),M(6),L(6),K(6),J(6),I(6),H(6),G(6),F(6),E(6),D(6),C(6),B(6),A(6),S3,S2,S1,S0, W(6));
MUX_07: mux_16x1 port map (enable,P(7),O(7),N(7),M(7),L(7),K(7),J(7),I(7),H(7),G(7),F(7),E(7),D(7),C(7),B(7),A(7),S3,S2,S1,S0, W(7));
MUX_08: mux_16x1 port map (enable,P(8),O(8),N(8),M(8),L(8),K(8),J(8),I(8),H(8),G(8),F(8),E(8),D(8),C(8),B(8),A(8),S3,S2,S1,S0, W(8));
MUX_09: mux_16x1 port map (enable,P(9),O(9),N(9),M(9),L(9),K(9),J(9),I(9),H(9),G(9),F(9),E(9),D(9),C(9),B(9),A(9),S3,S2,S1,S0, W(9));

MUX_10: mux_16x1 port map (enable,P(10),O(10),N(10),M(10),L(10),K(10),J(10),I(10),H(10),G(10),F(10),E(10),D(10),C(10),B(10),A(10),S3,S2,S1,S0, W(10));
MUX_11: mux_16x1 port map (enable,P(11),O(11),N(11),M(11),L(11),K(11),J(11),I(11),H(11),G(11),F(11),E(11),D(11),C(11),B(11),A(11),S3,S2,S1,S0, W(11));
MUX_12: mux_16x1 port map (enable,P(12),O(12),N(12),M(12),L(12),K(12),J(12),I(12),H(12),G(12),F(12),E(12),D(12),C(12),B(12),A(12),S3,S2,S1,S0, W(12));
    
end ckt;
---======================================= FIM ==================================

--#####################################
--# MUX 16x1  #  16 entradas de 1 bit #
--#####################################
---============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity mux_16x1 is
		port( enable      : in  std_logic;
		      P,O,N,M     : in  std_logic;
				L,K,J,I     : in  std_logic;
				H,G,F,E     : in  std_logic;
				D,C,B,A     : in  std_logic;
		      S3,S2,S1,S0	: in  std_logic;  
				W     	   : out std_logic);
end mux_16x1;

architecture ckt of mux_16x1 is

------ SINAIS AUXILIARES ------------------------------------------------------	
signal S : std_logic_vector (15 downto 0);

--------- EXECU��O DO CODIGO---------------------------------------------------
begin
    S(0) <= enable and A and (not S3) and (not S2) and (not S1) and (not S0);
	 
	 S(1) <= enable and B and (not S3) and (not S2) and (not S1) and (S0);
	 
	 S(2) <= enable and C and (not S3) and (not S2) and (S1) and (not S0);
	 
	 S(3) <= enable and D and (not S3) and (not S2) and (S1) and (S0);
	 
	 S(4) <= enable and E and (not S3) and (S2) and (not S1) and (not S0);
	 
	 S(5) <= enable and F and (not S3) and (S2) and (not S1) and (S0);
	 
	 S(6) <= enable and G and (not S3) and (S2) and (S1) and (not S0);
	 
	 S(7) <= enable and H and (not S3) and (S2) and (S1) and (S0);
	 
	 S(8)  <= enable and I and (S3) and (not S2) and (not S1) and (not S0);
	 
	 S(9)  <= enable and J and (S3) and (not S2) and (not S1) and (S0);
	 
	 S(10) <= enable and K and (S3) and (not S2) and (S1) and (not S0);
	 
	 S(11) <= enable and L and (S3) and (not S2) and (S1) and (S0);
	 
	 S(12) <= enable and M and (S3) and (S2) and (not S1) and (not S0);
	 
	 S(13) <= enable and N and (S3) and (S2) and (not S1) and (S0);
	 
	 S(14) <= enable and O and (S3) and (S2) and (S1) and (not S0);
	 
	 S(15) <= enable and P and (S3) and (S2) and (S1) and (S0);
	 
			
	 W <= S(15) or S(14) or S(13) or S(12) or  S(11) or S(10) or S(9) or  S(8) or S(7) or S(6) or S(5) or S(4) or S(3) or S(2) or S(1) or S(0);
end ckt;

--############### 
--# DEMUX 1x16  # 
--############### 
---============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity demux_1x16 is
		port( A     : in  std_logic;
		      S3,S2,S1,S0	: in  std_logic;  
				W     	   : out std_logic_vector(15 downto 0));
end demux_1x16;

architecture ckt of demux_1x16 is

------ SINAIS AUXILIARES ------------------------------------------------------	
signal S : std_logic_vector (15 downto 0);

--------- EXECU��O DO CODIGO---------------------------------------------------
begin
    W(0) <= A and (not S3) and (not S2) and (not S1) and (not S0);
	 
	 W(1) <= A and (not S3) and (not S2) and (not S1) and (S0);
	 
	 W(2) <= A and (not S3) and (not S2) and (S1) and (not S0);
	 
	 W(3) <= A and (not S3) and (not S2) and (S1) and (S0);
	 
	 W(4) <= A and (not S3) and (S2) and (not S1) and (not S0);
	 
	 W(5) <= A and (not S3) and (S2) and (not S1) and (S0);
	 
	 W(6) <= A and (not S3) and (S2) and (S1) and (not S0);
	 
	 W(7) <= A and (not S3) and (S2) and (S1) and (S0);
	 
	 W(8)  <= A and (S3) and (not S2) and (not S1) and (not S0);
	 
	 W(9)  <= A and (S3) and (not S2) and (not S1) and (S0);
	 
	 W(10) <= A and (S3) and (not S2) and (S1) and (not S0);
	 
	 W(11) <= A and (S3) and (not S2) and (S1) and (S0);
	 
	 W(12) <= A and (S3) and (S2) and (not S1) and (not S0);
	 
	 W(13) <= A and (S3) and (S2) and (not S1) and (S0);
	 
	 W(14) <= A and (S3) and (S2) and (S1) and (not S0);
	 
	 W(15) <= A and (S3) and (S2) and (S1) and (S0);
	 
			
end ckt;
---======================================= FIM ==================================
