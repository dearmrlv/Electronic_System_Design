----------------------------------------------------------------------------------
-- Company: USTC
-- Engineer: Zhengyang Lv, PB17061238
-- 
-- Create Date: 2020/10/21 21:15:49
-- Design Name: 
-- Module Name: translator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Transfer 4-bit data into the control signal of LED
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

entity translator is
    Port ( data_in  : in    STD_LOGIC_VECTOR (3 downto 0);
           DP       : in    STD_LOGIC;  -- Decimal Point
           data_out : out   STD_LOGIC_VECTOR (7 downto 0);
           clk      : in    STD_LOGIC);
end translator;

architecture Behavioral of translator is

begin
    process(data_in, clk)
    begin
        if (clk'event and clk = '1') then
            case(data_in) is
                when DATA_0 => data_out <= DIS_0 & DP;
                when DATA_1 => data_out <= DIS_1 & DP;
                when DATA_2 => data_out <= DIS_2 & DP;
                when DATA_3 => data_out <= DIS_3 & DP;
                when DATA_4 => data_out <= DIS_4 & DP;
                when DATA_5 => data_out <= DIS_5 & DP;
                when DATA_6 => data_out <= DIS_6 & DP;
                when DATA_7 => data_out <= DIS_7 & DP;
                when DATA_8 => data_out <= DIS_8 & DP;
                when DATA_9 => data_out <= DIS_9 & DP;
                when DATA_a => data_out <= DIS_a & DP;
                when DATA_b => data_out <= DIS_b & DP;
                when DATA_c => data_out <= DIS_c & DP;
                when DATA_d => data_out <= DIS_d & DP;
                when DATA_e => data_out <= DIS_e & DP;
                when DATA_f => data_out <= DIS_f & DP;
                when others => data_out <= DIS_0 & '0';
            end case;
        end if;
    end process;

end Behavioral;
