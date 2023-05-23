----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 11:51:05
-- Design Name: 
-- Module Name: butterfly - Behavioral
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
use work.fft_pckg.all;

entity butterfly is
  Port ( 
    s1 : in  complex;
    s2 : in  complex;
    w  : in  complex;
    h1 : out complex;
    h2 : out complex
  );
end butterfly;

architecture Behavioral of butterfly is
  
  signal s2w_mult_re : std_logic_vector ((2*(data_bits+extra_bits) - 1) downto 0);
  signal s2w_mult_im : std_logic_vector ((2*(data_bits+extra_bits) - 1) downto 0);

begin
  
  s2w_mult_re <= std_logic_vector ((signed(s2.re) * signed(w.re)) - (signed(s2.im) * signed(w.im)));
  s2w_mult_im <= std_logic_vector ((signed(s2.re) * signed(w.im)) + (signed(s2.im) * signed(w.re)));
  
  -- Butterfly equations
  -- Addition
  h1.re <= std_logic_vector (signed(s1.re) + 
           signed(s2w_mult_re((2*decimal_bits + int_bits + extra_bits - 1) downto (2*decimal_bits - decimal_bits))));
  h1.im <= std_logic_vector (signed(s1.im) + 
           signed(s2w_mult_im( (2*decimal_bits + int_bits + extra_bits - 1) downto (2*decimal_bits - decimal_bits))));
           
  -- Substraction
  h2.re <= std_logic_vector (signed(s1.re) - 
           signed(s2w_mult_re((2*decimal_bits + int_bits + extra_bits - 1) downto (2*decimal_bits - decimal_bits))));
  h2.im <= std_logic_vector( signed(s1.im) - 
           signed(s2w_mult_im( (2*decimal_bits + int_bits + extra_bits - 1) downto (2*decimal_bits - decimal_bits) )) );

end Behavioral;
