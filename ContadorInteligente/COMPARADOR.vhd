library ieee;
use ieee.std_logic_1164.all;



entity COMPARADOR is

port(A_mx,B_mn,S_C: in std_logic_vector(11 downto 0);updw : std_logic;igual: out std_logic);

end COMPARADOR;

architecture logic of COMPARADOR is

component Comparador4bits is

port(mx_mn,S_C: in std_logic_vector(3 downto 0); a_Igual_b: in std_logic;Sa_Igual_b: out std_logic);

end component;

component MUX21 is

port(A_mx, B_mn :in std_logic_vector (3 downto 0); updw: in std_logic;S_mxn: out std_logic_vector (3 downto 0));

end component;

signal a_vetor_centena,a_vetor_dezena,a_vetor_unidade,b_vetor_centena,b_vetor_dezena,b_vetor_unidade,RV_vetor_centena,RV_vetor_dezena,RV_vetor_unidade,S_vetor_centena,S_vetor_dezena,S_vetor_unidade:std_logic_vector(3 downto 0);
signal saida_centena, saida_dezena, saida_unidade:std_logic;
signal R_igual_mxm: std_logic;

begin

a_vetor_centena(3 downto 0) <= A_mx(11 downto 8);
b_vetor_centena(3 downto 0) <= B_mn(11 downto 8);
a_vetor_dezena(3 downto 0) <= A_mx(7 downto 4);
b_vetor_dezena(3 downto 0) <= B_mn(7 downto 4);
a_vetor_unidade(3 downto 0) <= A_mx(3 downto 0);
b_vetor_unidade(3 downto 0) <= B_mn(3 downto 0);
RV_vetor_centena(3 downto 0) <= S_C(11 downto 8);
RV_vetor_dezena(3 downto 0) <= S_C(7 downto 4);
RV_vetor_unidade(3 downto 0) <= S_C(3 downto 0);
R_igual_mxm <= '1';

MUX1: MUX21 port map (a_vetor_centena,b_vetor_centena,updw,S_vetor_centena);
MUX2:	MUX21 port map (a_vetor_dezena,b_vetor_dezena,updw,S_vetor_dezena);
MUX3: MUX21 port map (a_vetor_unidade,b_vetor_unidade,updw,S_vetor_unidade);

COMP1: Comparador4bits port map (S_vetor_centena,RV_vetor_centena,R_igual_mxm,saida_centena);
COMP2: Comparador4bits port map (S_vetor_dezena,RV_vetor_dezena,R_igual_mxm,saida_dezena);
COMP3: Comparador4bits port map (S_vetor_unidade,RV_vetor_unidade,R_igual_mxm,saida_unidade);

igual <= saida_centena and saida_dezena and saida_unidade;

end logic;