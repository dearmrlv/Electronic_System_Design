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

constant KEY_0 : STD_LOGIC_VECTOR := "0000";
constant KEY_1 : STD_LOGIC_VECTOR := "0001";
constant KEY_2 : STD_LOGIC_VECTOR := "0010";
constant KEY_3 : STD_LOGIC_VECTOR := "0011";
constant KEY_4 : STD_LOGIC_VECTOR := "0100";
constant KEY_5 : STD_LOGIC_VECTOR := "0101";
constant KEY_6 : STD_LOGIC_VECTOR := "0110";
constant KEY_7 : STD_LOGIC_VECTOR := "0111";
constant KEY_8 : STD_LOGIC_VECTOR := "1000";
constant KEY_9 : STD_LOGIC_VECTOR := "1001";
constant KEY_A : STD_LOGIC_VECTOR := "1010";
constant KEY_B : STD_LOGIC_VECTOR := "1011";
constant KEY_C : STD_LOGIC_VECTOR := "1100";
constant KEY_D : STD_LOGIC_VECTOR := "1101";
constant KEY_asterisk : STD_LOGIC_VECTOR := "1110";		-- *
constant KEY_pound_sign : STD_LOGIC_VECTOR := "1111";		-- #

end package;