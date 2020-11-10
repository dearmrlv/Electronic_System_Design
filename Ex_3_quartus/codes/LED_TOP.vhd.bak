----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/01 10:54:08
-- Design Name: 
-- Module Name: LED_TOP - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_TOP is
    Port ( LED_sel      : in STD_LOGIC_VECTOR (2 downto 0);     -- select LED to input data
           LED_data     : in STD_LOGIC_VECTOR (3 downto 0);     -- data into the corresponding LED
           DP           : in STD_LOGIC;     -- Decimal Point
           latch_en     : in STD_LOGIC;     -- enable to input the data
           clk          : in STD_LOGIC;     -- Clock
           rst_n        : in STD_LOGIC;     -- Reset                    
           ------------------------------------     LED display control
           data_display : out STD_LOGIC_VECTOR (7 downto 0);    -- Controls the a,b, ..., g Pins
           ------------------------------------     Select a LED to display
           LED_dis_sel  : out STD_LOGIC_VECTOR(7 downto 0)
           );
end LED_TOP;

architecture Behavioral of LED_TOP is

component translator is
    Port ( data_in  : in    STD_LOGIC_VECTOR (3 downto 0);
           DP       : in    STD_LOGIC;  -- Decimal Point
           data_out : out   STD_LOGIC_VECTOR (7 downto 0);
           clk      : in    STD_LOGIC);
end component;

component LED_STR is
     Port (LED_sel      :   in  STD_LOGIC_VECTOR (2 downto 0);     -- select LED to input data
           LED_data_in  :   in  STD_LOGIC_VECTOR (7 downto 0);     -- data into the corresponding LED from translator
           latch_en     :   in  STD_LOGIC;     -- enable to input the data
           clk          :   in  STD_LOGIC;     -- Clock
           rst_n        :   in  STD_LOGIC;     -- Reset
           data_sel     :   in  STD_LOGIC_VECTOR(2 downto 0);   -- data select
           LED_data_out :   out STD_LOGIC_VECTOR(7 downto 0)  -- data output to Display part
           );
end component;

component LED_Display is
    Port ( LED_data_in  : in STD_LOGIC_VECTOR (7 downto 0);     -- select LED to input data
           clk          : in STD_LOGIC;     -- Clock
           rst_n        : in STD_LOGIC;     -- Reset                    
           ------------------------------------     LED display control
           data_display : out STD_LOGIC_VECTOR (7 downto 0);    -- Controls the a,b, ..., g, DP Pins
           data_sel  : out STD_LOGIC_VECTOR(2 downto 0);        -- select a data from LED_STR
           ------------------------------------     Select a LED to display
           LED_dis_sel  : out STD_LOGIC_VECTOR(7 downto 0)
           );
end component;

signal data_store : STD_LOGIC_VECTOR(7 downto 0);   -- data for store into s0
signal data_dis : STD_LOGIC_VECTOR(7 downto 0);     -- data into d0
signal data_sel : STD_LOGIC_VECTOR(2 downto 0);

begin
t0: translator  port map (data_in=>LED_data, DP=>DP, data_out=>data_store, clk=>clk);
s0: LED_STR     port map (LED_sel=>LED_sel, LED_data_in=>data_store, latch_en=>latch_en, clk=>clk, rst_n=>rst_n, data_sel=>data_sel, LED_data_out=>data_dis);
d0: LED_Display port map (LED_data_in=>data_dis, clk=>clk, rst_n=>rst_n, data_display=>data_display, data_sel=>data_sel, LED_dis_sel=>LED_dis_sel);

end Behavioral;
