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
    x : in  complex_array; -- input signals in time domain (8 unit vector)
    y : out complex_array  -- output signals in frequency domain
  );
end fft8;

architecture Behavioral of fft8 is

    component butterfly 
      port (
        s1 : in  complex;
        s2 : in  complex;
        w  : in  complex;
        h1 : out complex;
        h2 : out complex
      );
    end component;
  
  signal g1 : complex_array := (others => (x"0000",x"0000"));
  signal g2 : complex_array := (others => (x"0000",x"0000"));
  
  -- phase factor, W_N = e^(-j*2*pi/N) and N=8 here.
  -- W_N^i = cos(2*pi*i/N) - j*sin(2*pi*i/N); and i has range from 0 to 7.
  
  -- w0 = 1.0 + j * 0.0
  -- w1 = 0.7071 - j * 0.7071
  -- w2 = 0.0 - j * 1.0
  -- w3 = -0.7071 - j * 0.7071
  
  -- 16-bit hexadecimal signed integers
  constant w : phase_factor := ((x"0040",x"0000"), (x"002d",x"ffd3"),
                                (x"0000",x"ffc0"), (x"ffd3",x"ffd3"));

begin

  -- first stage of butterfly's
  bf11 : butterfly port map(x(0),x(4),w(0),g1(0),g1(1));
  bf12 : butterfly port map(x(2),x(6),w(0),g1(2),g1(3));
  bf13 : butterfly port map(x(1),x(5),w(0),g1(4),g1(5));
  bf14 : butterfly port map(x(3),x(7),w(0),g1(6),g1(7));
  
  -- second stage of butterfly's
  bf21 : butterfly port map(g1(0),g1(2),w(0),g2(0),g2(2));
  bf22 : butterfly port map(g1(1),g1(3),w(2),g2(1),g2(3));
  bf23 : butterfly port map(g1(4),g1(6),w(0),g2(4),g2(6));
  bf24 : butterfly port map(g1(5),g1(7),w(2),g2(5),g2(7));
  
  -- third stage of butterfly's
  bf31 : butterfly port map(g2(0),g2(4),w(0),y(0),y(4));
  bf32 : butterfly port map(g2(1),g2(5),w(1),y(1),y(5));
  bf33 : butterfly port map(g2(2),g2(6),w(2),y(2),y(6));
  bf34 : butterfly port map(g2(3),g2(7),w(3),y(3),y(7));

end Behavioral;
