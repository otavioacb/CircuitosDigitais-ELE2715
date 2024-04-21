LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Somador4Bits IS
    PORT(
        A_S4B, B_S4B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        CI_S4B: IN STD_LOGIC;
        S_S4B: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        CO_S4B: OUT STD_LOGIC
    );
END Somador4Bits;


ARCHITECTURE soma4bits OF Somador4Bits IS
    
    COMPONENT SomadorCompleto
        PORT(
            A_SC, B_SC, CI_SC: IN STD_LOGIC;
            S_SC, CO_SC: OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL COS: STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN

S0: SomadorCompleto PORT MAP(A_S4B(0), B_S4B(0), CI_S4B, S_S4B(0), COS(0));
S1: SomadorCompleto PORT MAP(A_S4B(1), B_S4B(1), COS(0), S_S4B(1), COS(1));
S2: SomadorCompleto PORT MAP(A_S4B(2), B_S4B(2), COS(1), S_S4B(2), COS(2));
S3: SomadorCompleto PORT MAP(A_S4B(3), B_S4B(3), COS(2), S_S4B(3), CO_S4B);

END soma4bits;
