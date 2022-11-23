library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ssd_controller is
  Port (
    clk:    in STD_LOGIC;
    data:   in STD_LOGIC_VECTOR (7 downto 0);
    sel:    buffer STD_LOGIC := '0';
    ssd:    out STD_LOGIC_VECTOR (6 downto 0)     
  );
end ssd_controller;

architecture Behavioral of ssd_controller is
    signal digit: STD_LOGIC_VECTOR(3 downto 0); 
    signal clk_100Hz: STD_LOGIC := '0';
    -- Add any signal if you want
    component clock_divider is
        generic (N : integer);
        port (
            clk : in std_logic;
            clk_out : out std_logic
        );
    end component;
begin

    -- TODO:  Step 2 - Clock Divider 100MHz -> 100Hz
--    process(clk) begin
--        clk_100Hz <= clk;
--    end process;
    u_clk100hz : clock_divider generic map(N => 500000) port map(clk, clk_100Hz);

    -- TODO: Step 3 - Modify the process to display both digits. You can create as many process as you want.
--    process(clk_100Hz) begin
--        if(rising_edge(clk_100Hz)) then
--            digit <= data(3 downto 0);
--        end if;
--    end process;
    process(clk_100Hz) begin
    if(rising_edge(clk_100Hz))then
        sel <= not sel;
    end if;
    end process;
    process(sel) begin
        
        if sel = '0' then
            digit <= data(3 downto 0);
        else
            digit <= data(7 downto 4);

        end if;
    end process;
--    process(clk_100Hz) begin
--        if(rising_edge(clk_100Hz)) and sel = '0' then
--            digit <= data(3 downto 0);
--            sel <= not sel;
--        end if;
--    end process;
--    process(clk_100Hz) begin
--        if(rising_edge(clk_100Hz)) and sel = '1' then
--            digit <= data(7 downto 4);
--            sel <= not sel;
--        end if;
--    end process;

    -- TODO: Step 1 - Fill in the blank
    process(digit) begin
        case digit is
            when "0000" => ssd <= "1111110";
            when "0001" => ssd <= "0110000";
            when "0010" => ssd <= "1101101";
            when "0011" => ssd <= "1111001";
            when "0100" => ssd <= "0110011";
            when "0101" => ssd <= "1011011";
            when "0110" => ssd <= "1011111";
            when "0111" => ssd <= "1110000";
            when "1000" => ssd <= "1111111";
            when "1001" => ssd <= "1110011";
            when "1010" => ssd <= "1110111";
            when "1011" => ssd <= "0011111";
            when "1100" => ssd <= "1001110";
            when "1101" => ssd <= "0111101";
            when "1110" => ssd <= "1001111";
            when "1111" => ssd <= "1000111";
            when others => ssd <= "00000000";
        end case;
    end process;

end Behavioral;
