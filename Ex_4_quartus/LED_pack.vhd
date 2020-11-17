ibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package LED_pack is

--------------------------------------------- LED Select(INPUT)
constant LED0 : STD_LOGIC_VECTOR := "000";
constant LED1 : STD_LOGIC_VECTOR := "001";
constant LED2 : STD_LOGIC_VECTOR := "010";
constant LED3 : STD_LOGIC_VECTOR := "011";
constant LED4 : STD_LOGIC_VECTOR := "100";
constant LED5 : STD_LOGIC_VECTOR := "101";
constant LED6 : STD_LOGIC_VECTOR := "110";
constant LED7 : STD_LOGIC_VECTOR := "111";
--------------------------------------------- LED Data Mapping into 4-bit codes
constant DATA_0: STD_LOGIC_VECTOR := "0000";
constant DATA_1: STD_LOGIC_VECTOR := "0001";
constant DATA_2: STD_LOGIC_VECTOR := "0010";
constant DATA_3: STD_LOGIC_VECTOR := "0011";
constant DATA_4: STD_LOGIC_VECTOR := "0100";
constant DATA_5: STD_LOGIC_VECTOR := "0101";
constant DATA_6: STD_LOGIC_VECTOR := "0110";
constant DATA_7: STD_LOGIC_VECTOR := "0111";
constant DATA_8: STD_LOGIC_VECTOR := "1000";
constant DATA_9: STD_LOGIC_VECTOR := "1001";
constant DATA_a: STD_LOGIC_VECTOR := "1010";
constant DATA_b: STD_LOGIC_VECTOR := "1011";
constant DATA_c: STD_LOGIC_VECTOR := "1100";
constant DATA_d: STD_LOGIC_VECTOR := "1101";
constant DATA_e: STD_LOGIC_VECTOR := "1110";
constant DATA_f: STD_LOGIC_VECTOR := "1111";
--------------------------------------------- LED Display (Comment VCC)
---------------------------------------- Numbers
------------------------------ Format: "abcdefg"
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
--------------------------------------------- LED Select(OUTPUT)
constant LED_DIS0 : STD_LOGIC_VECTOR := "00000001";
constant LED_DIS1 : STD_LOGIC_VECTOR := "00000010";
constant LED_DIS2 : STD_LOGIC_VECTOR := "00000100";
constant LED_DIS3 : STD_LOGIC_VECTOR := "00001000";
constant LED_DIS4 : STD_LOGIC_VECTOR := "00010000";
constant LED_DIS5 : STD_LOGIC_VECTOR := "00100000";
constant LED_DIS6 : STD_LOGIC_VECTOR := "01000000";
constant LED_DIS7 : STD_LOGIC_VECTOR := "10000000";

constant CLK_PERIOD : TIME := 20 ns;

end LED_pack;