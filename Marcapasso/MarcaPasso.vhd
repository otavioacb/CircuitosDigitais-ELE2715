LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MarcaPasso IS
	PORT(
		clk, clr, slt : IN STD_LOGIC;
		sw0, sw1 : IN STD_LOGIC;
		sam, svm, pa, pv   : OUT STD_LOGIC;
		teste : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END MarcaPasso;

ARCHITECTURE passo OF MarcaPasso IS
	
	COMPONENT ContadorPasso IS 
		PORT(
			clk, t: IN STD_LOGIC;
			z: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT Contador5Desc IS 
		PORT(
			clk, t: IN STD_LOGIC;
			z: OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT Coracao IS 
		PORT(
			clk : IN STD_LOGIC;
			en_a, en_v : IN STD_LOGIC; 
			sa_c, sv_c : OUT STD_LOGIC
		);

	END COMPONENT;
	
	COMPONENT MDE IS
		PORT(
			ck, rst : IN STD_LOGIC;
			sa, sv, za, zv: IN STD_LOGIC;
			ta, tv, pa, pv: OUT STD_LOGIC;
			s : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT ck_div_1 is
		port (ck_in : in  std_logic;
				ck_out: out std_logic);
	end COMPONENT;
	
	COMPONENT ck_div_100 is
		port (ck_in : in  std_logic;
				ck_out: out std_logic);
	end COMPONENT;

	SIGNAL zs, ts : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL sa, sv, clk_1, clk_100, clk_final : STD_LOGIC;
	SIGNAL st : STD_LOGIC_VECTOR(2 DOWNTO 0);
	
BEGIN 

ck1: ck_div_1 PORT MAP(clk, clk_1);
ck100: ck_div_100 PORT MAP(clk, clk_100);

clk_final <= (clk_1 AND NOT slt) OR (clk_100 AND slt);

COR: Coracao PORT MAP(clk_final, sw1, sw0, sa, sv);

M: MDE PORT MAP(clk_final, NOT clr, sa, sv, zs(0), zs(1), ts(0), ts(1), pa, pv, teste);

C20: ContadorPasso PORT MAP(clk_final, ts(0), zs(0));
C5: Contador5Desc PORT MAP(clk_final, ts(1), zs(1));

sam <= sa;
svm <= sv;

END passo;