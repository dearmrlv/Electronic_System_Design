-- Ex 2: top module
-- Author: Zhengyang Lv
-- Student ID: PB17061238
-- Last edit: Oct. 19, 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.myPackEx_2.all;


entity Ex_2_TB is
end Ex_2_TB;

architecture arcTB of Ex_2_TB is

	component Ex_2_TOP
		port (clk		: IN 	std_logic;		-- Clock
				rst_n		: IN 	std_logic;		-- Reset, posedge triggered
				sel		: IN 	std_logic;		-- Select SeqGenerator 0 or 1
				SeqNum	: OUT std_logic_vector(OUT_WIDTH - 1 downto 0)	-- Number of the exact sequence
				);
	end component;
	
	signal clk, rst_n, sel : std_logic;
	signal SeqNum : std_logic_vector(OUT_WIDTH - 1 downto 0);
	
	begin
		Ex_2: Ex_2_TOP port map (clk=>clk, rst_n=>rst_n, sel=>sel, SeqNum=>SeqNum);
		
		CLK_GEN: process
			begin
				clk <= '1';
				wait for CLK_PERIOD/2;
				clk <= '0';
				wait for CLK_PERIOD/2;
			end process;
			
		TEST: process
			begin
				rst_n <= '1';
				sel <= '1';
				wait for CLK_PERIOD/2;
				rst_n <= '0';
				wait for CLK_PERIOD/2;
				rst_n <= '1';
				wait for CLK_PERIOD/2;
				wait for 1000 ns;
				sel <= '0';
				wait;
		end process;

end architecture;