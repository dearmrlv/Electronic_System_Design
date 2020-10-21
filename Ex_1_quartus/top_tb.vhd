--- FPGA Ex_1
--- Author: Zhengyang Lv
--- Student ID: PB17061238

library ieee;
use ieee.std_logic_1164.all;

entity top_tb is
end top_tb;

architecture arc_top_tb of top_tb is 
	component top is 
	port(
		y0_n, y1_n, y2_n, y3_n, y4_n, y5_n, y6_n, y7_n : out std_logic;
		a, b, c : in std_logic
	);
	end component;
	
	signal y0_n, y1_n, y2_n, y3_n, y4_n, y5_n, y6_n, y7_n : std_logic;
	signal a, b, c : std_logic;
	
begin
	u_tb: top port map(
		y0_n, y1_n, y2_n, y3_n, y4_n, y5_n, y6_n, y7_n,
		a, b, c
	);
	
	process
	begin
		a <= '0';
		b <= '0';
		c <= '0';
		wait for 20 ns;
		
		a <= '0';
		b <= '0';
		c <= '1';
		wait for 20 ns;
		
		a <= '0';
		b <= '1';
		c <= '0';
		wait for 20 ns;
		
		a <= '0';
		b <= '1';
		c <= '1';
		wait for 20 ns;
		
		a <= '1';
		b <= '0';
		c <= '0';
		wait for 20 ns;
		
		a <= '1';
		b <= '0';
		c <= '1';
		wait for 20 ns;
		
		a <= '1';
		b <= '1';
		c <= '0';
		wait for 20 ns;
		
		a <= '1';
		b <= '1';
		c <= '1';
		wait for 20 ns;
		
		a <= '0';
		b <= '0';
		c <= 'X';
		wait for 20 ns;
		
		a <= '0';
		b <= 'U';
		c <= '0';
		wait for 20 ns;
	
	end process;

end arc_top_tb;