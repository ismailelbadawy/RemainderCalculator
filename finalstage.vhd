Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FinalStage is 
    port(
        clk, rst, start, err_in : in std_logic;
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        C : out std_logic_vector(3 downto 0);
        done, err : out std_logic 
    );
end FinalStage;


architecture finalArch of FinalStage is
    -- This has to be a variable because the `Signal` changes its value at the end of the clock cycle.
    variable lastRemainder : std_logic_vector(7 downto 0);

begin
    process (clk, rst)
    begin
        if(rst = '1') then
            C <= (others => '0');
            err <= '0';
            done <= '0';
        elsif rising_edge(clk) then
            if(start ='1') then
                if(A > B) then
                    lastRemainder <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) - to_integer(unsigned(B)), 8));
                    C <= lastRemainder(3 downto 0);
                else 
                    C <= A(3 downto 0);
                end if;
                err <= err_in;
                if(start = '1' and to_integer(unsigned(A)) /= 0)  then
                    done <= '1';
                end if;
            end if;
        end if;
    end process;
end finalArch;