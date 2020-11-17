

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use work.KeyBoardPack.ALL;

entity KeyBoard_TOP is
	 Port ( clk				: in 	STD_LOGIC;
           rst_n			: in 	STD_LOGIC;
			  ColScanPorts	: out STD_LOGIC_VECTOR(3 downto 0);
			  RowScanPorts	: in  STD_LOGIC_VECTOR(3 downto 0);
			  -- KeySel			: out STD_LOGIC_VECTOR(4 downto 0);
			  data_display : out STD_LOGIC_VECTOR(6 downto 0);    -- Controls the a,b, ..., g, DP Pins
           LED_dis_sel  : out STD_LOGIC
         );
end KeyBoard_TOP;

architecture Behavioral of keyBoard_TOP is

component ColScan is
    Port ( clk			: in 	STD_LOGIC;
           rst_n		: in 	STD_LOGIC;
			  scan_flag	: out STD_LOGIC;
			  ScanOut	: out STD_LOGIC_VECTOR(3 downto 0)
           );
end component;

component RowScan is
    Port ( clk			: in 	STD_LOGIC;
           rst_n		: in 	STD_LOGIC;
			  ColScan	: in  STD_LOGIC_VECTOR(3 downto 0);
			  scan_flag	: in  STD_LOGIC;
			  ScanIn		: in 	STD_LOGIC_VECTOR(3 downto 0);	-- Row Scan
			  KeySel		: out STD_LOGIC_VECTOR(4 downto 0)	-- Corresponds to the Constants declared in my Pack, press one key at most in a time
         );
end component;

--component ClkDivider is
--port (rst_n		: IN 	std_logic;
--		clk_in	: IN 	std_logic;
--		clk_out	: OUT std_logic);
--end component;

component LED_Output is
    Port (  clk			: in 	STD_LOGIC;
				rst_n			: in 	STD_LOGIC;
				LED_data_in : in  STD_LOGIC_VECTOR (4 downto 0);     -- select LED to input data                  
           data_display : out STD_LOGIC_VECTOR (6 downto 0);    -- Controls the a,b, ..., g, DP Pins
           LED_dis_sel  : out STD_LOGIC
           );
end component;

signal scan_flag : STD_LOGIC;
signal ScanOut	: STD_LOGIC_VECTOR(3 downto 0);
signal KeySel	: STD_LOGIC_VECTOR(4 downto 0);
signal clk_low  : STD_LOGIC;

begin

--CD0: ClkDivider  port map (rst_n=>rst_n, clk_in=>clk, clk_out=>clk_low);
CS0: ColScan port map (clk=>clk, rst_n=>rst_n, scan_flag=>scan_flag, ScanOut=>ScanOut);
RS0: RowScan port map (clk=>clk, rst_n=>rst_n, ColScan=>ScanOut, scan_flag=>scan_flag, ScanIn=>RowScanPorts, KeySel=>KeySel);
LO0: LED_Output port map (clk=>clk, rst_n=>rst_n, LED_data_in=>KeySel, data_display=>data_display, LED_dis_sel=>LED_dis_sel);

ColScanPorts <= ScanOut;

end architecture;
