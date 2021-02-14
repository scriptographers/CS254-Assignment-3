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
	
	signal c01, c10, b_c01_c10, b_c10_c01, b_0_c01, b_c01_1: std_logic;
	
   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin
	
	-- Sum
	mux_c01: TwoByOneMux
      port map (i(0) => '0', i(1) => '1', sel => cin, z => c01);
		
	mux_c10: TwoByOneMux
      port map (i(0) => '1', i(1) => '0', sel => cin, z => c10);
		
	mux_b_c01_c10: TwoByOneMux
      port map (i(0) => c01, i(1) => c10, sel => b, z => b_c01_c10);
		
	mux_b_c10_c01: TwoByOneMux
      port map (i(0) => c10, i(1) => c01, sel => b, z => b_c10_c01);
		
	mux_sum: TwoByOneMux
      port map (i(0) => b_c01_c10, i(1) => b_c10_c01, sel => a, z => sum);
		
		
	-- Carry
	mux_b_0_c01: TwoByOneMux
      port map (i(0) => '0', i(1) => c01, sel => b, z => b_0_c01);
	
	mux_b_c01_1: TwoByOneMux
      port map (i(0) => c01, i(1) => '1', sel => b, z => b_c01_1);
		
	mux_carry: TwoByOneMux
      port map (i(0) => b_0_c01, i(1) => b_c01_1, sel => a, z => carry);
	

end architecture;