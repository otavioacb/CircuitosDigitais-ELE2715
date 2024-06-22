LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LIFO IS
	PORT(
		clk, clear : IN STD_LOGIC;
		rd, wr : IN STD_LOGIC;
		w_data : IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		em, fu : OUT STD_LOGIC;
		r_data : OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
	);
END LIFO;

ARCHITECTURE pile OF LIFO IS
	
	COMPONENT BlocoDeControle IS
		PORT(
			clk, clear : IN STD_LOGIC;
			rd, wr : IN STD_LOGIC;
			en_r, en_w, rst : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT cont_rd IS
		 PORT(
			up_dw_cont, en_cont, clk_cont, clr_cont, set_cont: IN STD_LOGIC;
			cont_resut: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		 );
	END COMPONENT;
	
	COMPONENT cont_wr IS
		 PORT(
			up_dw_cont, en_cont, clk_cont, clr_cont: IN STD_LOGIC;
			cont_resut: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		 );
	END COMPONENT;
	
	
	COMPONENT ReconhecerPilha IS
		PORT(
			clk, en_r, en_w : IN STD_LOGIC;
			point_r, point_w : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			em, fu : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT CompPointer IS
		PORT(
			a, b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			out_eq, out_gt, out_lt : OUT STD_LOGIC
		);
	END COMPONENT;
	
	
	COMPONENT demux_1x16 is
			port( A     : in  std_logic;
					S3,S2,S1,S0	: in  std_logic;  
					W     	   : out std_logic_vector(15 downto 0));
	end COMPONENT;
	
	COMPONENT banco_reg is
			port(w_data      : in  std_logic_vector (12 downto 0);
				  clr, clk     : in  std_logic;
				  load         : in std_logic_vector (15 downto 0);
				  S_reg0, S_reg1, S_reg2, S_reg3, S_reg4, S_reg5, S_reg6, S_reg7, S_reg8, S_reg9, S_reg10, S_reg11, S_reg12, S_reg13, S_reg14, S_reg15 : out std_logic_vector (12 downto 0));
	end COMPONENT;
	
	COMPONENT mux_16x1_13 is
			port( P,O,N,M     : in  std_logic_vector(12 downto 0);
					L,K,J,I     : in  std_logic_vector(12 downto 0);
					H,G,F,E     : in  std_logic_vector(12 downto 0);
					D,C,B,A     : in  std_logic_vector(12 downto 0);
					S3,S2,S1,S0	: in  std_logic;  
					W     	   : out std_logic_vector(12 downto 0));
	end COMPONENT;
	
	COMPONENT LoadRead IS
		PORT(
			clk, clear, en : IN STD_LOGIC;
			data_in : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
			data_out : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
		);
	END COMPONENT;
		
	SIGNAL result_wr, result_rd : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL up_dw, en_cont, en_r, en_w, st_em, st_fu, en_result_rd, rst : STD_LOGIC;
	SIGNAL load_reg : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL data, s_0, s_1, s_2, s_3, s_4, s_5, s_6, s_7, s_8, s_9, s_10, s_11, s_12, s_13, s_14, s_15 : STD_LOGIC_VECTOR (12 DOWNTO 0);
	
BEGIN

FSM: BlocoDeControle PORT MAP(clk, clear, rd, wr, en_r, en_w, rst);

up_dw <= en_w;
en_cont <= en_r OR en_w;

CNT_WR: cont_wr PORT MAP(up_dw, en_cont, clk, NOT clear, result_wr);
CNT_RD: cont_rd PORT MAP(up_dw, en_cont, clk, NOT clear, NOT rst, result_rd);

REC: ReconhecerPilha PORT MAP(clk, en_r, en_w, result_rd, result_wr, st_em, st_fu);

em <= st_em;
fu <= st_fu;

DMX: demux_1x16 PORT MAP(en_w, result_wr(3), result_wr(2), result_wr(1), result_wr(0), load_reg);
PILHA: banco_reg PORT MAP(w_data, NOT clear, clk, load_reg, s_0, s_1, s_2, s_3, s_4, s_5, s_6, s_7, s_8, s_9, s_10, s_11, s_12, s_13, s_14, s_15);
MX: mux_16x1_13 PORT MAP(s_15, s_14, s_13, s_12, s_11, s_10, s_9, s_8, s_7, s_6, s_5, s_4, s_3, s_2, s_1, s_0, result_rd(3), result_rd(2), result_rd(1), result_rd(0), data);

LD_RD: LoadRead PORT MAP(clk, clear, en_r, data, r_data);
END pile;
