library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Practica2 is
    port(
        A  : in  std_logic_vector(1 downto 0);
        B  : in  std_logic_vector(1 downto 0);
        Z  : in  std_logic_vector(2 downto 0);
        C0 : in  std_logic;

        R    : out std_logic_vector(2 downto 0);
        Cout : out std_logic
    );
end Practica2;

architecture definitiva of Practica2 is

    signal A_u, B_u : unsigned(1 downto 0);
    signal RESULT   : unsigned(2 downto 0);

begin

A_u <= unsigned(A);
B_u <= unsigned(B);

process(A_u, B_u, Z, C0)
begin

    RESULT <= (others => '0');
    Cout <= '0';

    case Z is

        -- LÓGICAS
        when "000" => RESULT <= "0" & (A_u or B_u);
        when "001" => RESULT <= "0" & (A_u xor B_u);
        when "010" => RESULT <= "0" & (A_u and B_u);
        when "011" => RESULT <= "0" & (not A_u);

        -- A / A+1
        when "100" =>
            if C0 = '0' then
                RESULT <= "0" & A_u;
            else
                RESULT <= ("0" & A_u) + 1;
            end if;

        -- A + B (+C0)
        when "101" =>
            RESULT <= ("0" & A_u) + ("0" & B_u) + unsigned'( "00" & C0 );

        -- RESTA CORRECTA
        when "110" =>
            if C0 = '1' then
                RESULT <= ("0" & A_u) - ("0" & B_u);
            else
                RESULT <= ("0" & A_u) - ("0" & B_u) - 1;
            end if;

        -- A - 1
        when "111" =>
            if C0 = '0' then
                RESULT <= ("0" & A_u) - 1;
            else
                RESULT <= "0" & A_u;
            end if;

        when others =>
            RESULT <= "000";

    end case;

    R <= std_logic_vector(RESULT);
    Cout <= RESULT(2);

end process;

end definitiva;
