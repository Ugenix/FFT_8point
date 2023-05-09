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
use work.fft_pckg.all;

entity fft8_tb is
end fft8_tb;

architecture Behavioral of fft8_tb is

  signal x : complex_array;
  signal y : complex_array;  
  
begin
  
  -- Instantiate the Unit Under Test (UUT)
  uut : entity work.fft8 
    port map (
       x => x,
       y => y    
    );
  
  -- Stimulus process
  stim_proc : process
  begin
    -- Sample inputs in time domain (S5.6)
--    x(0) <= (x"0000", x"0000"); -- 0.0+0.0i
--    x(1) <= (x"0040", x"0000"); -- 1.0+0.0i
--    x(2) <= (x"0000", x"0000"); -- 0.0+0.0i
--    x(3) <= (x"ffc0", x"0000"); -- -1.0+0.0i
--    x(4) <= (x"0000", x"0000"); -- 0.0+0.0i
--    x(5) <= (x"0040", x"0000"); -- 1.0+0.0i
--    x(6) <= (x"0000", x"0000"); -- 0.0+0.0i
--    x(7) <= (x"ffc0", x"0000"); -- -1.0+0.0i
    
     x(0) <= ("111"&x"F80", "000"&x"04C"); -- -2.0+1.2i (S5.6)
     x(1) <= ("111"&x"F74", "000"&x"02C"); -- -2.2+1.7i (S5.6)
     x(2) <= ("000"&x"040", "111"&x"F80"); --  1.0-2.0i (S5.6)
     x(3) <= ("111"&x"F40", "000"&x"0CC"); -- -3.0+3.2i (S5.6)
     x(4) <= ("000"&x"120", "111"&x"F60"); --  4.5-2.5i (S5.6)
     x(5) <= ("111"&x"F9A", "000"&x"00C"); -- -1.6+0.2i (S5.6)
     x(6) <= ("000"&x"020", "000"&x"060"); --  0.5+1.5i (S5.6)
     x(7) <= ("111"&x"F4D", "111"&x"EF4"); -- -2.8-4.2i (S5.6)
    
    wait;
  end process;

end Behavioral;
