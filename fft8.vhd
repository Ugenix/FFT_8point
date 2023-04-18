----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2023 08:45:12
-- Design Name: 
-- Module Name: fft8 - Behavioral
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

entity fft8 is
  Port ( 
    x0_re : in std_logic_vector (11 downto 0); -- input signals in time domain
    x0_im : in std_logic_vector (11 downto 0);
    x1_re : in std_logic_vector (11 downto 0);
    x1_im : in std_logic_vector (11 downto 0);
    x2_re : in std_logic_vector (11 downto 0);
    x2_im : in std_logic_vector (11 downto 0);
    x3_re : in std_logic_vector (11 downto 0);
    x3_im : in std_logic_vector (11 downto 0);
    x4_re : in std_logic_vector (11 downto 0);
    x4_im : in std_logic_vector (11 downto 0);
    x5_re : in std_logic_vector (11 downto 0);
    x5_im : in std_logic_vector (11 downto 0);
    x6_re : in std_logic_vector (11 downto 0);
    x6_im : in std_logic_vector (11 downto 0);
    x7_re : in std_logic_vector (11 downto 0);
    x7_im : in std_logic_vector (11 downto 0);
    
    y0_re : out std_logic_vector (11 downto 0); -- output signals in frequency domain
    y0_im : out std_logic_vector (11 downto 0);
    y1_re : out std_logic_vector (11 downto 0);
    y1_im : out std_logic_vector (11 downto 0);
    y2_re : out std_logic_vector (11 downto 0);
    y2_im : out std_logic_vector (11 downto 0);
    y3_re : out std_logic_vector (11 downto 0);
    y3_im : out std_logic_vector (11 downto 0);
    y4_re : out std_logic_vector (11 downto 0);
    y4_im : out std_logic_vector (11 downto 0);
    y5_re : out std_logic_vector (11 downto 0);
    y5_im : out std_logic_vector (11 downto 0);
    y6_re : out std_logic_vector (11 downto 0);
    y6_im : out std_logic_vector (11 downto 0);
    y7_re : out std_logic_vector (11 downto 0);
    y7_im : out std_logic_vector (11 downto 0)
  );
end fft8;

architecture Behavioral of fft8 is

  type comp_array is array (0 to 7) of std_logic_vector (11 downto 0);
  
  signal g1_re : comp_array := (others => (x"000"));
  signal g1_im : comp_array := (others => (x"000"));
  signal g2_re : comp_array := (others => (x"000"));
  signal g2_im : comp_array := (others => (x"000"));
  
  -- phase factor, W_N = e^(-j*2*pi/N) and N=8 here.
  -- W_N^i = cos(2*pi*i/N) - j*sin(2*pi*i/N); and i has range from 0 to 7.
  -- w0 = 1.0 + j * 0.0
  signal w0_re : std_logic_vector (11 downto 0) := x"040";
  signal w0_im : std_logic_vector (11 downto 0) := x"000";
  -- w1 = 0.7071 - j * 0.7071
  signal w1_re : std_logic_vector (11 downto 0) := x"02D";
  signal w1_im : std_logic_vector (11 downto 0) := x"7D3";
  -- w2 = 0.0 - j * 1.0
  signal w2_re : std_logic_vector (11 downto 0) := x"000";
  signal w2_im : std_logic_vector (11 downto 0) := x"FF4";
  -- w3 = -0.7071 - j * 0.7071
  signal w3_re : std_logic_vector (11 downto 0) := x"7D3";
  signal w3_im : std_logic_vector (11 downto 0) := x"7D3";

  component butterfly is
    port (
      s1_re : in std_logic_vector  (11 downto 0);
      s1_im : in std_logic_vector  (11 downto 0);
      s2_re : in std_logic_vector  (11 downto 0);
      s2_im : in std_logic_vector  (11 downto 0);
      w_re  : in std_logic_vector  (11 downto 0);
      w_im  : in std_logic_vector  (11 downto 0);
      g1_re : out std_logic_vector (11 downto 0);
      g1_im : out std_logic_vector (11 downto 0);
      g2_re : out std_logic_vector (11 downto 0);
      g2_im : out std_logic_vector (11 downto 0)
    );
  end component;

begin

  --TODO: Meter señales de control ready
  -- first stage of butterfly's
  bf11 : butterfly port map(x0_re, x0_im, x4_re, x4_im, w0_re, w0_im, g1_re(0), g1_im(0), g1_re(1), g1_im(1));
  bf12 : butterfly port map(x2_re, x2_im, x6_re, x6_im, w0_re, w0_im, g1_re(2), g1_im(2), g1_re(3), g1_im(3));
  bf13 : butterfly port map(x1_re, x1_im, x5_re, x5_im, w0_re, w0_im, g1_re(4), g1_im(4), g1_re(5), g1_im(5));
  bf14 : butterfly port map(x3_re, x3_im, x7_re, x7_im, w0_re, w0_im, g1_re(6), g1_im(6), g1_re(7), g1_im(7));
  
  -- second stage of butterfly's
  bf21 : butterfly port map(g1_re(0), g1_im(0), g1_re(2), g1_im(2), w0_re, w0_im, g2_re(0), g2_im(0), g2_re(2), g2_im(2));
  bf22 : butterfly port map(g1_re(1), g1_im(1), g1_re(3), g1_im(3), w2_re, w2_im, g2_re(1), g2_im(1), g2_re(3), g2_im(3));
  bf23 : butterfly port map(g1_re(4), g1_im(4), g1_re(6), g1_im(6), w0_re, w0_im, g2_re(4), g2_im(4), g2_re(6), g2_im(6));
  bf24 : butterfly port map(g1_re(5), g1_im(5), g1_re(7), g1_im(7), w2_re, w2_im, g2_re(5), g2_im(5), g2_re(7), g2_im(7));
  
  -- third stage of butterfly's
  bf31 : butterfly port map(g2_re(0), g2_im(0), g2_re(4), g2_im(4), w0_re, w0_im, y0_re, y0_im, y4_re, y4_im);
  bf32 : butterfly port map(g2_re(1), g2_im(1), g2_re(5), g2_im(5), w1_re, w1_im, y1_re, y1_im, y5_re, y5_im);
  bf33 : butterfly port map(g2_re(2), g2_im(2), g2_re(6), g2_im(6), w2_re, w2_im, y2_re, y2_im, y6_re, y6_im);
  bf34 : butterfly port map(g2_re(3), g2_im(3), g2_re(7), g2_im(7), w3_re, w3_im, y3_re, y3_im, y7_re, y7_im);

end Behavioral;
