
library ieee;
use ieee.std_logic_1164.all;

entity SeqSel is
port (Seq0, Seq1 : IN 	std_logic;
		rst_n		  : IN 	std_logic;
		sel		  : IN 	std_logic;
		seq_sel	  : OUT	std_logic
		);
end SeqSel;

architecture A1 of SeqSel is

begin
	SEQUEBCE_SELECT: process(sel, rst_n, Seq0, Seq1)
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
end architecture;