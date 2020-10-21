-- Ex 2: Sequence generator
-- Author: Zhengyang Lv
-- Student ID: PB17061238
-- Last edit: Oct. 19, 2020

library ieee;
use ieee.std_logic_1164.all;

entity SeqGenerator1 is 
port (clk, rst_n : IN std_logic;	-- Clock, Reset
		output	: OUT std_logic
		);
end SeqGenerator1;

architecture arcSeqGen1 of SeqGenerator1 is

type ST_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9);
signal CrST, NxST: ST_type;	-- Current State and Next State

begin
-----------------------------------------------
	STATE_MEMORY: process (clk, rst_n)
		begin
			if (rst_n = '0') then
				CrST <= S0;
			elsif (clk'event and clk = '0') then
				CrST <= NxST;
			end if;
		end process;
-----------------------------------------------
	NEXT_STATE_LOGIC : process (CrST)
		begin
			case (CrST) is
				when S0		=> NxST <= S1;
				when S1		=> NxST <= S2;
				when S2		=> NxST <= S3;
				when S3		=> NxST <= S4;
				when S4		=> NxST <= S5;
				when S5		=> NxST <= S6;
				when S6		=> NxST <= S7;
				when S7		=> NxST <= S8;
				when S8		=> NxST <= S9;
				when S9		=> NxST <= S0;
			end case;
	end process;
-----------------------------------------------
	OUTPUT_LOGIC: process (CrST)
		begin
			case (CrST) is 
			when S0		=> output <= '1';
			when S1		=> output <= '1';
			when S2		=> output <= '1';
			when S3		=> output <= '0';
			when S4		=> output <= '1';
			when S5		=> output <= '0';
			when S6		=> output <= '0';
			when S7		=> output <= '1';
			when S8		=> output <= '1';
			when S9		=> output <= '0';
			when others => output <= 'Z';
			end case;
	end process;

end arcSeqGen1;