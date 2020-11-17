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
use IEEE.STD_LOGIC_1164.all;

package KeyBoardPack is

-- 4X4 keyBoard
-- First bit is '1'
constant KEY_0 : STD_LOGIC_VECTOR := "10000";
constant KEY_1 : STD_LOGIC_VECTOR := "10001";
constant KEY_2 : STD_LOGIC_VECTOR := "10010";
constant KEY_3 : STD_LOGIC_VECTOR := "10011";
constant KEY_4 : STD_LOGIC_VECTOR := "10100";
constant KEY_5 : STD_LOGIC_VECTOR := "10101";
constant KEY_6 : STD_LOGIC_VECTOR := "10110";
constant KEY_7 : STD_LOGIC_VECTOR := "10111";
constant KEY_8 : STD_LOGIC_VECTOR := "11000";
constant KEY_9 : STD_LOGIC_VECTOR := "11001";
constant KEY_A : STD_LOGIC_VECTOR := "11010";
constant KEY_B : STD_LOGIC_VECTOR := "11011";
constant KEY_C : STD_LOGIC_VECTOR := "11100";
constant KEY_D : STD_LOGIC_VECTOR := "11101";
constant KEY_asterisk : STD_LOGIC_VECTOR := "11110";		-- *
constant KEY_pound_sign : STD_LOGIC_VECTOR := "11111";		-- #

constant KEY_RST: STD_LOGIC_VECTOR := "00000";	-- means the status is reset

constant COUNTER_WIDTH : INTEGER := 10;
constant COUNTER_RST : STD_LOGIC_VECTOR := "0000000000";
constant COUNT_NUM : INTEGER := 1000;
constant MATCH_NUM : INTEGER := 700;

end package;
