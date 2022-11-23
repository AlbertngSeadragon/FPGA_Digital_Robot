library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package mode2facePKG is
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue);
    type mode2_2D is array(0 to 21, 0 to 41) of colors; --22 * 32-1 23*32-1
--    type mode2_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    constant mode2: mode2_2D := ((C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_Pink,C_DarkBrown,C_Pink,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_Pink,C_Pink,C_Pink,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black));
end package;

library work;
use work.mode2facePKG.all;

entity mode2face is
    Port (mode2_out: out mode2_2D );
end mode2face;

architecture Behavioral of mode2face is

begin
    mode2_out <= mode2;
end Behavioral;
