-- TOP MODULE: OnebitHalfAdd
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity OnebitHalfAdd is
   port(
	a, b : in std_logic;
    sum, carry: out std_logic
   );
end entity;

architecture HalfAdd of OnebitHalfAdd is
    
    -- bxy denotes the output of the MUX with inputs as (x y) and selector as b
	signal b01: std_logic;
	signal b10: std_logic;
	
   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin
    -- This was made after constructing the ROBDD for each output

	-- Carry
	mux_b01: TwoByOneMux
      port map (i(0) => '0', i(1) => '1', sel => b, z => b01);
		
	mux_carry: TwoByOneMux
      port map (i(0) => '0', i(1) => b01, sel => a, z => carry);
		
	-- Sum
	mux_b10: TwoByOneMux
      port map (i(0) => '1', i(1) => '0', sel => b, z => b10);
		
	mux_sum: TwoByOneMux
      port map (i(0) => b01, i(1) => b10, sel => a, z => sum);

end architecture;