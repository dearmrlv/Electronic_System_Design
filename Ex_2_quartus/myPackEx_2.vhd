-- Ex 2: State Machine for Sequence Detector
-- This is a user-defined package file
-- Author: Zhengyang Lv
-- Student ID: PB17061238
-- Last edit: Oct. 18, 2020

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package myPackEx_2 is

constant OUT_WIDTH 	: integer 	:= 4;
constant CLK_PERIOD 	: time 		:= 20 ns;	-- 50 MHz

constant COUNTER_WIDTH	: integer	:= 8;			-- Counter width
constant CLK_DIV_NUM		: integer	:= 100;		-- divide into 1/100 frequency

end myPackEx_2;
