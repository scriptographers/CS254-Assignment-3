-- TOP MODULE OnebitFullAdd
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity OnebitFullAdd is
   port (a, b, cin : in std_logic;
         sum, carry: out std_logic);
end entity;

architecture Decode of OnebitFullAdd is

   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin

end architecture;