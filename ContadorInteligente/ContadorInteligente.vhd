LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY ContadorInteligente IS
	PORT(
		UP_DW, STEP, MX_MI, LOAD, CLR, CLK: IN STD_LOGIC;
		A: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		LED, CK: OUT STD_LOGIC;
		HEX0, HEX1, HEX2: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END ContadorInteligente;


ARCHITECTURE count OF ContadorInteligente IS

	COMPONENT ck_div IS
		PORT (ck_in : IN  STD_LOGIC;
				ck_out: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT RegistradorPasso is
		 port (D_reg_p: in  std_logic_vector(3 downto 0);
		  load_step, reg_step, clr_reg_p, clk_reg_p: in std_logic;
					Q_reg_p: out std_logic_vector(3 downto 0));
	end COMPONENT;
	
	COMPONENT RegistradorMaximo is
		 port (D_reg_mx: in  std_logic_vector(11 downto 0);
		  load_mx, mx, clr_reg_mx, clk_reg_mx: in std_logic;
					Q_reg_mx: out std_logic_vector(11 downto 0));
	end COMPONENT;
	
	COMPONENT RegistradorMinimo is
		 port (D_reg_mi: in  std_logic_vector(11 downto 0);
		  load_mi, mi, clr_reg_mi, clk_reg_mi: in std_logic;
					Q_reg_mi: out std_logic_vector(11 downto 0));
	end COMPONENT;
	
	COMPONENT ContadorBCD IS		
		PORT(
			MX_CNT, MI_CNT: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
			STP_CNT: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			UPDW_CNT, CK_CNT, CLR_CNT: IN STD_LOGIC;
			Q_CNT: OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
			LED_CNT: OUT STD_LOGIC
		);
	END COMPONENT;
		
	COMPONENT Display7Segmentos IS 
		PORT(
			A_D7S: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			S_D7S: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END COMPONENT;
		
	SIGNAL CLK_FINAL: STD_LOGIC;
	SIGNAL A_MX, A_MI, Q: STD_LOGIC_VECTOR (11 DOWNTO 0);
	SIGNAL A_STEP: STD_LOGIC_VECTOR (3 DOWNTO 0);
	
BEGIN

DIV: ck_div PORT MAP(CLK, CLK_FINAL);
CK <= CLK_FINAL;

REG1: RegistradorMaximo PORT MAP(A, NOT LOAD, MX_MI, CLR, CLK_FINAL, A_MX);
REG2: RegistradorMinimo PORT MAP(A, NOT LOAD, MX_MI, CLR, CLK_FINAL, A_MI);
REG3: RegistradorPasso  PORT MAP(A(3 DOWNTO 0), NOT LOAD, NOT STEP, CLR, CLK_FINAL, A_STEP);

CONT: ContadorBCD       PORT MAP(A_MX, A_MI, A_STEP, UP_DW, CLK_FINAL, CLR, Q, LED);

UNID: Display7Segmentos PORT MAP(Q(3 DOWNTO 0),  HEX0);
DEZE: Display7Segmentos PORT MAP(Q(7 DOWNTO 4),  HEX1);
CENT: Display7Segmentos PORT MAP(Q(11 DOWNTO 8), HEX2);

END count;