-- Ex 2: top module
-- Author: Zhengyang Lv
-- Student ID: PB17061238
-- Last edit: Oct. 19, 2020

library ieee;
use ieee.std_logic_1164.all;

use work.myPackEx_2.all;

entity Ex_2_TOP is
port (clk		: IN 	std_logic;		-- Clock
		rst_n		: IN 	std_logic;		-- Reset, posedge triggered
		sel		: IN 	std_logic;		-- Select SeqGenerator 0 or 1
		SeqNum	: OUT std_logic_vector(OUT_WIDTH - 1 downto 0)	-- Number of the exact sequence
		);
end Ex_2_TOP;

architecture arcTOP of Ex_2_TOP is

	signal seq0, seq1 : std_logic;	-- Input for Mux2
	signal seq_sel		: std_logic;	-- Output for Mux2

	component SeqGenerator0
		port (clk, rst_n : IN std_logic;	-- Clock, Reset
				output	: OUT std_logic);
	end component;
	
	component SeqGenerator1
		port (clk, rst_n : IN std_logic;	-- Clock, Reset
				output	: OUT std_logic);
	end component;
	
	component SeqDetector
		port (clk		: IN 	std_logic;							-- Clock
				rst_n		: IN 	std_logic;							-- Reset
				SeqIn		: IN 	std_logic;							-- Input Sequence
				SeqNum	: OUT std_logic_vector(OUT_WIDTH - 1 downto 0)	-- Number of the exact sequence
				);
	end component;
	
	begin
		SG0:	SeqGenerator0 port map (clk=>clk, rst_n=>rst_n, output=>seq0);
		SG1: 	SeqGenerator1 port map (clk=>clk, rst_n=>rst_n, output=>seq1);
		SD0: 	SeqDetector	  port map (clk=>clk, rst_n=>rst_n, SeqIn=>seq_sel, SeqNum=>SeqNum);
		
		SEQUEBCE_SELECT: process(sel, rst_n, seq0, seq1)
		begin
			if (rst_n = '0') then 
				seq_sel <= '0';
			else
				if (sel = '1') then
					seq_sel <= seq1;
				else
					seq_sel <= seq0;
				end if;
		    end if;
		end process;
		
end arcTOP;