library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Practica1 is
Port (
    sw_cero  : in STD_LOGIC;
    sw_inc   : in STD_LOGIC;
    sw_datos : in STD_LOGIC_VECTOR(4 downto 0);
    leds     : out STD_LOGIC_VECTOR(5 downto 0)
);
end Practica1;

architecture Comportamiento of Practica1 is

    signal conteo   : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    signal modo_inc : STD_LOGIC := '0'; 

    signal retener_cero : STD_LOGIC := '0';
    signal datos_foto   : STD_LOGIC_VECTOR(4 downto 0) := "00000";

begin

    process(sw_cero, sw_datos)
    begin
        if sw_cero = '1' then
            retener_cero <= '1';
            datos_foto <= sw_datos;
            
        elsif sw_datos /= datos_foto then
            retener_cero <= '0';
        end if;
    end process;


    -- MEMORIA
    process(sw_cero, sw_inc)
    begin
        if sw_cero = '1' then
            conteo <= "00000";
            modo_inc <= '0';
            
        elsif rising_edge(sw_inc) then
            modo_inc <= '1'; 
            
            if modo_inc = '0' then
                conteo <= sw_datos + 1;
            else
                conteo <= conteo + 1;
            end if;
        end if;
    end process;


    -- LEDS
    process(sw_cero, modo_inc, sw_datos, conteo, retener_cero)
    begin
        if sw_cero = '1' then
            leds <= "000000";
            
        elsif retener_cero = '1' then
            leds <= "000000";
            
        elsif modo_inc = '0' then
            leds(4 downto 0) <= sw_datos; 
            leds(5) <= '0'; -- indicador apagado
            
        else
            leds(4 downto 0) <= conteo; 
            leds(5) <= '1'; -- indicador de incremento
        end if;
    end process;

end Comportamiento;