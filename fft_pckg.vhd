----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2023 09:06:26
-- Design Name: 
-- Module Name: fft_pckg - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

package fft_pckg is
  type complex is
    record
      re : std_logic_vector(15 downto 0); -- S5.6 + 5 extra bits
      im : std_logic_vector(15 downto 0);
    end record;
  
  type complex_array is array (0 to 7) of complex;
  type phase_factor is array (0 to 3) of complex;
  
end fft_pckg;

