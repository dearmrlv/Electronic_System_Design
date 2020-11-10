----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/01 09:15:50
-- Design Name: 
-- Module Name: LED_STR - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- It is the storage of the led data
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.LED_pack.ALL;      -- My Pack to store some constants

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_STR is
     Port (LED_sel      :   in  STD_LOGIC_VECTOR (2 downto 0);     -- select LED to input data
           LED_data_in  :   in  STD_LOGIC_VECTOR (7 downto 0);     -- data into the corresponding LED from translator
           latch_en     :   in  STD_LOGIC;     -- enable to input the data
           clk          :   in  STD_LOGIC;     -- Clock
           rst_n        :   in  STD_LOGIC;     -- Reset
           data_sel     :   out  STD_LOGIC_VECTOR(2 downto 0);   -- data select
           LED_data_out :   out STD_LOGIC_VECTOR(7 downto 0)  -- data output to Display part
           );
end LED_STR;

architecture Behavioral of LED_STR is

type data_array is array (0 to 7) of std_logic_vector(7 downto 0);  -- [7:0] <=> [abcdefg DP]
signal LED_array : data_array; 

type ST_type is (S0, S1, S2, S3, S4, S5, S6, S7);
signal CrST, NxST: ST_type;	-- Current State and Next State

begin
-----------------------------------------------
	STATE_MEMORY: process (clk, rst_n)
		begin
			if (rst_n = '0') then
				CrST <= S0;
			elsif (clk'event and clk = '0') then
				CrST <= NxST;
			end if;
		end process;
-----------------------------------------------
	NEXT_STATE_LOGIC : process (CrST)
		begin
			case (CrST) is
				when S0		=> NxST <= S1;
				when S1		=> NxST <= S2;
				when S2		=> NxST <= S3;
				when S3		=> NxST <= S4;
				when S4		=> NxST <= S5;
				when S5		=> NxST <= S6;
				when S6		=> NxST <= S7;
				when S7		=> NxST <= S0;
				when others => NxST <= S0;
			end case;
	end process;
-----------------------------------------------
	OUTPUT_LOGIC: process (CrST, NxST, rst_n)
		begin
			if (rst_n = '0') then
				LED_data_out <= DIS_0&'1';
				data_sel <= "000";
			else
				case (NxST) is
					  when S0     =>  LED_data_out <= LED_array(0);
											data_sel <= "000";
					  when S1     =>  LED_data_out <= LED_array(1);
											data_sel <= "001";
					  when S2     =>  LED_data_out <= LED_array(2);
											data_sel <= "010";
					  when S3     =>  LED_data_out <= LED_array(3);
											data_sel <= "011";
					  when S4     =>  LED_data_out <= LED_array(4);
											data_sel <= "100";
					  when S5     =>  LED_data_out <= LED_array(5);
											data_sel <= "101";
					  when S6     =>  LED_data_out <= LED_array(6);
											data_sel <= "110";
					  when S7     =>  LED_data_out <= LED_array(7);
											data_sel <= "111";
					  when others =>  LED_data_out <= LED_array(0);
											data_sel <= "000";
				 end case;
			 end if;
	end process;
----------------------------------------    
    DATA_INPUT: process(LED_sel, LED_data_in, latch_en, rst_n, clk)
    begin
        if (clk'event and clk = '1') then
            if (rst_n = '0') then   -- Synchronous Reset
                LED_array(0) <= DIS_0 & '1';
                LED_array(1) <= DIS_1 & '1';
                LED_array(2) <= DIS_2 & '1';
                LED_array(3) <= DIS_3 & '1';
                LED_array(4) <= DIS_4 & '1';
                LED_array(5) <= DIS_5 & '1';
                LED_array(6) <= DIS_6 & '1';
                LED_array(7) <= DIS_7 & '1';
			  else
					if (latch_en = '1') then   -- add a Bubble
						case (LED_sel) is
							 when LED0   =>  LED_array(0) <= LED_data_in;
							 when LED1   =>  LED_array(1) <= LED_data_in;
							 when LED2   =>  LED_array(2) <= LED_data_in;
							 when LED3   =>  LED_array(3) <= LED_data_in;
							 when LED4   =>  LED_array(4) <= LED_data_in;
							 when LED5   =>  LED_array(5) <= LED_data_in;
							 when LED6   =>  LED_array(6) <= LED_data_in;
							 when LED7   =>  LED_array(7) <= LED_data_in;
							 when others =>  LED_array(0) <= DIS_e & '0';    -- data form: "e."
												  LED_array(1) <= DIS_e & '0';
												  LED_array(2) <= DIS_e & '0';
												  LED_array(3) <= DIS_e & '0';
												  LED_array(4) <= DIS_e & '0';
												  LED_array(5) <= DIS_e & '0';
												  LED_array(6) <= DIS_e & '0';
												  LED_array(7) <= DIS_e & '0';  
						end case;
					end if;
				end if;
        end if;
    end process;
--------------------------------------------
--    DATA_OUTPUT: process(data_sel, rst_n, clk)
--    begin
--        if (clk'event and clk = '1') then
--            if (rst_n = '0') then   -- Synchronous Reset
--               LED_data_out <= DIS_0 & '1';
--            else
--                case (data_sel) is
--                    when LED0   =>  LED_data_out <= LED_array(0);
--                    when LED1   =>  LED_data_out <= LED_array(1);
--                    when LED2   =>  LED_data_out <= LED_array(2);
--                    when LED3   =>  LED_data_out <= LED_array(3);
--                    when LED4   =>  LED_data_out <= LED_array(4);
--                    when LED5   =>  LED_data_out <= LED_array(5);
--                    when LED6   =>  LED_data_out <= LED_array(6);
--                    when LED7   =>  LED_data_out <= LED_array(7);
--                    when others =>  LED_data_out <= DIS_e & '0';
--                end case;
--            end if;
--        end if;
--    end process;

end Behavioral;
