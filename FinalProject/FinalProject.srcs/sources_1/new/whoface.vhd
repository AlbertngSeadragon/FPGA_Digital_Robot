library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package whofacePKG is
    type colors is (C_Black, C_DarkBrown, C_LightBrown, C_RiceWhite, C_Pink, C_LightBlue);
    type who_2D is array(0 to 21, 0 to 41) of colors; --22 * 32-1 23*32-1
--    type who_2D is array(0 to 703, 0 to 767) of colors; --22 * 32-1 24*32-1
    constant who: who_2D := ((C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_LightBrown,C_RiceWhite,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_RiceWhite,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_DarkBrown,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_LightBrown,C_LightBrown,C_LightBrown,C_LightBrown,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_DarkBrown,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black),
(C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_RiceWhite,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black,C_Black));
end package;

library work;
use work.whofacePKG.all;

entity whoface is
    Port (who_out: out who_2D );
end whoface;

architecture Behavioral of whoface is

begin
    who_out <= who;
end Behavioral;
