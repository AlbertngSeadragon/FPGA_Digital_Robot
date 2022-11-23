library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.my_types_pkg.all;

entity display is
    port (
        clk : in std_logic;
        myimage: in image;
        hsync, vsync : out std_logic;
        red, green, blue : out std_logic_vector(3 downto 0)
    );
end display;

architecture Behavioral of display is
    --------- VGA CONSTANT START ---------
    -- row constants
    constant H_TOTAL : integer := 1344 - 1;
    constant H_SYNC : integer := 48 - 1;
    constant H_BACK : integer := 240 - 1;
    constant H_START : integer := 48 + 240 - 1;
    constant H_ACTIVE : integer := 1024 - 1;
    constant H_END : integer := 1344 - 32 - 1;
    constant H_FRONT : integer := 32 - 1;

    -- column constants
    constant V_TOTAL : integer := 625 - 1;
    constant V_SYNC : integer := 3 - 1;
    constant V_BACK : integer := 12 - 1;
    constant V_START : integer := 3 + 12 - 1;
    constant V_ACTIVE : integer := 600 - 1;
    constant V_END : integer := 625 - 10 - 1;
    constant V_FRONT : integer := 10 - 1;
    signal hcount, vcount : integer;
    --------- VGA CONSTANT END ---------

    -- for clock
    component clock_divider is
        generic (N : integer);
        port (
            clk : in std_logic;
            clk_out : out std_logic
        );
    end component;
    signal clk1Hz, clk10Hz, clk50MHz : std_logic;

    -- for the position of block
    constant X_STEP : integer := 40;
    constant Y_STEP : integer := 120;
    constant SIZE : integer := 120;
    signal x : integer := V_START;
    signal y : integer := H_START;
    signal dx : integer := X_STEP;
    signal dy : integer := Y_STEP;

    -- for the color of the block
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue);
    signal color : colors;
begin
    --------- VGA UTILITY START ---------
    -- generate 50MHz clock
    u_clk50mhz : clock_divider generic map(N => 1) port map(clk, clk50MHz);

    -- horizontal counter in [0, H_TOTAL]
    pixel_count_proc : process (clk50MHz)
    begin
        if (rising_edge(clk50MHz)) then
            if (hcount = H_TOTAL) then
                hcount <= 0;
            else
                hcount <= hcount + 1;
            end if;
        end if;
    end process pixel_count_proc;

    -- generate hsync in [0, H_SYNC)
    hsync_gen_proc : process (hcount) begin
        if (hcount <= H_SYNC) then
            hsync <= '1';
        else
            hsync <= '0';
        end if;
    end process hsync_gen_proc;

    -- vertical counter in [0, V_TOTAL]
    line_count_proc : process (clk50MHz)
    begin
        if (rising_edge(clk50MHz)) then
            if (hcount = H_TOTAL) then
                if (vcount = V_TOTAL) then
                    vcount <= 0;
                else
                    vcount <= vcount + 1;
                end if;
            end if;
        end if;
    end process line_count_proc;

    -- generate vsync in [0, V_SYNC)
    vsync_gen_proc : process (hcount)
    begin
        if (vcount <= V_SYNC) then
            vsync <= '1';
        else
            vsync <= '0';
        end if;
    end process vsync_gen_proc;
    --------- VGA UTILITY END ---------

    -- generate 1Hz, 50MHz clock
    u_clk1hz : clock_divider generic map(N => 50000000) port map(clk, clk1Hz);
    u_clk10hz : clock_divider generic map(N => 5000000) port map(clk, clk10Hz);


    -- select the correct color of the pixel (hcount, vcount).
    process (hcount, vcount, x, y)
    begin
        if ((hcount >= H_START and hcount < H_END) and (vcount >= V_START and vcount < V_TOTAL)) then
            if (x <= hcount and hcount < x + SIZE and y < vcount and vcount < y + SIZE) then
                color <= fig((y - V_START)/Y_STEP);
            else
                color <= C_BLACK;
            end if;
        else
            color <= C_BLACK;
        end if;
    end process;

    -- output the correct RGB according to the signal 'color'.
    process (color)
    begin
        case(color) is
            when C_Black =>
                red <= "0000"; green <= "0000"; blue <= "0000";
            when C_Green =>
                red <= "0000"; green <= "1000"; blue <= "0000";
            when C_Blue =>
                red <= "0000"; green <= "0000"; blue <= "1111";
            when C_Red =>
                red <= "1111"; green <= "0000"; blue <= "0000";
            when C_White =>
                red <= "1111"; green <= "1111"; blue <= "1111";
            when C_Pink =>
                red <= "1111"; green <= "1100"; blue <= "1101";
            when others =>
                red <= "0000"; green <= "0000"; blue <= "0000";
        end case;
    end process; -- 
end Behavioral;
