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
			  ScanOut	: out STD_LOGIC_VECTOR(3 downto 0)
           );
end ColScan;

architecture Behavioral of ColScan is

signal cnt : STD_LOGIC_VECTOR(1 downto 0);

type ST_type is (S0, S1);
signal CrST, NxST: ST_type;	-- Current State and Next State


begin

	RESET: process(clk, rst_n)
	begin
		if (clk'event and clk = '1') then
			if (rst_n = '0') then
				cnt <= "00";
				CrST <= S0;
			else
				CrST <= NxST;
				if (CrST = S1) then
					cnt <= cnt + 1;
				end if;
			end if;
		end if;
	end process;
	
	process(CrST)
	begin
		case(CrST) is
			when S0 		=>	NxST <= S1;
			when S1		=> NxST <= S0;
			when others =>	NxST <= S0;
		end case;
	end process;
	
	process(CrST)
	begin
		if (CrST = S0) then
			case (cnt) is
				when "00"	=> ScanOut <= "0111";	-- the sigal will last for 2 periods
				when "01"	=> ScanOut <= "1011";
				when "10"	=> ScanOut <= "1101";
				when "11"	=> ScanOut <= "1110";
				when others =>	ScanOut <= "1111";
			end case;
		end if;
	end process;

end Behavioral;
