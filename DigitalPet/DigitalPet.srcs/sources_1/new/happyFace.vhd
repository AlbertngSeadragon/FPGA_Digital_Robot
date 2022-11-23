library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package happyFacePKG is
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue);
    type happy_2D is array(0 to 23, 0 to 21) of colors;
    constant happy: happy_2D := ((C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black),
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
    (C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite),
    (C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_Pink,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
    (C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_Pink,C_Pink,C_Pink,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black),
    (C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black),
    (C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black),
    (C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black),
    (C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black),
    (C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black));
end package;

library work;
use work.happyFacePKG.all;

entity happyFace is
    Port (happy_out: out happy_2D );
end happyFace;

architecture Behavioral of happyFace is

begin
    happy_out <= happy;
end Behavioral;
