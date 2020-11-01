----------------------------------------------------------------------------------
-- Company: USTC
-- Engineer: Zhengyang Lv, PB17061238
-- 
-- Create Date: 2020/10/21 19:45:41
-- Design Name: 
-- Module Name: LED_Display - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- Ex_3 of the Course, which is to display something on the LED, and this design do not light the DP Pin on the LED.
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

use work.LED_pack.ALL;      -- My Pack to store some constants

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Display is
    Port ( LED_data_in  : in STD_LOGIC_VECTOR (7 downto 0);     -- select LED to input data
           clk          : in STD_LOGIC;     -- Clock
           rst_n        : in STD_LOGIC;     -- Reset                    
           ------------------------------------     LED display control
           data_display : out STD_LOGIC_VECTOR (7 downto 0);    -- Controls the a,b, ..., g, DP Pins
           data_sel  : out STD_LOGIC_VECTOR(2 downto 0);        -- select a data from LED_STR
           ------------------------------------     Select a LED to display
           LED_dis_sel  : out STD_LOGIC_VECTOR(7 downto 0)
           );
end LED_Display;

architecture arcDisplay of LED_Display is

signal cnt : STD_LOGIC_VECTOR(2 downto 0);

begin
------------------------------------------
    COUNTER: process(clk, rst_n)
        begin
            if (rst_n = '0') then
                cnt <= LED0;
            elsif (clk'event and clk = '1') then
					data_sel <= cnt;
					if (clk'event and clk = '1') then
						cnt <= cnt + 1;
					end if;
            end if;
    end process;
------------------------------------------
    DISPLAY: process(cnt, LED_data_in)
        begin
            case (cnt) is
                when LED0   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS0;
                when LED1   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS1;
                when LED2   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS2;
                when LED3   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS3;
                when LED4   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS4;
                when LED5   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS5;
                when LED6   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS6;
                when LED7   =>  data_display <= LED_data_in;
                                LED_dis_sel <= LED_DIS7;
                when others =>  data_display <= DIS_e & '0';
                                LED_dis_sel <= "11111111";  -- light all the LED to show errors
            end case;
    end process;

end arcDisplay;
