Library ieee;
use ieee.std_logic_1164.all;

entity StageOne is 
    port(
        clk, rst, start : in std_logic;
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(3 downto 0);
        A_reg : out std_logic_vector(7 downto 0);
        B_reg : out std_logic_vector(7 downto 0);
        start_reg, err : out std_logic
    );

end StageOne;

architecture fetch of StageOne is

begin
    process(clk, rst, start)
    begin
        if (rst = '1') then
            A_reg <= (others => '0');
            B_reg <= (others => '0');
            err <= '0';
        elsif rising_edge(clk) then
            -- A must pass as it is.
            if(start = '1') then
                A_reg <= A;
                B_reg <= B & '0' & '0' & '0' &'0';
                if(B(3) /= '1') then
                    err <= '1';
                else 
                    err <= '0';
                end if;
            end if;
            start_reg <= start;
        end if;
    end process;
end fetch;