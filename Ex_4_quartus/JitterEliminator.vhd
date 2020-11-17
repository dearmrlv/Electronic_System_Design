

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use work.KeyBoardPack.ALL;

entity JitterEliminator is
    Port ( clk			: in 	STD_LOGIC;
           rst_n		: in 	STD_LOGIC;
			  scan_flag	: in 	STD_LOGIC;
			  Sig_in		: in  STD_LOGIC;
			  Sig_out	: out STD_LOGIC
         );
end JitterEliminator;

architecture Behavioral of JitterEliminator is

signal cnt_H, cnt_L : STD_LOGIC_VECTOR(COUNTER_WIDTH - 1 downto 0);

begin

	RESET: process(clk, rst_n)
	begin
		if (rst_n = '0') then
			cnt_H <= COUNTER_RST;
			cnt_L <= COUNTER_RST;
			Sig_out <= '1';
		else
			if (clk'event and clk = '1') then	-- It seems only Asynchronous reset can make cnt work...
				if (cnt_H = MATCH_NUM) then
					Sig_out <= '1';
					cnt_H <= COUNTER_RST;
				elsif (cnt_L = MATCH_NUM) then
					Sig_out <= '0';
					cnt_L <= COUNTER_RST;
				else
					if (Sig_in = '1') then
						cnt_H <= cnt_H + 1;
					elsif (Sig_in = '0') then
						cnt_L <= cnt_L + 1;
					else
						null;
					end if;
				end if;
			end if;
		end if;
	end process;


end Behavioral;