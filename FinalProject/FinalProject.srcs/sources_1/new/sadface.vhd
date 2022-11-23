library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package sadfacePKG is
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue);
    type sad_2D is array(0 to 21, 0 to 23) of colors; --22 * 32-1 23*32-1
--    type sad_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    constant sad: sad_2D := ((C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBlue,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_LightBlue,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBlue,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_LightBlue,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_DarkBrown,C_RiceWhite),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBlue,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBlue,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
(C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black));
end package;

library work;
use work.sadfacePKG.all;

entity sadface is
    Port (sad_out: out sad_2D );
end sadface;

architecture Behavioral of sadface is

begin
    sad_out <= sad;
end Behavioral;

