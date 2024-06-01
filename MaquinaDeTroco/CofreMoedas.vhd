LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CofreMoedas IS
	PORT(
		troco	: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		cx : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		slt_moeda : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
	);
END CofreMoedas;

ARCHITECTURE cofre OF CofreMoedas IS
	
	COMPONENT ComparadorCentavos IS
		PORT(
			cent_a, cent_b : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
			cent_out_lt : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT ComparadorReais IS
		PORT(
			reais_a, reais_b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			reais_out_lt : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT SeletorDeMoedas IS
		PORT(
			m : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			x, y, z : OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL reais : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL centavos : STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL comp_lt, libera_moeda : STD_LOGIC_VECTOR (5 DOWNTO 0);
	
BEGIN

reais <= troco(10 DOWNTO 7);
centavos <= troco(6 DOWNTO 0);

-- moeda 1,00
CP1: ComparadorReais    PORT MAP(reais, "0001", comp_lt(5));
libera_moeda(5) <= NOT comp_lt(5) AND cx(5);

-- moeda 0,50
CP2: ComparadorCentavos PORT MAP(centavos, "0110010", comp_lt(4));
libera_moeda(4) <= NOT comp_lt(4) AND cx(4);

-- moeda 0,25
CP3: ComparadorCentavos PORT MAP(centavos, "0011001", comp_lt(3));
libera_moeda(3) <= NOT comp_lt(3) AND cx(3);

-- moeda 0,10
CP4: ComparadorCentavos PORT MAP(centavos, "0001010", comp_lt(2));
libera_moeda(2) <= NOT comp_lt(2) AND cx(2);

-- moeda 0,05
CP5: ComparadorCentavos PORT MAP(centavos, "0000101", comp_lt(1));
libera_moeda(1) <= NOT comp_lt(1) AND cx(1);

-- moeda 0,01
CP6: ComparadorCentavos PORT MAP(centavos, "0000001", comp_lt(0));
libera_moeda(0) <= NOT comp_lt(0) AND cx(0);

MOE: SeletorDeMoedas PORT MAP(libera_moeda, slt_moeda(2), slt_moeda(1), slt_moeda(0)); 

END cofre;