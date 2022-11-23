library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity finalproject is
    port (
        --    fromArduinoData : in STD_LOGIC; -- test on single pin
        fromArduinoData : in STD_LOGIC_VECTOR (3 downto 0);
        fromJetsonNanoData : in STD_LOGIC_VECTOR (3 downto 0);
        toArduinoNanoData : OUT STD_LOGIC;
        
        -- VGA
        clk : in std_logic;
        hsync, vsync : out std_logic;
        red, green, blue : out std_logic_vector(3 downto 0);
        
        -- Light detect and ssd
        cs      : BUFFER STD_LOGIC_VECTOR(0 DOWNTO 0);
        mosi    : OUT   STD_LOGIC;
        miso    : IN    STD_LOGIC;
        sclk    : BUFFER STD_LOGIC;
    
        sel:    buffer STD_LOGIC := '0';
        ssd     : OUT STD_LOGIC_VECTOR (6 downto 0);
        
        switch  : IN STD_LOGIC_VECTOR(7 downto 0) 
    );
end finalproject;

architecture Behavioral of finalproject is
    
    -- for clock
    component clock_divider is
        generic (N : integer);
        port (
            clk : in std_logic;
            clk_out : out std_logic
        );
    end component;
    signal clk1Hz, clk10Hz, clk100Hz, clk50MHz : std_logic;
    
    -- ssd_controller
    COMPONENT ssd_controller
        PORT(
            clk:    in STD_LOGIC;
            data:   in STD_LOGIC_VECTOR (7 downto 0);
            sel:    buffer STD_LOGIC := '0';
            ssd:    out STD_LOGIC_VECTOR (6 downto 0)  
        );
    END COMPONENT;
    
    -- spi_master
    COMPONENT spi_master
      GENERIC(
        slaves  : INTEGER;  --number of spi slaves
        d_width : INTEGER); --data bus width
      PORT(
        clock   : IN     STD_LOGIC;                             --system clock
        reset_n : IN     STD_LOGIC;                             --asynchronous reset
        enable  : IN     STD_LOGIC;                             --initiate transaction
        cpol    : IN     STD_LOGIC;                             --spi clock polarity
        cpha    : IN     STD_LOGIC;                             --spi clock phase
        cont    : IN     STD_LOGIC;                             --continuous mode command
        clk_div : IN     INTEGER;                               --system clock cycles per 1/2 period of sclk
        addr    : IN     INTEGER;                               --address of slave
        tx_data : IN     STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);  --data to transmit
        miso    : IN     STD_LOGIC;                             --master in, slave out
        sclk    : BUFFER STD_LOGIC;                             --spi clock
        ss_n    : BUFFER STD_LOGIC_VECTOR(slaves-1 DOWNTO 0);   --slave select
        mosi    : OUT    STD_LOGIC;                             --master out, slave in
        busy    : OUT    STD_LOGIC;                             --busy / data ready signal
        rx_data : OUT    STD_LOGIC_VECTOR(d_width-1 DOWNTO 0) --data received
        );
    END COMPONENT;
    
    signal clk_1MHz, calculate_clk_div : STD_LOGIC := '0';
    -- Step 6: Create a signal for rx_data
    signal rx_data_signal : std_logic_vector(14 downto 0);
    --    signal ss_n_signal : std_logic_vector(0 downto 0);

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

    -- for the position of block
    constant X_STEP : integer := 20;
    constant Y_STEP : integer := 20;
    signal x : integer := H_START;
    signal y : integer := V_START;
    signal dx : integer := X_STEP;
    signal dy : integer := Y_STEP;

    -- for the color of the block
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue, C_Red, C_White, C_DarkGreen, C_LightGreen);
    type T_2D is array(0 to 21, 0 to 23) of colors;
--    constant happy : T_2D := (((C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black));
    
    type mode2_2D is array(0 to 21, 0 to 41) of colors;
    --    type mode2_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    component mode2face is
    Port (mode2_out: out mode2_2D );
    end component;
    signal mode2_out: mode2_2D;
    
    type who_2D is array(0 to 21, 0 to 41) of colors;
    --    type who_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    component whoface is
    Port (who_out: out who_2D );
    end component;
    signal who_out: who_2D;
    
    type welcome_2D is array(0 to 21, 0 to 41) of colors;
    --    type welcome_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    component welcomeface is
    Port (welcome_out: out welcome_2D );
    end component;
    signal welcome_out: welcome_2D;
    
    type sad_2D is array(0 to 21, 0 to 23) of colors;
    --    type sad_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    component sadface is
        Port (sad_out: out sad_2D );
    end component;
    signal sad_out: sad_2D;
    
    type happy_2D is array(0 to 21, 0 to 23) of colors;
--    type happy_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    component happyface is
        Port (
            clk : in std_logic;
            happy_out: out happy_2D 
        );
    end component;
    signal happy_out: happy_2D;
    
    type normal_2D is array(0 to 21, 0 to 23) of colors;
--    type happy_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    component normalface is
        Port (
            clk : in std_logic;
            normal_out: out normal_2D
        );
    end component;
    signal normal_out: normal_2D;
--    constant unhappy : T_2D := ;
    
--    constant evil : T_2D := ;
    
    signal s_mode : std_logic := '0';
    -- signal adruniodigit : std_logic;
    signal adruniodigit: STD_LOGIC_VECTOR(3 downto 0);
    signal jetsonnanodigit: STD_LOGIC_VECTOR(3 downto 0);


    signal color : colors;
begin
    --------- VGA UTILITY START ---------
    -- generate 50MHz clock
    u_clk50mhz : clock_divider generic map(N => 1) port map(clk, clk50MHz);
    -- generate 1Hz, 50MHz clock
    u_clk1hz : clock_divider generic map(N => 50000000) port map(clk, clk1Hz);
    u_clk10hz : clock_divider generic map(N => 5000000) port map(clk, clk10Hz);
    u_clk100hz : clock_divider generic map(N => 500000) port map(clk, clk100Hz);
    u_clk1Mhz : clock_divider generic map(N => 50) port map(clk, clk_1MHz);

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


    -- Step 6: Send rx_data to PmodSSD
    ssd_controller_0: ssd_controller
    PORT MAP(
        clk => clk,
        data => switch,
--        data => rx_data_signal(11 downto 4),
        sel => sel,
        ssd => ssd
    );
    
    spi_master_0: spi_master
    GENERIC MAP(
        slaves => 1,
        d_width => 15
    )
    PORT MAP(
        clock => clk,
        reset_n => '1',
        enable => '1',
        cpol => '1',
        cpha => '1',
        cont => '0',
        clk_div => 50,
        addr => 0,
        tx_data => (OTHERS => '0'),
        miso => miso,
        sclk => sclk,
        ss_n => cs,
        mosi => mosi,
        busy => open,
        rx_data => rx_data_signal
    );

    receviveArduinoData: process(clk1Hz) begin
        if(rising_edge(clk1Hz))then
            adruniodigit <= fromArduinoData;
        end if;
    end process;
    
    receviveJetsonNanoData: process(clk1Hz) begin
        if(rising_edge(clk1Hz))then
            jetsonnanodigit <= fromJetsonNanoData;
        end if;
    end process;
    
    -- Test the toArdunioNano
    Clamp: process(switch, jetsonnanodigit) 
    begin
        if switch = "00000010" then
            case jetsonnanodigit is
                when "0010" => toArduinoNanoData <= '0'; -- fist close
                when "0011" => toArduinoNanoData <= '1'; -- Stop open
                when others => toArduinoNanoData <= '1'; -- Stop open
            end case;
        end if;
    end process;

    --
    
    MODE2: mode2face port map (mode2_out);
    WELCOME: welcomeface port map (welcome_out);
    WHO: whoface port map (who_out);
    SAD: sadface port map (sad_out);
    HAPPY: happyface port map (clk, happy_out);
    NORMAL: normalface port map (clk, normal_out);

    --process (clk10Hz, adruniodigit)
    --begin
    --    if (rising_edge(clk10Hz) and adruniodigit = '1') then
    --        s_mode <= not s_mode;
    --    end if;
    --end process;

-- select the correct color of the pixel (hcount, vcount).
--process (hcount, vcount, x, y, s_mode)
    process (hcount, vcount, x, y, adruniodigit, jetsonnanodigit, switch)
    variable vpos : integer := (V_START+V_END-250)/2;
    variable hpos : integer := (H_START+H_END-300)/2;
    variable vimagesize : integer := 0;
    variable himagesize : integer := 0;
    variable enlarge: integer := 8;
    begin
        if ((hcount >= H_START and hcount < H_END) and (vcount >= V_START and vcount < V_TOTAL)) then
--            if (vcount >=  (V_START+V_END)/3 and vcount < ( (V_START+V_END)/3 + 447) and hcount >=  (H_START+H_END)/3 and hcount < ( (H_START+H_END)/3 + 799)) then
--            if (vcount >=  (V_START+V_END)/3 and vcount < ( (V_START+V_END)/3 + 21) and hcount >=  (H_START+H_END)/3 and hcount < ( (H_START+H_END)/3 + 23)) then
--            if (vcount >=  (V_START+V_END)/3 and vcount < ( (V_START+V_END)/3 + 21) and hcount >=  (H_START+H_END)/3 and hcount < ( (H_START+H_END)/3 + 23)) then
            if switch = "00000001" then
--                if (vcount >=  (vpos - vimagesize) and vcount < ( vpos - vimagesize + 176) and hcount >=  (hpos - himagesize) and hcount < (hpos - himagesize + 184)) then
                if (vcount >=  (vpos - vimagesize) and vcount < ( vpos - vimagesize + 352) and hcount >=  (hpos - himagesize) and hcount < (hpos - himagesize + 384)) then
                    if adruniodigit = "0000" and jetsonnanodigit = "0000" then -- State 0      
--                    if jetsonnanodigit = "0000" then -- State 0   
                        color <= normal_out((vcount - (vpos - vimagesize))/16, (hcount - (hpos - himagesize))/16);
                    elsif adruniodigit = "0001" then --petting  State 1
                        color <= happy_out((vcount - (vpos + vimagesize))/16, (hcount - (hpos + himagesize))/16);
                    elsif jetsonnanodigit = "0001" then -- State 2
                        color <= sad_out((vcount - (vpos + vimagesize))/16, (hcount - (hpos + himagesize))/16);             
                    end if;    
                else
                    color <= C_BLACK;
                end if;
            elsif switch = "00000010" then
        --                if (vcount >=  (vpos - vimagesize) and vcount < ( vpos - vimagesize + 176) and hcount >=  (hpos - himagesize) and hcount < (hpos - himagesize + 184)) then
                if (vcount >=  (vpos - vimagesize) and vcount < ( vpos - vimagesize + 352) and hcount >=  (hpos - himagesize) and hcount < (hpos - himagesize + 656)) then
                    color <= mode2_out((vcount - (vpos - vimagesize))/16, (hcount - (hpos - himagesize))/16);
                else
                    color <= C_BLACK;
                end if;            
            elsif switch = "00000011" then
    --                if (vcount >=  (vpos - vimagesize) and vcount < ( vpos - vimagesize + 176) and hcount >=  (hpos - himagesize) and hcount < (hpos - himagesize + 184)) then
                    if (vcount >=  (vpos - vimagesize) and vcount < ( vpos - vimagesize + 352) and hcount >=  (hpos - himagesize) and hcount < (hpos - himagesize + 656)) then
                        if  jetsonnanodigit = "0100" then -- 4    
                            color <= welcome_out((vcount - (vpos - vimagesize))/16, (hcount - (hpos - himagesize))/16);
                        else
                            color <= who_out((vcount - (vpos + vimagesize))/16, (hcount - (hpos + himagesize))/16);             
                        end if;    
                    else
                        color <= C_BLACK;
                    end if;            
             end if;   
        end if;
    end process;

    -- output the correct RGB according to the signal 'color'.
    process (color)
    begin
        case(color) is
            when C_Black =>
                red <= "0000"; green <= "0000"; blue <= "0000";
            when C_DarkGreen =>
                red <= "0000"; green <= "0110"; blue <= "0000";
            when C_LightGreen =>
                red <= "0000"; green <= "1000"; blue <= "0000";
            when C_Red =>
                red <= "1111"; green <= "0000"; blue <= "0000";
            when C_White =>
                red <= "1111"; green <= "1111"; blue <= "1111";
            when C_Pink =>
                red <= "1111"; green <= "1100"; blue <= "1101";
            when C_DarkBrown =>
                red <= "0101"; green <= "0001"; blue <= "0010";
            when C_LightBrown =>
                red <= "1100"; green <= "0110"; blue <= "0001";
            when C_RiceWhite =>
                red <= "1111"; green <= "1111"; blue <= "1101";
            when C_LightBlue =>
                red <= "0010"; green <= "1101"; blue <= "1111";
            when others =>
                red <= "0000"; green <= "0000"; blue <= "0000";
        end case;
    end process; -- 


end Behavioral;
