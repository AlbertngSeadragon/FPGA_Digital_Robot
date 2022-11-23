library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package happyfacePKG is
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue);
    type happy_2D is array(0 to 21, 0 to 23) of colors; --22 * 32-1 23*32-1
--    type happy_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    constant happy1: happy_2D := ((C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_Pink,C_Pink,C_Pink,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_Pink,C_Pink,C_Pink,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_LightBrown,C_Pink,C_Pink,C_Pink,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Pink,C_Pink,C_Pink,C_LightBrown,C_RiceWhite,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_Pink,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_Pink,C_Pink,C_Pink,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black));
    
    constant happy2: happy_2D := ((C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_Pink,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_Pink,C_Pink,C_Pink,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black));

end package;

library work;
use work.happyfacePKG.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.ALL;

entity happyface is
    Port (
        clk : in std_logic;
        happy_out: out happy_2D 
    );
end happyface;

architecture Behavioral of happyface is

    -- for clock
    component clock_divider is
        generic (N : integer);
        port (
            clk : in std_logic;
            clk_out : out std_logic
        );
    end component;
    signal clk1Hz: std_logic;

    signal s_mode: std_logic := '0';

begin
--    happy_out <= happy;
    u_clk1hz : clock_divider generic map(N => 50000000) port map(clk, clk1Hz);
    
    process (clk1Hz)
    begin
        if (rising_edge(clk1Hz)) then
            s_mode <= not s_mode;
        end if;
    end process;
    
    process (s_mode)
    begin
        if (s_mode = '0') then
            happy_out <= happy1;
        elsif (s_mode = '1') then
            happy_out <= happy2;
        end if;
    end process;
end Behavioral;

