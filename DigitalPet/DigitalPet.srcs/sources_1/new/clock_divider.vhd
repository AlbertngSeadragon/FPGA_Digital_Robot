library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity clock_divider is
    generic (N : integer);
    port (
        clk : in std_logic;
        clk_out : out std_logic
    );
end clock_divider;

architecture arch_clock_divider of clock_divider is
    signal pulse : std_logic := '0';
    signal count : integer := 0;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if (count = (N - 1)) then
                pulse <= not pulse;
                count <= 0; -- reset count
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    clk_out <= pulse;
end arch_clock_divider; -- arch_clock_divider
