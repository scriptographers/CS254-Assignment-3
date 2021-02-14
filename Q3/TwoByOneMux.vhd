-- MODULE TwoByOneMux - only allowed component
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity TwoByOneMux is
   port (i : in std_logic_vector(1 downto 0);
         sel : in std_logic;
         z : out std_logic);
end entity;

architecture Mux of TwoByOneMux is

   signal sig: std_logic_vector(2 downto 0);

   component not_gate is
      port (input: in std_logic; output: out std_logic);
   end component;

   component or_gate is
      port (input: in std_logic_vector(1 downto 0); output: out std_logic);
   end component;

   component and_gate is
      port (input: in std_logic_vector(1 downto 0); output: out std_logic);
   end component;

begin
   not1: not_gate
      port map (input => sel, output => sig(0));

   and1: and_gate
      port map (input(0) => sig(0), input(1) => i(0), output => sig(1));

   and2: and_gate
      port map (input(0) => sel, input(1) => i(1), output => sig(2));

   or1: or_gate
      port map (input(0) => sig(1), input(1) => sig(2), output => z);

end architecture;

-- Sub-component NOT Gate
library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
   port (input: in std_logic; output: out std_logic);
end entity;

architecture not_arc of not_gate is
begin
   output <= not input;
end architecture;

-- Sub-component OR Gate
library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
   port (input: in std_logic_vector(1 downto 0); output: out std_logic);
end entity;

architecture or_arc of or_gate is
begin
   output <= input(0) or input(1);
end architecture;

-- Sub-component AND Gate
library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
   port (input: in std_logic_vector(1 downto 0); output: out std_logic);
end entity;

architecture and_arc of and_gate is
begin
   output <= input(0) and input(1);
end architecture;
