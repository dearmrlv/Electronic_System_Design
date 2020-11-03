----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/01 20:23:16
-- Design Name: 
-- Module Name: ColScan - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Generate signal tp scan
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ColScan is
    Port ( clk		: in 	STD_LOGIC;
           rst_n	: in 	STD_LOGIC;
			  tmp		: out STD_LOGIC_VECTOR(3 downto 0)
           );
end ColScan;

architecture Behavioral of ColScan is

signal cnt : STD_LOGIC_VECTOR(3 downto 0);

begin

	RESET: process(clk, rst_n)
	begin
		if (clk'event and clk = '1') then
			if (rst_n = '0') then
				cnt <= "0000";
			else
				if (clk'event and clk = '1') then
					cnt <= cnt + 1;
				end if;
			end if;
		end if;
		tmp <= cnt;
	end process;
	
	

end Behavioral;
