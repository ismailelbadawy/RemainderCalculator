Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DifferenceStage is
  port (
    clk, rst, start, err : in std_logic;
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    A_reg, B_reg : out std_logic_vector(7 downto 0);
    start_reg : out std_logic;
    err_reg : out std_logic
  );
end entity;


architecture stages of DifferenceStage is
    
begin
    process (clk, rst)
    begin
        if(rst = '1') then
            A_reg <= (others => '0');
            B_reg <= (others => '0');
            start_reg <= '0';
            err_reg <= '0';
        elsif rising_edge(clk) then
            if(start = '1') then
                B_reg <= '0'&B(7 downto 1);
                start_reg <= start;
                err_reg <= err;
                if(A > B) then
                    A_reg <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) - to_integer(unsigned(B)), 8));
                else 
                    A_reg <= A;
                end if;
            end if;
        end if;
    end process;
end stages; 