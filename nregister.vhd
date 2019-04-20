Library ieee;
use ieee.std_logic_1164.all;

entity nreg is
    generic ( n : integer := 16);
    port(
        clk, reset, enable : in std_logic;
        input : in std_logic_vector(n-1 downto 0);
        output : out std_logic_vector(n-1 downto 0));
    end entity;
    
    architecture my_arch of nreg is
    component reg is
    port(
        clk, reset, input, enable: in std_logic;
        output : out std_logic);
    end component;
    begin
        loop1 : for i in 0 to n-1 generate 
            fx: reg port map (clk, reset, input(i), enable, output(i));
        end generate;
end architecture;