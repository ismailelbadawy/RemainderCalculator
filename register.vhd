Library ieee;
use ieee.std_logic_1164.all;

entity reg is
    port(
        clk, reset, input, enable: in std_logic;
        output : out std_logic);
    end entity;
    
    architecture my_arch of reg is 
    begin
    process (clk, reset)
    begin
        if (reset = '1') then
            output <= '0';
        elsif falling_edge(clk) and enable = '1' then
            output <= input;
        end if;
    end process;
end architecture;