--- FPGA Ex_1
--- Author: Zhengyang Lv
--- Student ID: PB17061238

library ieee;
use ieee.std_logic_1164.all;

entity top_tb is
end top_tb;

architecture arc_top_tb of top_tb is 

signal clk, rst_n : STD_LOGIC;
signal ColScanPorts, RowScanPorts : STD_LOGIC_VECTOR(3 downto 0);
signal KeySel : STD_LOGIC_VECTOR(4 downto 0);
constant CLK_PERIOD : time := 20 ns;

component KeyBoard_TOP is
	 Port ( clk				: in 	STD_LOGIC;
           rst_n			: in 	STD_LOGIC;
			  ColScanPorts	: out STD_LOGIC_VECTOR(3 downto 0);
			  RowScanPorts	: in  STD_LOGIC_VECTOR(3 downto 0);
			  KeySel			: out STD_LOGIC_VECTOR(4 downto 0)
         );
end component;

begin
KB0: KeyBoard_TOP port map (clk=>clk, rst_n=>rst_n, ColScanPorts=>ColScanPorts, RowScanPorts=>RowScanPorts, KeySel=>KeySel);
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
				wait for 10 ns;
				rst_n <= '0';
				wait for 100 ns;
				rst_n <= '1';
				wait for CLK_PERIOD/2;
				wait for 1000 ns;
				RowScanPorts <= "1110";
				wait for 10 ms;
				RowScanPorts <= "1111";
				wait;
		end process;

end arc_top_tb;