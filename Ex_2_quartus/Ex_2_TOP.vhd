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
		SeqNum	: OUT std_logic_vector(OUT_WIDTH - 1 downto 0);	-- Number of the exact sequence
		seqShow	: OUT std_logic
		);
end Ex_2_TOP;

architecture arcTOP of Ex_2_TOP is

	signal seq0, seq1 : std_logic;	-- Input for Mux2
	signal seq_sel		: std_logic;	-- Output for Mux2
	signal clk_500k	: std_logic;	-- Slower Clock divided from 50M-Clock
	signal clk_5k		: std_logic;

	component ClkDivider
		port (rst_n		: IN 	std_logic;
				clk_in	: IN 	std_logic;
				clk_out	: OUT std_logic);
	end component;
	
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
	
	component SeqSel
		port (Seq0, Seq1 : IN 	STD_LOGIC;
				rst_n		  : IN 	STD_LOGIC;
				sel		  : IN 	STD_LOGIC;
				seq_sel	  : OUT	STD_LOGIC
				);
	end component;
	
	begin
		CD0: 	ClkDivider	  port map (rst_n=>rst_n, clk_in=>clk, clk_out=>clk_500k);
		CD1: 	ClkDivider	  port map (rst_n=>rst_n, clk_in=>clk_500k, clk_out=>clk_5k);
		SG0:	SeqGenerator0 port map (clk=>clk, rst_n=>rst_n, output=>seq0);
		SG1: 	SeqGenerator1 port map (clk=>clk, rst_n=>rst_n, output=>seq1);
		SD0: 	SeqDetector	  port map (clk=>clk, rst_n=>rst_n, SeqIn=>seq_sel, SeqNum=>SeqNum);
		SS0:	SeqSel		  port map (seq0=>seq0, seq1=>seq1, rst_n=>rst_n, sel=>sel, seq_sel=>seq_sel);
		
--		SEQUEBCE_SELECT: process(sel, rst_n, seq0, seq1)
--		begin
--			if (rst_n = '0') then 
--				seq_sel <= '0';
	--		else
		--		if (sel = '1') then
			--		seq_sel <= seq1;
				--else
					--seq_sel <= seq0;
				--end if;
		    --end if;
		--end process;
		
		seqShow <= seq_sel;
		
end arcTOP;