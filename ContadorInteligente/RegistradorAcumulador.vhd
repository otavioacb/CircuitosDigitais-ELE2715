LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegistradorAcumulador IS
   PORT(
		A_RA: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		CK_RA, CLR_RA: IN STD_LOGIC;
		Q_RA: OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
	);
END RegistradorAcumulador;

ARCHITECTURE memoria OF RegistradorAcumulador IS
	
	COMPONENT ffd IS
		PORT(
			CK, CLR, SET, D: IN  STD_LOGIC;
		   Q: OUT STD_LOGIC
		);
	END COMPONENT;
	
BEGIN

FF0:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(0), Q_RA(0));
FF1:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(1), Q_RA(1));
FF2:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(2), Q_RA(2));
FF3:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(3), Q_RA(3));

FF4:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(4), Q_RA(4));
FF5:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(5), Q_RA(5));
FF6:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(6), Q_RA(6));
FF7:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(7), Q_RA(7));

FF8:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(8), Q_RA(8));
FF9:  ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(9), Q_RA(9));
FF10: ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(10), Q_RA(10));
FF11: ffd PORT MAP(CK_RA, CLR_RA, '1', A_RA(11), Q_RA(11));

END memoria;