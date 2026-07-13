library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        x  : in  std_logic;
        y  : in  std_logic;
        ci : in  std_logic;
        s  : out std_logic;
        co : out std_logic
    );
end full_adder;

architecture logic of full_adder is
begin

    s  <= x xor y xor ci;
    co <= (x and y) or (ci and (x xor y));

end logic;