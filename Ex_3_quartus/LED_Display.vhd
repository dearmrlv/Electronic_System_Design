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
    Port ( LED_sel      : in STD_LOGIC_VECTOR (2 downto 0);     -- select LED to input data
           LED_data     : in STD_LOGIC_VECTOR (3 downto 0);     -- data into the corresponding LED
           latch_en     : in STD_LOGIC;     -- enable to input the data
           clk          : in STD_LOGIC;     -- Clock
           rst_n        : in STD_LOGIC;     -- Reset                    
           ------------------------------------     LED display control
           data_display : out STD_LOGIC_VECTOR (6 downto 0);    -- Controls the a,b, ..., g Pins
           DP_display   : out STD_LOGIC;    -- Controls the DP Pin
           ------------------------------------     Select a LED to display
           LED_dis_sel  : out STD_LOGIC_VECTOR(7 downto 0)
           );
end LED_Display;

architecture arcDisplay of LED_Display is

signal cnt : STD_LOGIC_VECTOR(2 downto 0);
signal LED0_data_dis, LED1_data_dis, LED2_data_dis, LED3_data_dis, LED4_data_dis, LED5_data_dis, LED6_data_dis, LED7_data_dis : STD_LOGIC_VECTOR(6 downto 0);
signal LED_data_dis : STD_LOGIC_VECTOR(6 downto 0);

component translator is
port(data_in    : in    STD_LOGIC_VECTOR(3 downto 0);
     data_out   : out   STD_LOGIC_VECTOR(6 downto 0)
     );
end component;

begin
    t0: translator port map(data_in=>LED_data, data_out=>LED_data_dis);
------------------------------------------
    COUNTER: process(clk, rst_n)
        begin
            if (rst_n = '0') then
                cnt <= LED0;
            elsif (clk'event and clk = '1') then
                cnt <= cnt + 1;
            end if;
    end process;
------------------------------------------
   DATA_INPUT: process(LED_sel, LED_data, latch_en, LED_data_dis, rst_n)
        begin
            if (rst_n = '0') then
                LED0_data_dis <= DIS_0;
                LED1_data_dis <= DIS_1;
                LED2_data_dis <= DIS_2;
                LED3_data_dis <= DIS_3;
                LED4_data_dis <= DIS_4;
                LED5_data_dis <= DIS_5;
                LED6_data_dis <= DIS_6;
                LED7_data_dis <= DIS_7;
            elsif (latch_en = '1') then
                case (LED_sel) is
                    when LED0   =>  LED0_data_dis <= LED_data_dis;
                    when LED1   =>  LED1_data_dis <= LED_data_dis;
                    when LED2   =>  LED2_data_dis <= LED_data_dis;
                    when LED3   =>  LED3_data_dis <= LED_data_dis;
                    when LED4   =>  LED4_data_dis <= LED_data_dis;
                    when LED5   =>  LED5_data_dis <= LED_data_dis;
                    when LED6   =>  LED6_data_dis <= LED_data_dis;
                    when LED7   =>  LED7_data_dis <= LED_data_dis;
                    when others =>  LED0_data_dis <= DIS_e;
                                    LED1_data_dis <= DIS_e;
                                    LED2_data_dis <= DIS_e;
                                    LED3_data_dis <= DIS_e;
                                    LED4_data_dis <= DIS_e;
                                    LED5_data_dis <= DIS_e;
                                    LED6_data_dis <= DIS_e;
                                    LED7_data_dis <= DIS_e;
                end case;
            end if;
    end process;
    ------------------------------------------
    DISPLAY: process(cnt)
        begin
            case (cnt) is
                when LED0   =>  data_display <= LED0_data_dis;
                                LED_dis_sel <= LED_DIS0;
                when LED1   =>  data_display <= LED1_data_dis;
                                LED_dis_sel <= LED_DIS1;
                when LED2   =>  data_display <= LED2_data_dis;
                                LED_dis_sel <= LED_DIS2;
                when LED3   =>  data_display <= LED3_data_dis;
                                LED_dis_sel <= LED_DIS3;
                when LED4   =>  data_display <= LED4_data_dis;
                                LED_dis_sel <= LED_DIS4;
                when LED5   =>  data_display <= LED5_data_dis;
                                LED_dis_sel <= LED_DIS5;
                when LED6   =>  data_display <= LED6_data_dis;
                                LED_dis_sel <= LED_DIS6;
                when LED7   =>  data_display <= LED7_data_dis;
                                LED_dis_sel <= LED_DIS7;
                when others =>  null;
            end case;
            DP_display <= '1';      -- Do not display the point
    end process;

end arcDisplay;
