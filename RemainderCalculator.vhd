Library ieee;
use ieee.std_logic_1164.all;

entity RemainderCalculator is
    port(
        clk, rst, start : in std_logic;
        A : in std_logic_vector(7 downto 0);
        -- The most significant bit in B is always set to 1.
        B : in std_logic_vector(3 downto 0);
        C : out std_logic_vector(3 downto 0);
        done, error : out std_logic
    );
end RemainderCalculator;

architecture integrated of RemainderCalculator is
    Signal buffer1, buffer1Out : std_logic_vector(17 downto 0);
    Signal buffer2, buffer3, buffer4, buffer5 : std_logic_vector(17 downto 0);
    Signal buffer2Out, buffer3Out, buffer4Out, buffer5Out : std_logic_vector(17 downto 0);
    component StageOne is 
    port(
        clk, rst, start : in std_logic;
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(3 downto 0);
        A_reg : out std_logic_vector(7 downto 0);
        B_reg : out std_logic_vector(7 downto 0);
        start_reg, err : out std_logic
    );
    end component;
    component DifferenceStage is
        port (
          clk, rst, start, err : in std_logic;
          A : in std_logic_vector(7 downto 0);
          B : in std_logic_vector(7 downto 0);
          A_reg, B_reg : out std_logic_vector(7 downto 0);
          start_reg : out std_logic;
          err_reg : out std_logic
        );
    end component;
    component FinalStage is 
    port(
        clk, rst, start, err_in : in std_logic;
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        C : out std_logic_vector(3 downto 0);
        done, err : out std_logic 
    );
    end component;
    component nreg is
        generic ( n : integer := 16);
        port(
            clk, reset, enable : in std_logic;
            input : in std_logic_vector(n-1 downto 0);
            output : out std_logic_vector(n-1 downto 0));
    end component;
    
begin
    -- Create the buffer wiring.
    buffer12 : nreg generic map(18) port map(clk, rst, buffer1(1), buffer1, buffer1Out);
    buffer23 : nreg generic map(18) port map(clk, rst, buffer1Out(1), buffer2, buffer2Out);
    buffer34 : nreg generic map(18) port map(clk, rst, buffer2Out(1), buffer3, buffer3Out);
    buffer45 : nreg generic map(18) port map(clk, rst, buffer3Out(1), buffer4, buffer4Out);
    buffer56 : nreg generic map(18) port map(clk, rst, buffer4Out(1), buffer5, buffer5Out);
    
    -- Create stage 1 wiring.
    stage1 : StageOne port map(clk, rst, start, A, B, buffer1(17 downto 10), buffer1(9 downto 2), buffer1(1), buffer1(0));
    
    -- Difference stages wiring
    -- Start by stage 2:
    stage2 : DifferenceStage port map(clk, rst, buffer1Out(1), buffer1Out(0), buffer1Out(17 downto 10), buffer1Out(9 downto 2), buffer2(17 downto 10), buffer2(9 downto 2), buffer2(1), buffer2(0));
    
    -- Stage 3 wiring:
    stage3 : DifferenceStage port map(clk, rst, buffer2Out(1), buffer2Out(0), buffer2Out(17 downto 10), buffer2Out(9 downto 2), buffer3(17 downto 10), buffer3(9 downto 2), buffer3(1), buffer3(0));

    -- Stage 4 wiring :
    stage4 : DifferenceStage port map(clk, rst, buffer3Out(1), buffer3Out(0), buffer3Out(17 downto 10), buffer3Out(9 downto 2), buffer4(17 downto 10), buffer4(9 downto 2), buffer4(1), buffer4(0));

    -- Stage 5 wiring:
    stage5 : DifferenceStage port map(clk, rst, buffer4Out(1), buffer4Out(0), buffer4Out(17 downto 10), buffer4Out(9 downto 2), buffer5(17 downto 10), buffer5(9 downto 2), buffer5(1), buffer5(0));

    -- Final stage and output stage:
    stage6 : FinalStage port map(clk, rst, buffer5Out(1), buffer5Out(0), buffer5Out(17 downto 10), buffer5Out(9 downto 2), C, done, error);
end integrated;