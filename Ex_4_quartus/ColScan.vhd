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
-- Generate signal to scan
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

use work.KeyBoardPack.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ColScan is
    Port ( clk			: in 	STD_LOGIC;
           rst_n		: in 	STD_LOGIC;
			  scan_flag	: out STD_LOGIC;
			  ScanOut	: out STD_LOGIC_VECTOR(3 downto 0)
           );
end ColScan;

architecture Behavioral of ColScan is

signal cnt : STD_LOGIC_VECTOR(COUNTER_WIDTH - 1 downto 0);

type ST_type is (S0, S1, S2, S3);
signal CrST, NxST: ST_type;	-- Current State and Next State

signal flag : STD_LOGIC;


begin

	RESET: process(clk, rst_n)
	begin
		if (rst_n = '0') then
			cnt <= COUNTER_RST;
			CrST <= S0;
			flag <= '0';
		else
			if (clk'event and clk = '1') then	-- It seems only Asynchronous reset can make cnt work...
				if (cnt = COUNT_NUM) then
					cnt <= COUNTER_RST;
					CrST <= NxST;
					flag <= NOT flag;
				else
					cnt <= cnt + 1;
				end if;
			end if;
		end if;
	end process;
	
	scan_flag <= flag;
	
	process(CrST)
	begin
		case(CrST) is
			when S0 		=>	NxST <= S1;
			when S1		=> NxST <= S2;
			when S2		=> NxST <= S3;
			when S3		=> NxST <= S0;
			when others =>	NxST <= S0;
		end case;
	end process;
	
	process(CrST)
	begin
		case (CrST) is
			when S0	=> ScanOut <= "0111";	-- the sigal will last for COUNT_NUM periods
			when S1	=> ScanOut <= "1011";
			when S2	=> ScanOut <= "1101";
			when S3	=> ScanOut <= "1110";
			when others =>	ScanOut <= "1111";
		end case;
	end process;

end Behavioral;