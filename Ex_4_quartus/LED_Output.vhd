
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use work.KeyBoardPack.ALL;

-- use work.LED_pack.ALL;      -- My Pack to store some constants

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Output is
    Port (  clk			: in 	STD_LOGIC;
				rst_n			: in 	STD_LOGIC;
				LED_data_in : in  STD_LOGIC_VECTOR (4 downto 0);     -- select LED to input data                  
           data_display : out STD_LOGIC_VECTOR (6 downto 0);    -- Controls the a,b, ..., g, DP Pins
           LED_dis_sel  : out STD_LOGIC
           );
end LED_Output;

architecture arcDisplay of LED_Output is

constant DIS_0 : STD_LOGIC_VECTOR := "0000001";    -- Show "0" on the 7-segment LED
constant DIS_1 : STD_LOGIC_VECTOR := "1001111";    -- Show "1" on the 7-segment LED
constant DIS_2 : STD_LOGIC_VECTOR := "0010010";    -- Show "2" on the 7-segment LED
constant DIS_3 : STD_LOGIC_VECTOR := "0000110";    -- Show "3" on the 7-segment LED
constant DIS_4 : STD_LOGIC_VECTOR := "1001100";    -- Show "4" on the 7-segment LED
constant DIS_5 : STD_LOGIC_VECTOR := "0100100";    -- Show "5" on the 7-segment LED
constant DIS_6 : STD_LOGIC_VECTOR := "0100000";    -- Show "6" on the 7-segment LED
constant DIS_7 : STD_LOGIC_VECTOR := "0001111";    -- Show "7" on the 7-segment LED
constant DIS_8 : STD_LOGIC_VECTOR := "0000000";    -- Show "8" on the 7-segment LED
constant DIS_9 : STD_LOGIC_VECTOR := "0000100";    -- Show "9" on the 7-segment LED
---------------------------------------- Letters
constant DIS_a : STD_LOGIC_VECTOR := "1100010";    -- Show "a" on the 7-segment LED
constant DIS_b : STD_LOGIC_VECTOR := "1100000";    -- Show "b" on the 7-segment LED
constant DIS_c : STD_LOGIC_VECTOR := "1110010";    -- Show "c" on the 7-segment LED
constant DIS_d : STD_LOGIC_VECTOR := "1000010";    -- Show "d" on the 7-segment LED
constant DIS_e : STD_LOGIC_VECTOR := "0010000";    -- Show "e" on the 7-segment LED
constant DIS_f : STD_LOGIC_VECTOR := "0111000";    -- Show "f" on the 7-segment LED


signal LED_data : STD_LOGIC_VECTOR (4 downto 0);

begin
	process (clk, rst_n) begin
		if (rst_n = '0') then
			LED_data <= KEY_0;	
		else
			if (clk'event and clk = '1') then
				if (LED_data_in(4) = '1') then
					LED_data <= LED_data_in;
				end if;
			end if;
		end if;
	end process;
	
	process (LED_data) begin
		case(LED_data) is
		when KEY_0	=> data_display <= DIS_0;
		when KEY_1	=> data_display <= DIS_1;
		when KEY_2	=> data_display <= DIS_2;
		when KEY_3	=> data_display <= DIS_3;
		when KEY_4	=> data_display <= DIS_4;
		when KEY_5	=> data_display <= DIS_5;
		when KEY_6	=> data_display <= DIS_6;
		when KEY_7	=> data_display <= DIS_7;
		when KEY_8	=> data_display <= DIS_8;
		when KEY_9	=> data_display <= DIS_9;
		when KEY_A	=> data_display <= DIS_a;
		when KEY_B	=> data_display <= DIS_b;
		when KEY_C	=> data_display <= DIS_c;
		when KEY_D	=> data_display <= DIS_d;
		when KEY_asterisk	=> data_display <= DIS_e;
		when KEY_pound_sign	=> data_display <= DIS_f;
		when others => data_display <= DIS_e;
		end case;
	end process;
		LED_dis_sel <= '1';

		
end architecture;