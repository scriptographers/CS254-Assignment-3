-- TOP MODULE FourByTwoEncode
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity FourByTwoEncode is
   port (i : in std_logic_vector (3 downto 0);
         en: in std_logic;
         z : out std_logic_vector (1 downto 0));
end entity;

architecture Encode of FourByTwoEncode is

   signal sig: std_logic;

   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin

   mux_i3: TwoByOneMux
      port map (i(0) => '0', i(1) => en, sel => i(3), z => sig);

   mux_i2: TwoByOneMux
      port map (i(0) => sig, i(1) => en, sel => i(2), z => z(1));

   mux_i1: TwoByOneMux
      port map (i(0) => sig, i(1) => en, sel => i(1), z => z(0));

end architecture;