LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MaquinaDeTroco IS 
	PORT(
		clk, rst, T : IN STD_LOGIC;
		V : IN STD_LOGIC_VECTOR  (10 DOWNTO 0);
		C : IN STD_LOGIC_VECTOR  (5 DOWNTO 0);
		I : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
		L : OUT STD_LOGIC
	);
END MaquinaDeTroco;

ARCHITECTURE troco OF MaquinaDeTroco IS

	COMPONENT REG_11BITS_ENABLE IS
		PORT(
			CLR, LOAD, CLK: IN STD_LOGIC;
			V: IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			S: OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT MDE IS
		PORT(
			ck, rst : IN STD_LOGIC;
			T, vazio, resto_d, resto_e: IN STD_LOGIC;
			L, BS: OUT STD_LOGIC;
			s : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT mux_2x1_vec is
		PORT (
			A, B : in  STD_LOGIC_VECTOR (10 DOWNTO 0);
			SLT    : in  STD_LOGIC;
			Y    : out STD_LOGIC_VECTOR (10 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT REG_11BITS IS
		PORT(
			CLR, CLK: IN STD_LOGIC;
			V: IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			S: OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT CofreMoedas IS
		PORT(
			troco	: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
			cx : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			slt_moeda : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT MUX_moeda is 
		 port (
		  key_comp : in STD_LOGIC_VECTOR (2 downto 0);
		  S_sub : out STD_LOGIC_VECTOR (10 downto 0)
		 );
	end COMPONENT;
	
	COMPONENT Subtrator_11Bits is
		 Port(
			  A, B: IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			  S: OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
		 );
	END COMPONENT;
	
	COMPONENT comparador_zero is
	 port (diff_resul: in  std_logic_vector(10 downto 0);
			 result: out std_logic
		);
	end COMPONENT;
	
	COMPONENT Demux IS
			PORT(
			S: IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
			I: IN  STD_LOGIC;
			O: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
		);
	END COMPONENT;
	
	SIGNAL analisa_troco, vazio, resto_d, resto_e, BS, slt_troco, comp_troco, estado_e : STD_LOGIC;
	SIGNAL s, slt_moeda : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL troco_salvo, troco_slt, troco_sub, restante, valor_moeda : STD_LOGIC_VECTOR (10 DOWNTO 0);
	SIGNAL moedas_liberadas : STD_LOGIC_VECTOR (7 DOWNTO 0);
	
BEGIN 

FSM: MDE PORT MAP(clk, rst, T, vazio, resto_d, resto_e, L, BS, s);

REG_V: REG_11BITS_ENABLE PORT MAP(NOT rst, T, clk, V, troco_salvo);

slt_troco <= BS OR resto_d;
MUX_TROCO: mux_2x1_vec PORT MAP(restante, troco_salvo, slt_troco, troco_slt);

REG_RESTO: REG_11BITS PORT MAP(NOT rst, clk, troco_slt, troco_sub);

MOEDA: CofreMoedas PORT MAP(troco_sub, C, slt_moeda);
vazio <= NOT C(5) AND NOT C(4) AND NOT C(3) AND NOT C(2) AND NOT C(1) AND NOT C(0);

SLT_VALOR: MUX_moeda PORT MAP(slt_moeda, valor_moeda);

SUB: Subtrator_11Bits PORT MAP(troco_sub, valor_moeda, restante);

COMP: Comparador_zero PORT MAP(restante, comp_troco);

estado_e <= s(2) AND NOT s(1) AND NOT s(0);

IX: Demux PORT MAP(slt_moeda, estado_e, I);

resto_d <= comp_troco AND NOT estado_e;
resto_e <= comp_troco AND estado_e;

END troco;