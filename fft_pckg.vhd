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

  -- FFT
  constant n_points       : integer := 8;  -- N point FFT
  constant n_phase_factor : integer := 4;  -- N/2
  constant data_bits      : integer := 11; -- S5.6 fixed point data
  -- Data
  constant int_bits       : integer := 5;
  constant decimal_bits   : integer := 6;
  constant extra_bits     : integer := 5;  -- Butterfly levels bit growth 

  type complex is
    record
      re : std_logic_vector ((data_bits + extra_bits - 1) downto 0);
      im : std_logic_vector ((data_bits + extra_bits - 1) downto 0);
    end record;
  
  type complex_array is array (0 to (n_points - 1)) of complex;
  type phase_factor is array (0 to (n_phase_factor - 1)) of complex;
  
end fft_pckg;

