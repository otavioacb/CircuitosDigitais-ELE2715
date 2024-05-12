LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Cofre IS
	PORT(
		clock, load_btn, set_btn: IN STD_LOGIC;
		valor: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		rgb: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		disp1, disp2: OUT STD_LOGIC_VECTOR (7 DOWNTO 0) 
	);
END Cofre;


ARCHITECTURE acesso OF Cofre IS
	
	COMPONENT MDE IS
		PORT(
			ck, rst : IN STD_LOGIC;
			set, load, tmp5, tmp20, result : IN STD_LOGIC;
			cont_senha: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			s : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT Clock5 IS
		PORT(
			ck, load : in  std_logic;
         S_Ck5 : out std_logic
		);
	END COMPONENT;
	
	COMPONENT cont_20 IS 
    PORT (
      ck_20 : in std_logic;
      estado: in std_logic_vector(2 downto 0);
      tempo: out std_logic    
    );
	END COMPONENT;
	
	COMPONENT comparador_igual IS
		PORT(
			reg_senha, senha: IN STD_LOGIC_VECTOR(17 DOWNTO 0);
         result: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT Registradorsenha is
   port (ck, clr , load: in  std_logic;
				S_V6: in std_logic_vector(5 downto 0);
                       S_V18 : out std_logic_vector(17 downto 0));
	end COMPONENT;
	
	COMPONENT Contador3 IS
		port (ck,load: in  std_logic;
								  S_C3 : out std_logic_vector(1 downto 0));
	END COMPONENT;
	
	COMPONENT BCDF IS
	port (SW, SW2: in std_logic_vector(5 downto 0); 	-------SW(senha), SW2(registrador)
         KEY: IN STD_lOGIC_VECTOR(2 DOWNTO 0);
			HEX0, HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
	end COMPONENT;


	SIGNAL tmp5, tmp20, result: STD_LOGIC := '0';
	SIGNAL cnt3: STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL n: STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');
	SIGNAL senha_reg: STD_LOGIC_VECTOR (17 DOWNTO 0) := (OTHERS => '0');
	
BEGIN

FSM: MDE PORT MAP(clock, '0', set_btn, load_btn, tmp5, tmp20, result, cnt3, n);
CK5: Clock5 PORT MAP(clock, load_btn, tmp5);

CNT20: cont_20 PORT MAP(clock, n, tmp20);
CMP: comparador_igual PORT MAP(senha_reg, "110111000111010101", result);

CONT_SENHA: Contador3 PORT MAP(clock, load_btn, cnt3);
REG_SENHA: Registradorsenha PORT MAP(clock, '1', load_btn, valor, senha_reg);
BCD: BCDF PORT MAP(valor, senha_reg(5 DOWNTO 0), n, disp1, disp2);

rgb <= n;

END acesso;