----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2023 09:24:54
-- Design Name: 
-- Module Name: fft8_tb - Behavioral
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

entity fft8_tb is
end fft8_tb;

architecture Behavioral of fft8_tb is
  
  signal x0_re : std_logic_vector (11 downto 0); -- input signals in time domain
  signal x0_im : std_logic_vector (11 downto 0);
  signal x1_re : std_logic_vector (11 downto 0);
  signal x1_im : std_logic_vector (11 downto 0);
  signal x2_re : std_logic_vector (11 downto 0);
  signal x2_im : std_logic_vector (11 downto 0);
  signal x3_re : std_logic_vector (11 downto 0);
  signal x3_im : std_logic_vector (11 downto 0);
  signal x4_re : std_logic_vector (11 downto 0);
  signal x4_im : std_logic_vector (11 downto 0);
  signal x5_re : std_logic_vector (11 downto 0);
  signal x5_im : std_logic_vector (11 downto 0);
  signal x6_re : std_logic_vector (11 downto 0);
  signal x6_im : std_logic_vector (11 downto 0);
  signal x7_re : std_logic_vector (11 downto 0);
  signal x7_im : std_logic_vector (11 downto 0);
    
  signal y0_re : std_logic_vector (11 downto 0); -- output signals in frequency domain
  signal y0_im : std_logic_vector (11 downto 0);
  signal y1_re : std_logic_vector (11 downto 0);
  signal y1_im : std_logic_vector (11 downto 0);
  signal y2_re : std_logic_vector (11 downto 0);
  signal y2_im : std_logic_vector (11 downto 0);
  signal y3_re : std_logic_vector (11 downto 0);
  signal y3_im : std_logic_vector (11 downto 0);
  signal y4_re : std_logic_vector (11 downto 0);
  signal y4_im : std_logic_vector (11 downto 0);
  signal y5_re : std_logic_vector (11 downto 0);
  signal y5_im : std_logic_vector (11 downto 0);
  signal y6_re : std_logic_vector (11 downto 0);
  signal y6_im : std_logic_vector (11 downto 0);
  signal y7_re : std_logic_vector (11 downto 0);
  signal y7_im : std_logic_vector (11 downto 0);  
  
begin
  
  -- Instantiate the Unit Under Test (UUT)
  uut : entity work.fft8 
    port map (
       x0_re => x0_re,
       x0_im => x0_im,
       x1_re => x1_re,
       x1_im => x1_im,   
       x2_re => x2_re,
       x2_im => x2_im,
       x3_re => x3_re,
       x3_im => x3_im,
       x4_re => x4_re,
       x4_im => x4_im,
       x5_re => x5_re,
       x5_im => x5_im,
       x6_re => x6_re,
       x6_im => x6_im,
       x7_re => x7_re,
       x7_im => x7_im,
       
       y0_re => y0_re,
       y0_im => y0_im,
       y1_re => y1_re,
       y1_im => y1_im,
       y2_re => y2_re,
       y2_im => y2_im,
       y3_re => y3_re,
       y3_im => y3_im,
       y4_re => y4_re,
       y4_im => y4_im,
       y5_re => y5_re,
       y5_im => y5_im,
       y6_re => y6_re,
       y6_im => y6_im,
       y7_re => y7_re,
       y7_im => y7_im       
    );
  
  -- Stimulus process
  stim_proc : process
  begin
    -- Sample inputs in time domain
    x0_re <= x"F80"; -- -2.0
    x0_im <= x"04C"; -- 1.2
    
    x1_re <= x"F74"; -- -2.2
    x1_im <= x"02C"; -- 1.7
    
    x2_re <= x"040"; -- 1.0
    x2_im <= x"F80"; -- -2.0
    
    x3_re <= x"F40"; -- -3.0
    x3_im <= x"F34"; -- -3.2
    
    x4_re <= x"120"; -- 4.5
    x4_im <= x"F60"; -- -2.5
    
    x5_re <= x"F9A"; -- -1.6
    x5_im <= x"00C"; -- 0.2
    
    x6_re <= x"020"; -- 0.5
    x6_im <= x"060"; -- 1.5
    
    x7_re <= x"F4D"; -- -2.8
    x7_im <= x"EF4"; -- -4.2
    wait;
  end process;

end Behavioral;
