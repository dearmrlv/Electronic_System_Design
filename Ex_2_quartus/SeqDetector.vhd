-- Ex 2: State Machine for Sequence Detector
-- Author: Zhengyang Lv
-- Student ID: PB17061238
-- Last edit: Oct. 19, 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.myPackEx_2.all;

-- Detect for sequence "111010011"

entity SeqDetector is
port (clk		: IN 	std_logic;							-- Clock
		rst_n		: IN 	std_logic;							-- Reset, posedge triggered
		SeqIn		: IN 	std_logic;							-- Input Sequence
		SeqNum	: OUT std_logic_vector(OUT_WIDTH - 1 downto 0)	-- Number of the exact sequence
		);
end SeqDetector;

architecture arcSeqDet of SeqDetector is

type ST_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9);
signal CrST, NxST: ST_type;	-- Current State and Next State

signal cnt : std_logic_vector(OUT_WIDTH - 1 downto 0);

begin
-----------------------------------------------
	STATE_MEMORY: process (clk, rst_n)
		begin
			if (rst_n = '0') then
				CrST <= S0;
			elsif (clk'event and clk = '1') then
				CrST <= NxST;
			end if;
		end process;
-----------------------------------------------
	NEXT_STATE_LOGIC : process (CrST, SeqIn)
		begin
			case (CrST) is
				when S0		=> if (SeqIn = '1') then
										NxST <= S1;
									else
										NxST <= S0;
									end if;
				when S1		=> if (SeqIn = '1') then
										NxST <= S2;
									else
										NxST <= S0;
									end if;
				when S2		=> if (SeqIn = '1') then
										NxST <= S3;
									else
										NxST <= S0;
									end if;
				when S3		=> if (SeqIn = '1') then
										NxST <= S3;
									else
										NxST <= S4;
									end if;
				when S4		=> if (SeqIn = '1') then
										NxST <= S5;
									else
										NxST <= S0;
									end if;
				when S5		=> if (SeqIn = '1') then
										NxST <= S1;
									else
										NxST <= S6;
									end if;
				when S6		=> if (SeqIn = '1') then
										NxST <= S1;
									else
										NxST <= S7;
									end if;
				when S7		=> if (SeqIn = '1') then
										NxST <= S8;
									else
										NxST <= S0;
									end if;
				when S8		=> if (SeqIn = '1') then
										NxST <= S9;
									else
										NxST <= S0;
									end if;
				when S9		=> if (SeqIn = '1') then
										NxST <= S1;
									else
										NxST <= S0;
									end if;
				when others	=> NxST <= S0;
			end case;
	end process;
-----------------------------------------------
	OUTPUT_LOGIC: process (CrST, rst_n)
		begin
		    if (rst_n = '0') then
		        cnt <= "0000";
				  
		    else
				 case (CrST) is 
					  when S9		=> cnt <= cnt + 1;
											SeqNum <= "0001";
					  when others => 	null;
											SeqNum <= "0000";
				 end case;
			end if;
			-- SeqNum <= cnt;
	end process;
end arcSeqDet;