----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/01 20:23:16
-- Design Name: 
-- Module Name: RowScan - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- read to scan
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.KeyBoardPack.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RowScan is
    Port ( clk			: in 	STD_LOGIC;
           rst_n		: in 	STD_LOGIC;
			  ColScan	: in  STD_LOGIC_VECTOR(3 downto 0);
			  scan_flag	: in  STD_LOGIC;
			  ScanIn		: in 	STD_LOGIC_VECTOR(3 downto 0);	-- Row Scan
			  KeySel		: out STD_LOGIC_VECTOR(4 downto 0)	-- Corresponds to the Constants declared in my Pack, press one key at most in a time
         );
end RowScan;


architecture Behavioral of RowScan is

component JitterEliminator is
    Port ( clk			: in 	STD_LOGIC;
           rst_n		: in 	STD_LOGIC;
			  scan_flag	: in 	STD_LOGIC;
			  Sig_in		: in  STD_LOGIC;
			  Sig_out	: out STD_LOGIC
         );
end component;

signal RowRead : STD_LOGIC_VECTOR(3 downto 0);

begin

J0: JitterEliminator port map (clk=>clk, rst_n=>rst_n, scan_flag=>scan_flag, Sig_in=>ScanIn(0), Sig_out=>RowRead(0));
J1: JitterEliminator port map (clk=>clk, rst_n=>rst_n, scan_flag=>scan_flag, Sig_in=>ScanIn(1), Sig_out=>RowRead(1));
J2: JitterEliminator port map (clk=>clk, rst_n=>rst_n, scan_flag=>scan_flag, Sig_in=>ScanIn(2), Sig_out=>RowRead(2));
J3: JitterEliminator port map (clk=>clk, rst_n=>rst_n, scan_flag=>scan_flag, Sig_in=>ScanIn(3), Sig_out=>RowRead(3));

	RESET: process(clk, rst_n)
	begin
		if (rst_n = '0') then
			KeySel <= KEY_RST;	
		elsif (clk'event and clk = '1') then
			if (ColScan = "0111") then
				case (RowRead) is
				when "0111" =>	KeySel <= KEY_1;
				when "1011" =>	KeySel <= KEY_4;
				when "1101" =>	KeySel <= KEY_7;
				when "1110" =>	KeySel <= KEY_asterisk;
				when others => KeySel <= KEY_RST;
				end case;
			elsif (ColScan = "1011") then
				case (RowRead) is
				when "0111" =>	KeySel <= KEY_2;
				when "1011" =>	KeySel <= KEY_5;
				when "1101" =>	KeySel <= KEY_8;
				when "1110" =>	KeySel <= KEY_0;
				when others => KeySel <= KEY_RST;
				end case;
			elsif (ColScan = "1011") then
				case (RowRead) is
				when "0111" =>	KeySel <= KEY_3;
				when "1011" =>	KeySel <= KEY_6;
				when "1101" =>	KeySel <= KEY_9;
				when "1110" =>	KeySel <= KEY_pound_sign;
				when others => KeySel <= KEY_RST;
				end case;
			elsif (ColScan = "1011") then
				case (RowRead) is
				when "0111" =>	KeySel <= KEY_A;
				when "1011" =>	KeySel <= KEY_B;
				when "1101" =>	KeySel <= KEY_C;
				when "1110" =>	KeySel <= KEY_D;
				when others => KeySel <= KEY_RST;
				end case;
			else
				KeySel <= KEY_RST;
			end if;
		end if;
	end process;

end Behavioral;
