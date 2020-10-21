----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/10/21 22:12:50
-- Design Name: 
-- Module Name: LED_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
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

entity LED_tb is
--  Port ( );
end LED_tb;

architecture Behavioral of LED_tb is

component LED_Display is
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
end component;

signal LED_sel  : STD_LOGIC_VECTOR (2 downto 0);
signal LED_data : STD_LOGIC_VECTOR (3 downto 0);
signal latch_en, clk, rst_n : STD_LOGIC;
signal data_display : STD_LOGIC_VECTOR (6 downto 0);
signal DP_display   : STD_LOGIC;
signal LED_dis_sel  : STD_LOGIC_VECTOR(7 downto 0);

begin
    LD0: LED_Display port map (
        LED_sel=>LED_sel, LED_data=>LED_data, 
        latch_en=>latch_en, clk=>clk, rst_n=>rst_n, 
        data_display=>data_display, DP_display=>DP_display, LED_dis_sel=>LED_dis_sel);
        
        process
        begin
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
            wait for CLK_PERIOD/2;
        end process;
        
        process
        begin
            LED_sel <= LED0;
            LED_Data <= DATA_0;
            latch_en <= '0';
            rst_n <= '1';
            wait for 10 ns;
            rst_n <= '0';
            wait for 20 ns;
            rst_n <= '1';
            wait for 20 ns;
            latch_en <= '1';
            wait for 20 ns;
            latch_en <= '0';
            LED_sel <= LED1;
            LED_DATA <= DATA_1;
            wait for 20 ns;
            latch_en <= '1';
            wait for 20 ns;
            latch_en <= '0';
            wait;
        end process;

end Behavioral;
