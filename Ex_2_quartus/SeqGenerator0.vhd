-- Ex 2: Sequence generator
-- Author: Zhengyang Lv
-- Student ID: PB17061238
-- Last edit: Oct. 19, 2020

library ieee;
use ieee.std_logic_1164.all;

entity SeqGenerator0 is 
port (clk, rst_n : IN std_logic;	-- Clock, Reset
		output	: OUT std_logic
		);
end SeqGenerator0;

architecture arcSeqGen0 of SeqGenerator0 is

type ST_type is (S0, S1);
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
				when S1		=> NxST <= S0;
			end case;
	end process;
-----------------------------------------------
	OUTPUT_LOGIC: process (CrST)
		begin
			case (CrST) is 
			when S0		=> output <= '1';
			when S1		=> output <= '0';
			when others => output <= 'Z';
			end case;
	end process;

end arcSeqGen0;