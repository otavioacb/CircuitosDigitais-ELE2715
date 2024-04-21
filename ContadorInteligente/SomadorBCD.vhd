LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SomadorBCD IS
    PORT(
        A_BCD, B_BCD: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        CI_BCD: IN STD_LOGIC;
        S_BCD: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        CO_BCD: OUT STD_LOGIC
    );
END SomadorBCD;

ARCHITECTURE somaBCD OF SomadorBCD IS

    COMPONENT Somador4Bits
        PORT(
            A_S4B, B_S4B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            CI_S4B: IN STD_LOGIC;
            S_S4B: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
            CO_S4B: OUT STD_LOGIC
        );
    END COMPONENT;
    
    SIGNAL SUM_P, CORR: STD_LOGIC_VECTOR (3 DOWNTO 0) := ( OTHERS => '0' );
    SIGNAL CO_P, CHECK_SUM, FALSE_CO: STD_LOGIC;
    
BEGIN

P1: Somador4Bits PORT MAP(A_BCD, B_BCD, CI_BCD, SUM_P, CO_P);

CHECK_SUM <= CO_P OR ( SUM_P(3) AND ( SUM_P(1) OR SUM_P(2) ) );
CORR(1) <= CHECK_SUM;
CORR(2) <= CHECK_SUM;

P2: Somador4Bits PORT MAP(SUM_P, CORR, '0', S_BCD, FALSE_CO);

CO_BCD <= CHECK_SUM;

END somaBCD;
