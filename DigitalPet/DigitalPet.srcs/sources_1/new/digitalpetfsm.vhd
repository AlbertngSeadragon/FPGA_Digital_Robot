library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package my_types_pkg is
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue);
    type image is array(0 to 23, 0 to 21) of colors;
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.my_types_pkg.all;

entity digitalpetfsm is
    port (
        --Display
        clk : in std_logic;
        hsync, vsync : out std_logic;
        red, green, blue : out std_logic_vector(3 downto 0)
    );
end digitalpetfsm;

architecture Behavioral of digitalpetfsm is
    
    type happy_2D is array(0 to 23, 0 to 21) of colors;
    signal happy_out: happy_2D;
    component happyFace is
        Port (happy_out: out happy_2D );
    end component;
    
    component display is
        port(
            clk : in std_logic;
            myimage: in image;
            hsync, vsync : out std_logic;
            red, green, blue : out std_logic_vector(3 downto 0)
        );
    end component;

begin

end Behavioral;
