-- TOP MODULE: TwoByFourDecode
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity TwoByFourDecode is
   port (i : in std_logic_vector (1 downto 0);
         en: in std_logic;
         z : out std_logic_vector (3 downto 0));
end entity;

architecture Decode of TwoByFourDecode is

   signal sig: std_logic_vector(1 downto 0);

   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin
    -- This was made after constructing the ROBDD for each output

   -- Decoding based on i(1)
   mux1_0: TwoByOneMux
      port map (i(0) => en, i(1) => '0', sel => i(1), z => sig(0));
   mux1_1: TwoByOneMux
      port map (i(0) => '0', i(1) => en, sel => i(1), z => sig(1));

   -- Decoding based on i(0)
   mux2_0: TwoByOneMux
      port map (i(0) => sig(0), i(1) => '0', sel => i(0), z => z(0));
   mux2_1: TwoByOneMux
      port map (i(0) => '0', i(1) => sig(0), sel => i(0), z => z(1));
   mux2_2: TwoByOneMux
      port map (i(0) => sig(1), i(1) => '0', sel => i(0), z => z(2));
   mux2_3: TwoByOneMux
      port map (i(0) => '0', i(1) => sig(1), sel => i(0), z => z(3));

end architecture;
