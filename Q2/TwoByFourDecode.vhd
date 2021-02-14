-- TOP MODULE TwoByFourDecode
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

   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin

end architecture;