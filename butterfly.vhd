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

entity butterfly is
  Port ( 
    s1_re : in  std_logic_vector (11 downto 0);
    s1_im : in  std_logic_vector (11 downto 0);
    s2_re : in  std_logic_vector (11 downto 0);
    s2_im : in  std_logic_vector (11 downto 0);
    w_re  : in  std_logic_vector (11 downto 0);
    w_im  : in  std_logic_vector (11 downto 0);
    g1_re : out std_logic_vector (11 downto 0);
    g1_im : out std_logic_vector (11 downto 0);
    g2_re : out std_logic_vector (11 downto 0);
    g2_im : out std_logic_vector (11 downto 0)
  );
end butterfly;

architecture Behavioral of butterfly is

  signal s2w_mult_re : std_logic_vector (23 downto 0);
  signal s2w_mult_im : std_logic_vector (23 downto 0);

begin

  -- Complex multiplicacion
  s2w_mult_re <= std_logic_vector((signed(s2_re) * signed(w_re)) - (signed(s2_im) * signed(w_im)));
  s2w_mult_im <= std_logic_vector((signed(s2_re) * signed(w_im)) + (signed(s2_im) * signed(w_re)));
  
  -- Butterfly equations
  -- Addition
  g1_re <= std_logic_vector(signed(s1_re) + signed(s2w_mult_re(23 downto 12)));
  g1_im <= std_logic_vector(signed(s1_im) + signed(s2w_mult_im(23 downto 12)));
  -- Substraction
  g2_re <= std_logic_vector(signed(s1_re) - signed(s2w_mult_re(23 downto 12)));
  g2_im <= std_logic_vector(signed(s1_im) - signed(s2w_mult_im(23 downto 12)));

end Behavioral;
