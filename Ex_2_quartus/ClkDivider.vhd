-- Ex 2: Clock Divider
-- This is a user-defined package file
-- Author: Zhengyang Lv
-- Student ID: PB17061238
-- Last edit: Oct. 18, 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.myPackEx_2.all;

entity ClkDivider is
port (rst_n		: IN 	std_logic;
		clk_in	: IN 	std_logic;
		clk_out	: OUT std_logic);
end ClkDivider;

architecture arcDivier of ClkDivider is

signal cnt : std_logic_vector(COUNTER_WIDTH - 1 downto 0);
signal tmp : std_logic;

begin
	CLK_DIVIDE: process(rst_n, clk_in)
	begin
		if (rst_n = '0') then
			tmp <= '0';
			cnt <= "0000000000";
		elsif (clk_in'event and clk_in = '1') then
			if (cnt = CLK_DIV_NUM) then
				cnt <= "0000000000";
				tmp <= NOT tmp;
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;
	
	clk_out <= tmp;
	
end architecture;