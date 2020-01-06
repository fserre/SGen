--------------------------------------------------------------------------------
--                     SmallMultTableP3x3r6XuYu_F700_uid9
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP3x3r6XuYu_F700_uid9 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu_F700_uid9 is
signal TableOut :  std_logic_vector(5 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "000000" when "000000",
   "000000" when "000001",
   "000000" when "000010",
   "000000" when "000011",
   "000000" when "000100",
   "000000" when "000101",
   "000000" when "000110",
   "000000" when "000111",
   "000000" when "001000",
   "000001" when "001001",
   "000010" when "001010",
   "000011" when "001011",
   "000100" when "001100",
   "000101" when "001101",
   "000110" when "001110",
   "000111" when "001111",
   "000000" when "010000",
   "000010" when "010001",
   "000100" when "010010",
   "000110" when "010011",
   "001000" when "010100",
   "001010" when "010101",
   "001100" when "010110",
   "001110" when "010111",
   "000000" when "011000",
   "000011" when "011001",
   "000110" when "011010",
   "001001" when "011011",
   "001100" when "011100",
   "001111" when "011101",
   "010010" when "011110",
   "010101" when "011111",
   "000000" when "100000",
   "000100" when "100001",
   "001000" when "100010",
   "001100" when "100011",
   "010000" when "100100",
   "010100" when "100101",
   "011000" when "100110",
   "011100" when "100111",
   "000000" when "101000",
   "000101" when "101001",
   "001010" when "101010",
   "001111" when "101011",
   "010100" when "101100",
   "011001" when "101101",
   "011110" when "101110",
   "100011" when "101111",
   "000000" when "110000",
   "000110" when "110001",
   "001100" when "110010",
   "010010" when "110011",
   "011000" when "110100",
   "011110" when "110101",
   "100100" when "110110",
   "101010" when "110111",
   "000000" when "111000",
   "000111" when "111001",
   "001110" when "111010",
   "010101" when "111011",
   "011100" when "111100",
   "100011" when "111101",
   "101010" when "111110",
   "110001" when "111111",
   "------" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                              Compressor_14_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_14_3 is
   port ( X0 : in  std_logic_vector(3 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_14_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "00000", 
      "001" when "00001", 
      "001" when "00010", 
      "010" when "00011", 
      "001" when "00100", 
      "010" when "00101", 
      "010" when "00110", 
      "011" when "00111", 
      "001" when "01000", 
      "010" when "01001", 
      "010" when "01010", 
      "011" when "01011", 
      "010" when "01100", 
      "011" when "01101", 
      "011" when "01110", 
      "100" when "01111", 
      "010" when "10000", 
      "011" when "10001", 
      "011" when "10010", 
      "100" when "10011", 
      "011" when "10100", 
      "100" when "10101", 
      "100" when "10110", 
      "101" when "10111", 
      "011" when "11000", 
      "100" when "11001", 
      "100" when "11010", 
      "101" when "11011", 
      "100" when "11100", 
      "101" when "11101", 
      "101" when "11110", 
      "110" when "11111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_23_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_23_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_23_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "00000", 
      "001" when "00001", 
      "001" when "00010", 
      "010" when "00011", 
      "001" when "00100", 
      "010" when "00101", 
      "010" when "00110", 
      "011" when "00111", 
      "010" when "01000", 
      "011" when "01001", 
      "011" when "01010", 
      "100" when "01011", 
      "011" when "01100", 
      "100" when "01101", 
      "100" when "01110", 
      "101" when "01111", 
      "010" when "10000", 
      "011" when "10001", 
      "011" when "10010", 
      "100" when "10011", 
      "011" when "10100", 
      "100" when "10101", 
      "100" when "10110", 
      "101" when "10111", 
      "100" when "11000", 
      "101" when "11001", 
      "101" when "11010", 
      "110" when "11011", 
      "101" when "11100", 
      "110" when "11101", 
      "110" when "11110", 
      "111" when "11111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_13_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_13_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_13_3 is
signal X :  std_logic_vector(3 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "0000", 
      "001" when "0001", 
      "001" when "0010", 
      "010" when "0011", 
      "001" when "0100", 
      "010" when "0101", 
      "010" when "0110", 
      "011" when "0111", 
      "010" when "1000", 
      "011" when "1001", 
      "011" when "1010", 
      "100" when "1011", 
      "011" when "1100", 
      "100" when "1101", 
      "100" when "1110", 
      "101" when "1111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_14_f700_uid60
--                     (IntAdderClassical_14_F700_uid62)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_14_f700_uid60 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(13 downto 0);
          Y : in  std_logic_vector(13 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of IntAdder_14_f700_uid60 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--              IntMultiplier_UsingDSP_8_8_16_unsigned_F700_uid4
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_8_8_16_unsigned_F700_uid4 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : in  std_logic_vector(7 downto 0);
          R : out  std_logic_vector(15 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_8_8_16_unsigned_F700_uid4 is
   component IntAdder_14_f700_uid60 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(13 downto 0);
             Y : in  std_logic_vector(13 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(13 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F700_uid9 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component Compressor_14_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_23_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_13_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

signal XX_m5 :  std_logic_vector(7 downto 0);
signal YY_m5 :  std_logic_vector(7 downto 0);
signal Xp_m5b7 :  std_logic_vector(8 downto 0);
signal Yp_m5b7 :  std_logic_vector(8 downto 0);
signal x_m5b7_0 :  std_logic_vector(2 downto 0);
signal x_m5b7_1 :  std_logic_vector(2 downto 0);
signal x_m5b7_2 :  std_logic_vector(2 downto 0);
signal y_m5b7_0 :  std_logic_vector(2 downto 0);
signal y_m5b7_1 :  std_logic_vector(2 downto 0);
signal y_m5b7_2 :  std_logic_vector(2 downto 0);
signal Y0X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w0_0 :  std_logic;
signal heap_bh6_w1_0 :  std_logic;
signal heap_bh6_w2_0 :  std_logic;
signal heap_bh6_w3_0, heap_bh6_w3_0_d1 :  std_logic;
signal Y0X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w2_1 :  std_logic;
signal heap_bh6_w3_1 :  std_logic;
signal heap_bh6_w4_0 :  std_logic;
signal heap_bh6_w5_0 :  std_logic;
signal heap_bh6_w6_0 :  std_logic;
signal Y0X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w5_1 :  std_logic;
signal heap_bh6_w6_1 :  std_logic;
signal heap_bh6_w7_0 :  std_logic;
signal heap_bh6_w8_0 :  std_logic;
signal heap_bh6_w9_0 :  std_logic;
signal Y1X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w2_2 :  std_logic;
signal heap_bh6_w3_2 :  std_logic;
signal heap_bh6_w4_1 :  std_logic;
signal heap_bh6_w5_2 :  std_logic;
signal heap_bh6_w6_2 :  std_logic;
signal Y1X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w4_2 :  std_logic;
signal heap_bh6_w5_3 :  std_logic;
signal heap_bh6_w6_3 :  std_logic;
signal heap_bh6_w7_1 :  std_logic;
signal heap_bh6_w8_1 :  std_logic;
signal heap_bh6_w9_1 :  std_logic;
signal Y1X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w7_2 :  std_logic;
signal heap_bh6_w8_2 :  std_logic;
signal heap_bh6_w9_2 :  std_logic;
signal heap_bh6_w10_0 :  std_logic;
signal heap_bh6_w11_0 :  std_logic;
signal heap_bh6_w12_0, heap_bh6_w12_0_d1 :  std_logic;
signal Y2X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w5_4 :  std_logic;
signal heap_bh6_w6_4 :  std_logic;
signal heap_bh6_w7_3 :  std_logic;
signal heap_bh6_w8_3 :  std_logic;
signal heap_bh6_w9_3 :  std_logic;
signal Y2X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w7_4 :  std_logic;
signal heap_bh6_w8_4 :  std_logic;
signal heap_bh6_w9_4 :  std_logic;
signal heap_bh6_w10_1 :  std_logic;
signal heap_bh6_w11_1 :  std_logic;
signal heap_bh6_w12_1 :  std_logic;
signal Y2X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w10_2 :  std_logic;
signal heap_bh6_w11_2 :  std_logic;
signal heap_bh6_w12_2 :  std_logic;
signal heap_bh6_w13_0, heap_bh6_w13_0_d1 :  std_logic;
signal heap_bh6_w14_0, heap_bh6_w14_0_d1 :  std_logic;
signal heap_bh6_w15_0, heap_bh6_w15_0_d1 :  std_logic;
signal tempR_bh6_0, tempR_bh6_0_d1 :  std_logic_vector(1 downto 0);
signal CompressorIn_bh6_0_0 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_0_1 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_0_0 :  std_logic_vector(2 downto 0);
signal heap_bh6_w5_5, heap_bh6_w5_5_d1 :  std_logic;
signal heap_bh6_w6_5 :  std_logic;
signal heap_bh6_w7_5, heap_bh6_w7_5_d1 :  std_logic;
signal CompressorIn_bh6_1_2 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_1_3 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_1_1 :  std_logic_vector(2 downto 0);
signal heap_bh6_w6_6 :  std_logic;
signal heap_bh6_w7_6 :  std_logic;
signal heap_bh6_w8_5 :  std_logic;
signal CompressorIn_bh6_2_4 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_2_5 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_2_2 :  std_logic_vector(2 downto 0);
signal heap_bh6_w7_7 :  std_logic;
signal heap_bh6_w8_6 :  std_logic;
signal heap_bh6_w9_5, heap_bh6_w9_5_d1 :  std_logic;
signal CompressorIn_bh6_3_6 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_3_7 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_3_3 :  std_logic_vector(2 downto 0);
signal heap_bh6_w8_7 :  std_logic;
signal heap_bh6_w9_6 :  std_logic;
signal heap_bh6_w10_3 :  std_logic;
signal CompressorIn_bh6_4_8 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_4_9 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_4_4 :  std_logic_vector(2 downto 0);
signal heap_bh6_w9_7 :  std_logic;
signal heap_bh6_w10_4 :  std_logic;
signal heap_bh6_w11_3, heap_bh6_w11_3_d1 :  std_logic;
signal CompressorIn_bh6_5_10 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_5_11 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_5_5 :  std_logic_vector(2 downto 0);
signal heap_bh6_w2_3 :  std_logic;
signal heap_bh6_w3_3, heap_bh6_w3_3_d1 :  std_logic;
signal heap_bh6_w4_3, heap_bh6_w4_3_d1 :  std_logic;
signal CompressorIn_bh6_6_12 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_6_13 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_6_6 :  std_logic_vector(2 downto 0);
signal heap_bh6_w11_4 :  std_logic;
signal heap_bh6_w12_3, heap_bh6_w12_3_d1 :  std_logic;
signal heap_bh6_w13_1, heap_bh6_w13_1_d1 :  std_logic;
signal CompressorIn_bh6_7_14 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_7_15 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_7_7 :  std_logic_vector(2 downto 0);
signal heap_bh6_w4_4, heap_bh6_w4_4_d1 :  std_logic;
signal heap_bh6_w5_6, heap_bh6_w5_6_d1 :  std_logic;
signal heap_bh6_w6_7 :  std_logic;
signal tempR_bh6_1, tempR_bh6_1_d1 :  std_logic;
signal CompressorIn_bh6_8_16 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_8_17 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_8_8 :  std_logic_vector(2 downto 0);
signal heap_bh6_w10_5, heap_bh6_w10_5_d1 :  std_logic;
signal heap_bh6_w11_5, heap_bh6_w11_5_d1 :  std_logic;
signal heap_bh6_w12_4, heap_bh6_w12_4_d1 :  std_logic;
signal CompressorIn_bh6_9_18 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_9_19 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_9_9 :  std_logic_vector(2 downto 0);
signal heap_bh6_w6_8, heap_bh6_w6_8_d1 :  std_logic;
signal heap_bh6_w7_8, heap_bh6_w7_8_d1 :  std_logic;
signal heap_bh6_w8_8, heap_bh6_w8_8_d1 :  std_logic;
signal CompressorIn_bh6_10_20 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_10_21 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_10_10 :  std_logic_vector(2 downto 0);
signal heap_bh6_w8_9, heap_bh6_w8_9_d1 :  std_logic;
signal heap_bh6_w9_8, heap_bh6_w9_8_d1 :  std_logic;
signal heap_bh6_w10_6, heap_bh6_w10_6_d1 :  std_logic;
signal CompressorIn_bh6_11_22 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_11_23 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_11_11 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_5 :  std_logic;
signal heap_bh6_w13_2 :  std_logic;
signal heap_bh6_w14_1 :  std_logic;
signal finalAdderIn0_bh6 :  std_logic_vector(13 downto 0);
signal finalAdderIn1_bh6 :  std_logic_vector(13 downto 0);
signal finalAdderCin_bh6 :  std_logic;
signal finalAdderOut_bh6 :  std_logic_vector(13 downto 0);
signal CompressionResult6 :  std_logic_vector(16 downto 0);
attribute rom_extract: string;
attribute rom_style: string;
attribute rom_extract of SmallMultTableP3x3r6XuYu_F700_uid9: component is "yes";
attribute rom_style of SmallMultTableP3x3r6XuYu_F700_uid9: component is "distributed";
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            heap_bh6_w3_0_d1 <=  heap_bh6_w3_0;
            heap_bh6_w12_0_d1 <=  heap_bh6_w12_0;
            heap_bh6_w13_0_d1 <=  heap_bh6_w13_0;
            heap_bh6_w14_0_d1 <=  heap_bh6_w14_0;
            heap_bh6_w15_0_d1 <=  heap_bh6_w15_0;
            tempR_bh6_0_d1 <=  tempR_bh6_0;
            heap_bh6_w5_5_d1 <=  heap_bh6_w5_5;
            heap_bh6_w7_5_d1 <=  heap_bh6_w7_5;
            heap_bh6_w9_5_d1 <=  heap_bh6_w9_5;
            heap_bh6_w11_3_d1 <=  heap_bh6_w11_3;
            heap_bh6_w3_3_d1 <=  heap_bh6_w3_3;
            heap_bh6_w4_3_d1 <=  heap_bh6_w4_3;
            heap_bh6_w12_3_d1 <=  heap_bh6_w12_3;
            heap_bh6_w13_1_d1 <=  heap_bh6_w13_1;
            heap_bh6_w4_4_d1 <=  heap_bh6_w4_4;
            heap_bh6_w5_6_d1 <=  heap_bh6_w5_6;
            tempR_bh6_1_d1 <=  tempR_bh6_1;
            heap_bh6_w10_5_d1 <=  heap_bh6_w10_5;
            heap_bh6_w11_5_d1 <=  heap_bh6_w11_5;
            heap_bh6_w12_4_d1 <=  heap_bh6_w12_4;
            heap_bh6_w6_8_d1 <=  heap_bh6_w6_8;
            heap_bh6_w7_8_d1 <=  heap_bh6_w7_8;
            heap_bh6_w8_8_d1 <=  heap_bh6_w8_8;
            heap_bh6_w8_9_d1 <=  heap_bh6_w8_9;
            heap_bh6_w9_8_d1 <=  heap_bh6_w9_8;
            heap_bh6_w10_6_d1 <=  heap_bh6_w10_6;
         end if;
      end process;
   XX_m5 <= X ;
   YY_m5 <= Y ;
   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=0 msbX=8 msbY=8
   Xp_m5b7 <= XX_m5(7 downto 0) & "0";
   Yp_m5b7 <= YY_m5(7 downto 0) & "0";
   x_m5b7_0 <= Xp_m5b7(2 downto 0);
   x_m5b7_1 <= Xp_m5b7(5 downto 3);
   x_m5b7_2 <= Xp_m5b7(8 downto 6);
   y_m5b7_0 <= Yp_m5b7(2 downto 0);
   y_m5b7_1 <= Yp_m5b7(5 downto 3);
   y_m5b7_2 <= Yp_m5b7(8 downto 6);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_7_m5 <= y_m5b7_0 & x_m5b7_0;
   PP_m5_7X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_7_m5,
                 Y => PP7X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w0_0 <= PP7X0Y0_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w1_0 <= PP7X0Y0_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w2_0 <= PP7X0Y0_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w3_0 <= PP7X0Y0_m5(5); -- cycle= 0 cp= 3.8478e-10

   Y0X1_7_m5 <= y_m5b7_0 & x_m5b7_1;
   PP_m5_7X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_7_m5,
                 Y => PP7X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w2_1 <= PP7X1Y0_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w3_1 <= PP7X1Y0_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w4_0 <= PP7X1Y0_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w5_0 <= PP7X1Y0_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w6_0 <= PP7X1Y0_m5(5); -- cycle= 0 cp= 3.8478e-10

   Y0X2_7_m5 <= y_m5b7_0 & x_m5b7_2;
   PP_m5_7X2Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_7_m5,
                 Y => PP7X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w5_1 <= PP7X2Y0_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w6_1 <= PP7X2Y0_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w7_0 <= PP7X2Y0_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w8_0 <= PP7X2Y0_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w9_0 <= PP7X2Y0_m5(5); -- cycle= 0 cp= 3.8478e-10

   -- Partial product row number 1
   Y1X0_7_m5 <= y_m5b7_1 & x_m5b7_0;
   PP_m5_7X0Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_7_m5,
                 Y => PP7X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w2_2 <= PP7X0Y1_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w3_2 <= PP7X0Y1_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w4_1 <= PP7X0Y1_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w5_2 <= PP7X0Y1_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w6_2 <= PP7X0Y1_m5(5); -- cycle= 0 cp= 3.8478e-10

   Y1X1_7_m5 <= y_m5b7_1 & x_m5b7_1;
   PP_m5_7X1Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_7_m5,
                 Y => PP7X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w4_2 <= PP7X1Y1_m5(0); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w5_3 <= PP7X1Y1_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w6_3 <= PP7X1Y1_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w7_1 <= PP7X1Y1_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w8_1 <= PP7X1Y1_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w9_1 <= PP7X1Y1_m5(5); -- cycle= 0 cp= 3.8478e-10

   Y1X2_7_m5 <= y_m5b7_1 & x_m5b7_2;
   PP_m5_7X2Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_7_m5,
                 Y => PP7X2Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w7_2 <= PP7X2Y1_m5(0); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w8_2 <= PP7X2Y1_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w9_2 <= PP7X2Y1_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w10_0 <= PP7X2Y1_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w11_0 <= PP7X2Y1_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w12_0 <= PP7X2Y1_m5(5); -- cycle= 0 cp= 3.8478e-10

   -- Partial product row number 2
   Y2X0_7_m5 <= y_m5b7_2 & x_m5b7_0;
   PP_m5_7X0Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_7_m5,
                 Y => PP7X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w5_4 <= PP7X0Y2_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w6_4 <= PP7X0Y2_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w7_3 <= PP7X0Y2_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w8_3 <= PP7X0Y2_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w9_3 <= PP7X0Y2_m5(5); -- cycle= 0 cp= 3.8478e-10

   Y2X1_7_m5 <= y_m5b7_2 & x_m5b7_1;
   PP_m5_7X1Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_7_m5,
                 Y => PP7X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w7_4 <= PP7X1Y2_m5(0); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w8_4 <= PP7X1Y2_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w9_4 <= PP7X1Y2_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w10_1 <= PP7X1Y2_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w11_1 <= PP7X1Y2_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w12_1 <= PP7X1Y2_m5(5); -- cycle= 0 cp= 3.8478e-10

   Y2X2_7_m5 <= y_m5b7_2 & x_m5b7_2;
   PP_m5_7X2Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_7_m5,
                 Y => PP7X2Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w10_2 <= PP7X2Y2_m5(0); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w11_2 <= PP7X2Y2_m5(1); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w12_2 <= PP7X2Y2_m5(2); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w13_0 <= PP7X2Y2_m5(3); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w14_0 <= PP7X2Y2_m5(4); -- cycle= 0 cp= 3.8478e-10
   heap_bh6_w15_0 <= PP7X2Y2_m5(5); -- cycle= 0 cp= 3.8478e-10

   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
      -- All the constant bits are zero, nothing to add

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh6_0 <= heap_bh6_w1_0 & heap_bh6_w0_0; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_0_0 <= heap_bh6_w5_4 & heap_bh6_w5_3 & heap_bh6_w5_2 & heap_bh6_w5_1;
   CompressorIn_bh6_0_1(0) <= heap_bh6_w6_4;
   Compressor_bh6_0: Compressor_14_3
      port map ( R => CompressorOut_bh6_0_0   ,
                 X0 => CompressorIn_bh6_0_0,
                 X1 => CompressorIn_bh6_0_1);
   heap_bh6_w5_5 <= CompressorOut_bh6_0_0(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w6_5 <= CompressorOut_bh6_0_0(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w7_5 <= CompressorOut_bh6_0_0(2); -- cycle= 0 cp= 7.5704e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_1_2 <= heap_bh6_w6_3 & heap_bh6_w6_2 & heap_bh6_w6_1 & heap_bh6_w6_0;
   CompressorIn_bh6_1_3(0) <= heap_bh6_w7_4;
   Compressor_bh6_1: Compressor_14_3
      port map ( R => CompressorOut_bh6_1_1   ,
                 X0 => CompressorIn_bh6_1_2,
                 X1 => CompressorIn_bh6_1_3);
   heap_bh6_w6_6 <= CompressorOut_bh6_1_1(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w7_6 <= CompressorOut_bh6_1_1(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w8_5 <= CompressorOut_bh6_1_1(2); -- cycle= 0 cp= 7.5704e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_2_4 <= heap_bh6_w7_3 & heap_bh6_w7_2 & heap_bh6_w7_1 & heap_bh6_w7_0;
   CompressorIn_bh6_2_5(0) <= heap_bh6_w8_4;
   Compressor_bh6_2: Compressor_14_3
      port map ( R => CompressorOut_bh6_2_2   ,
                 X0 => CompressorIn_bh6_2_4,
                 X1 => CompressorIn_bh6_2_5);
   heap_bh6_w7_7 <= CompressorOut_bh6_2_2(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w8_6 <= CompressorOut_bh6_2_2(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w9_5 <= CompressorOut_bh6_2_2(2); -- cycle= 0 cp= 7.5704e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_3_6 <= heap_bh6_w8_3 & heap_bh6_w8_2 & heap_bh6_w8_1 & heap_bh6_w8_0;
   CompressorIn_bh6_3_7(0) <= heap_bh6_w9_4;
   Compressor_bh6_3: Compressor_14_3
      port map ( R => CompressorOut_bh6_3_3   ,
                 X0 => CompressorIn_bh6_3_6,
                 X1 => CompressorIn_bh6_3_7);
   heap_bh6_w8_7 <= CompressorOut_bh6_3_3(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w9_6 <= CompressorOut_bh6_3_3(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w10_3 <= CompressorOut_bh6_3_3(2); -- cycle= 0 cp= 7.5704e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_4_8 <= heap_bh6_w9_3 & heap_bh6_w9_2 & heap_bh6_w9_1 & heap_bh6_w9_0;
   CompressorIn_bh6_4_9(0) <= heap_bh6_w10_2;
   Compressor_bh6_4: Compressor_14_3
      port map ( R => CompressorOut_bh6_4_4   ,
                 X0 => CompressorIn_bh6_4_8,
                 X1 => CompressorIn_bh6_4_9);
   heap_bh6_w9_7 <= CompressorOut_bh6_4_4(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w10_4 <= CompressorOut_bh6_4_4(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w11_3 <= CompressorOut_bh6_4_4(2); -- cycle= 0 cp= 7.5704e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_5_10 <= heap_bh6_w2_2 & heap_bh6_w2_1 & heap_bh6_w2_0;
   CompressorIn_bh6_5_11 <= heap_bh6_w3_2 & heap_bh6_w3_1;
   Compressor_bh6_5: Compressor_23_3
      port map ( R => CompressorOut_bh6_5_5   ,
                 X0 => CompressorIn_bh6_5_10,
                 X1 => CompressorIn_bh6_5_11);
   heap_bh6_w2_3 <= CompressorOut_bh6_5_5(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w3_3 <= CompressorOut_bh6_5_5(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w4_3 <= CompressorOut_bh6_5_5(2); -- cycle= 0 cp= 7.5704e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_6_12 <= heap_bh6_w11_2 & heap_bh6_w11_1 & heap_bh6_w11_0;
   CompressorIn_bh6_6_13 <= heap_bh6_w12_2 & heap_bh6_w12_1;
   Compressor_bh6_6: Compressor_23_3
      port map ( R => CompressorOut_bh6_6_6   ,
                 X0 => CompressorIn_bh6_6_12,
                 X1 => CompressorIn_bh6_6_13);
   heap_bh6_w11_4 <= CompressorOut_bh6_6_6(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w12_3 <= CompressorOut_bh6_6_6(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w13_1 <= CompressorOut_bh6_6_6(2); -- cycle= 0 cp= 7.5704e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_7_14 <= heap_bh6_w4_2 & heap_bh6_w4_1 & heap_bh6_w4_0;
   CompressorIn_bh6_7_15(0) <= heap_bh6_w5_0;
   Compressor_bh6_7: Compressor_13_3
      port map ( R => CompressorOut_bh6_7_7   ,
                 X0 => CompressorIn_bh6_7_14,
                 X1 => CompressorIn_bh6_7_15);
   heap_bh6_w4_4 <= CompressorOut_bh6_7_7(0); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w5_6 <= CompressorOut_bh6_7_7(1); -- cycle= 0 cp= 7.5704e-10
   heap_bh6_w6_7 <= CompressorOut_bh6_7_7(2); -- cycle= 0 cp= 7.5704e-10
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh6_1 <= heap_bh6_w2_3; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_8_16 <= heap_bh6_w10_1 & heap_bh6_w10_0 & heap_bh6_w10_4 & heap_bh6_w10_3;
   CompressorIn_bh6_8_17(0) <= heap_bh6_w11_4;
   Compressor_bh6_8: Compressor_14_3
      port map ( R => CompressorOut_bh6_8_8   ,
                 X0 => CompressorIn_bh6_8_16,
                 X1 => CompressorIn_bh6_8_17);
   heap_bh6_w10_5 <= CompressorOut_bh6_8_8(0); -- cycle= 0 cp= 1.1293e-09
   heap_bh6_w11_5 <= CompressorOut_bh6_8_8(1); -- cycle= 0 cp= 1.1293e-09
   heap_bh6_w12_4 <= CompressorOut_bh6_8_8(2); -- cycle= 0 cp= 1.1293e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_9_18 <= heap_bh6_w6_7 & heap_bh6_w6_6 & heap_bh6_w6_5;
   CompressorIn_bh6_9_19 <= heap_bh6_w7_7 & heap_bh6_w7_6;
   Compressor_bh6_9: Compressor_23_3
      port map ( R => CompressorOut_bh6_9_9   ,
                 X0 => CompressorIn_bh6_9_18,
                 X1 => CompressorIn_bh6_9_19);
   heap_bh6_w6_8 <= CompressorOut_bh6_9_9(0); -- cycle= 0 cp= 1.1293e-09
   heap_bh6_w7_8 <= CompressorOut_bh6_9_9(1); -- cycle= 0 cp= 1.1293e-09
   heap_bh6_w8_8 <= CompressorOut_bh6_9_9(2); -- cycle= 0 cp= 1.1293e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_10_20 <= heap_bh6_w8_7 & heap_bh6_w8_6 & heap_bh6_w8_5;
   CompressorIn_bh6_10_21 <= heap_bh6_w9_7 & heap_bh6_w9_6;
   Compressor_bh6_10: Compressor_23_3
      port map ( R => CompressorOut_bh6_10_10   ,
                 X0 => CompressorIn_bh6_10_20,
                 X1 => CompressorIn_bh6_10_21);
   heap_bh6_w8_9 <= CompressorOut_bh6_10_10(0); -- cycle= 0 cp= 1.1293e-09
   heap_bh6_w9_8 <= CompressorOut_bh6_10_10(1); -- cycle= 0 cp= 1.1293e-09
   heap_bh6_w10_6 <= CompressorOut_bh6_10_10(2); -- cycle= 0 cp= 1.1293e-09

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_11_22 <= heap_bh6_w12_0_d1 & heap_bh6_w12_3_d1 & heap_bh6_w12_4_d1;
   CompressorIn_bh6_11_23 <= heap_bh6_w13_0_d1 & heap_bh6_w13_1_d1;
   Compressor_bh6_11: Compressor_23_3
      port map ( R => CompressorOut_bh6_11_11   ,
                 X0 => CompressorIn_bh6_11_22,
                 X1 => CompressorIn_bh6_11_23);
   heap_bh6_w12_5 <= CompressorOut_bh6_11_11(0); -- cycle= 1 cp= 0
   heap_bh6_w13_2 <= CompressorOut_bh6_11_11(1); -- cycle= 1 cp= 0
   heap_bh6_w14_1 <= CompressorOut_bh6_11_11(2); -- cycle= 1 cp= 0
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh6 <= "0" & heap_bh6_w15_0_d1 & heap_bh6_w14_0_d1 & heap_bh6_w13_2 & heap_bh6_w12_5 & heap_bh6_w11_3_d1 & heap_bh6_w10_6_d1 & heap_bh6_w9_5_d1 & heap_bh6_w8_9_d1 & heap_bh6_w7_5_d1 & heap_bh6_w6_8_d1 & heap_bh6_w5_6_d1 & heap_bh6_w4_4_d1 & heap_bh6_w3_0_d1;
   finalAdderIn1_bh6 <= "0" & '0' & heap_bh6_w14_1 & '0' & '0' & heap_bh6_w11_5_d1 & heap_bh6_w10_5_d1 & heap_bh6_w9_8_d1 & heap_bh6_w8_8_d1 & heap_bh6_w7_8_d1 & '0' & heap_bh6_w5_5_d1 & heap_bh6_w4_3_d1 & heap_bh6_w3_3_d1;
   finalAdderCin_bh6 <= '0';
   Adder_final6_0: IntAdder_14_f700_uid60  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh6,
                 R => finalAdderOut_bh6   ,
                 X => finalAdderIn0_bh6,
                 Y => finalAdderIn1_bh6);
   -- concatenate all the compressed chunks
   CompressionResult6 <= finalAdderOut_bh6 & tempR_bh6_1_d1 & tempR_bh6_0_d1;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult6(15 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_17_f700_uid70
--                     (IntAdderClassical_17_F700_uid72)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_17_f700_uid70 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(16 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(16 downto 0)   );
end entity;

architecture arch of IntAdder_17_f700_uid70 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                                    mult
--                       (FPMult_8_7_8_7_8_7_F700_uid2)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2011
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity mult is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(8+7+2 downto 0);
          Y : in  std_logic_vector(8+7+2 downto 0);
          R : out  std_logic_vector(8+7+2 downto 0)   );
end entity;

architecture arch of mult is
   component IntMultiplier_UsingDSP_8_8_16_unsigned_F700_uid4 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Y : in  std_logic_vector(7 downto 0);
             R : out  std_logic_vector(15 downto 0)   );
   end component;

   component IntAdder_17_f700_uid70 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(16 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(16 downto 0)   );
   end component;

signal sign, sign_d1, sign_d2 :  std_logic;
signal expX :  std_logic_vector(7 downto 0);
signal expY :  std_logic_vector(7 downto 0);
signal expSumPreSub, expSumPreSub_d1 :  std_logic_vector(9 downto 0);
signal bias, bias_d1 :  std_logic_vector(9 downto 0);
signal expSum :  std_logic_vector(9 downto 0);
signal sigX :  std_logic_vector(7 downto 0);
signal sigY :  std_logic_vector(7 downto 0);
signal sigProd :  std_logic_vector(15 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1, exc_d2 :  std_logic_vector(1 downto 0);
signal norm :  std_logic;
signal expPostNorm :  std_logic_vector(9 downto 0);
signal sigProdExt, sigProdExt_d1 :  std_logic_vector(15 downto 0);
signal expSig, expSig_d1 :  std_logic_vector(16 downto 0);
signal sticky, sticky_d1 :  std_logic;
signal guard :  std_logic;
signal round :  std_logic;
signal expSigPostRound :  std_logic_vector(16 downto 0);
signal excPostNorm :  std_logic_vector(1 downto 0);
signal finalExc :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sign_d1 <=  sign;
            sign_d2 <=  sign_d1;
            expSumPreSub_d1 <=  expSumPreSub;
            bias_d1 <=  bias;
            exc_d1 <=  exc;
            exc_d2 <=  exc_d1;
            sigProdExt_d1 <=  sigProdExt;
            expSig_d1 <=  expSig;
            sticky_d1 <=  sticky;
         end if;
      end process;
   sign <= X(15) xor Y(15);
   expX <= X(14 downto 7);
   expY <= Y(14 downto 7);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(127,10);
   ----------------Synchro barrier, entering cycle 1----------------
   expSum <= expSumPreSub_d1 - bias_d1;
   ----------------Synchro barrier, entering cycle 0----------------
   sigX <= "1" & X(6 downto 0);
   sigY <= "1" & Y(6 downto 0);
   SignificandMultiplication: IntMultiplier_UsingDSP_8_8_16_unsigned_F700_uid4  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => sigProd,
                 X => sigX,
                 Y => sigY);
   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 0----------------
   excSel <= X(17 downto 16) & Y(17 downto 16);
   with excSel select 
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   norm <= sigProd(15);
   -- exponent update
   expPostNorm <= expSum + ("000000000" & norm);
   -- significand normalization shift
   sigProdExt <= sigProd(14 downto 0) & "0" when norm='1' else
                         sigProd(13 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(15 downto 9);
   sticky <= sigProdExt(8);
   ----------------Synchro barrier, entering cycle 2----------------
   guard <= '0' when sigProdExt_d1(7 downto 0)="00000000" else '1';
   round <= sticky_d1 and ( (guard and not(sigProdExt_d1(9))) or (sigProdExt_d1(9) ))  ;
   RoundingAdder: IntAdder_17_f700_uid70  -- pipelineDepth=0 maxInDelay=3.7226e-10
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => round,
                 R => expSigPostRound   ,
                 X => expSig_d1,
                 Y => "00000000000000000");
   with expSigPostRound(16 downto 15) select
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d2 select 
   finalExc <= exc_d2 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d2 & expSigPostRound(14 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                    RightShifter_8_by_max_10_F700_uid80
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter_8_by_max_10_F700_uid80 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          S : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of RightShifter_8_by_max_10_F700_uid80 is
signal level0 :  std_logic_vector(7 downto 0);
signal ps, ps_d1 :  std_logic_vector(3 downto 0);
signal level1 :  std_logic_vector(8 downto 0);
signal level2, level2_d1 :  std_logic_vector(10 downto 0);
signal level3 :  std_logic_vector(14 downto 0);
signal level4 :  std_logic_vector(22 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            ps_d1 <=  ps;
            level2_d1 <=  level2;
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 1----------------
   level3<=  (3 downto 0 => '0') & level2_d1 when ps_d1(2) = '1' else    level2_d1 & (3 downto 0 => '0');
   level4<=  (7 downto 0 => '0') & level3 when ps_d1(3) = '1' else    level3 & (7 downto 0 => '0');
   R <= level4(22 downto 5);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_11_f700_uid84
--                     (IntAdderClassical_11_F700_uid86)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_11_f700_uid84 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(10 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(10 downto 0)   );
end entity;

architecture arch of IntAdder_11_f700_uid84 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                 LZCShifter_12_to_12_counting_16_F700_uid92
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_12_to_12_counting_16_F700_uid92 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(11 downto 0);
          Count : out  std_logic_vector(3 downto 0);
          O : out  std_logic_vector(11 downto 0)   );
end entity;

architecture arch of LZCShifter_12_to_12_counting_16_F700_uid92 is
signal level4 :  std_logic_vector(11 downto 0);
signal count3, count3_d1, count3_d2 :  std_logic;
signal level3, level3_d1 :  std_logic_vector(11 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(11 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1 :  std_logic_vector(11 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(11 downto 0);
signal sCount :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            count3_d1 <=  count3;
            count3_d2 <=  count3_d1;
            level3_d1 <=  level3;
            count2_d1 <=  count2;
            level2_d1 <=  level2;
            count1_d1 <=  count1;
         end if;
      end process;
   level4 <= I ;
   count3<= '1' when level4(11 downto 4) = (11 downto 4=>'0') else '0';
   level3<= level4(11 downto 0) when count3='0' else level4(3 downto 0) & (7 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 1----------------
   count2<= '1' when level3_d1(11 downto 8) = (11 downto 8=>'0') else '0';
   level2<= level3_d1(11 downto 0) when count2='0' else level3_d1(7 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(11 downto 10) = (11 downto 10=>'0') else '0';
   ----------------Synchro barrier, entering cycle 2----------------
   level1<= level2_d1(11 downto 0) when count1_d1='0' else level2_d1(9 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(11 downto 11) = (11 downto 11=>'0') else '0';
   level0<= level1(11 downto 0) when count0='0' else level1(10 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count3_d2 & count2_d1 & count1_d1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_18_f700_uid96
--                     (IntAdderClassical_18_F700_uid98)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_18_f700_uid96 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          Y : in  std_logic_vector(17 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of IntAdder_18_f700_uid96 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                                    add
--                           (FPAdd_8_7_F700_uid78)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 7 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity add is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(8+7+2 downto 0);
          Y : in  std_logic_vector(8+7+2 downto 0);
          R : out  std_logic_vector(8+7+2 downto 0)   );
end entity;

architecture arch of add is
   component RightShifter_8_by_max_10_F700_uid80 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             S : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(17 downto 0)   );
   end component;

   component IntAdder_11_f700_uid84 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(10 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(10 downto 0)   );
   end component;

   component LZCShifter_12_to_12_counting_16_F700_uid92 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(11 downto 0);
             Count : out  std_logic_vector(3 downto 0);
             O : out  std_logic_vector(11 downto 0)   );
   end component;

   component IntAdder_18_f700_uid96 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(17 downto 0);
             Y : in  std_logic_vector(17 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(17 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(16 downto 0);
signal excExpFracY :  std_logic_vector(16 downto 0);
signal eXmeY, eXmeY_d1 :  std_logic_vector(8 downto 0);
signal eYmeX, eYmeX_d1 :  std_logic_vector(8 downto 0);
signal swap, swap_d1 :  std_logic;
signal newX, newX_d1, newX_d2 :  std_logic_vector(17 downto 0);
signal newY :  std_logic_vector(17 downto 0);
signal expX, expX_d1, expX_d2 :  std_logic_vector(7 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(7 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5 :  std_logic;
signal expDiff :  std_logic_vector(8 downto 0);
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(3 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(17 downto 0);
signal sticky :  std_logic;
signal fracYfar :  std_logic_vector(10 downto 0);
signal EffSubVector :  std_logic_vector(10 downto 0);
signal fracYfarXorOp :  std_logic_vector(10 downto 0);
signal fracXfar :  std_logic_vector(10 downto 0);
signal cInAddFar :  std_logic;
signal fracAddResult :  std_logic_vector(10 downto 0);
signal fracGRS :  std_logic_vector(11 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3 :  std_logic_vector(9 downto 0);
signal nZerosNew, nZerosNew_d1 :  std_logic_vector(3 downto 0);
signal shiftedFrac, shiftedFrac_d1 :  std_logic_vector(11 downto 0);
signal updatedExp :  std_logic_vector(9 downto 0);
signal eqdiffsign, eqdiffsign_d1 :  std_logic;
signal expFrac :  std_logic_vector(17 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal grd :  std_logic;
signal lsb :  std_logic;
signal addToRoundBit :  std_logic;
signal RoundedExpFrac :  std_logic_vector(17 downto 0);
signal upExc, upExc_d1 :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(6 downto 0);
signal expR, expR_d1 :  std_logic_vector(7 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(17 downto 0);
signal X_d1 :  std_logic_vector(8+7+2 downto 0);
signal Y_d1 :  std_logic_vector(8+7+2 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            eXmeY_d1 <=  eXmeY;
            eYmeX_d1 <=  eYmeX;
            swap_d1 <=  swap;
            newX_d1 <=  newX;
            newX_d2 <=  newX_d1;
            expX_d1 <=  expX;
            expX_d2 <=  expX_d1;
            signX_d1 <=  signX;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            EffSub_d3 <=  EffSub_d2;
            EffSub_d4 <=  EffSub_d3;
            EffSub_d5 <=  EffSub_d4;
            EffSub_d6 <=  EffSub_d5;
            sXsYExnXY_d1 <=  sXsYExnXY;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            excRt_d3 <=  excRt_d2;
            excRt_d4 <=  excRt_d3;
            excRt_d5 <=  excRt_d4;
            excRt_d6 <=  excRt_d5;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            signR_d3 <=  signR_d2;
            signR_d4 <=  signR_d3;
            signR_d5 <=  signR_d4;
            shiftedFracY_d1 <=  shiftedFracY;
            extendedExpInc_d1 <=  extendedExpInc;
            extendedExpInc_d2 <=  extendedExpInc_d1;
            extendedExpInc_d3 <=  extendedExpInc_d2;
            nZerosNew_d1 <=  nZerosNew;
            shiftedFrac_d1 <=  shiftedFrac;
            eqdiffsign_d1 <=  eqdiffsign;
            upExc_d1 <=  upExc;
            fracR_d1 <=  fracR;
            expR_d1 <=  expR;
            X_d1 <=  X;
            Y_d1 <=  Y;
         end if;
      end process;
-- Exponent difference and swap  --
   excExpFracX <= X(17 downto 16) & X(14 downto 0);
   excExpFracY <= Y(17 downto 16) & Y(14 downto 0);
   eXmeY <= ("0" & X(14 downto 7)) - ("0" & Y(14 downto 7));
   eYmeX <= ("0" & Y(14 downto 7)) - ("0" & X(14 downto 7));
   swap <= '0' when excExpFracX >= excExpFracY else '1';
   ----------------Synchro barrier, entering cycle 1----------------
   newX <= X_d1 when swap_d1 = '0' else Y_d1;
   newY <= Y_d1 when swap_d1 = '0' else X_d1;
   expX<= newX(14 downto 7);
   excX<= newX(17 downto 16);
   excY<= newY(17 downto 16);
   signX<= newX(15);
   signY<= newY(15);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "00000000" when excY="00" else ('1' & newY(6 downto 0));
   with sXsYExnXY select 
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   ----------------Synchro barrier, entering cycle 2----------------
   signR<= '0' when (sXsYExnXY_d1="100000" or sXsYExnXY_d1="010000") else signX_d1;
   ---------------- cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   expDiff <= eXmeY_d1 when swap_d1 = '0' else eYmeX_d1;
   shiftedOut <= '1' when (expDiff > 9) else '0';
   shiftVal <= expDiff(3 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(10,4) ;
   RightShifterComponent: RightShifter_8_by_max_10_F700_uid80  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   sticky <= '0' when (shiftedFracY_d1(7 downto 0)=CONV_STD_LOGIC_VECTOR(0,8)) else '1';
   ---------------- cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   fracYfar <= "0" & shiftedFracY_d1(17 downto 8);
   EffSubVector <= (10 downto 0 => EffSub_d2);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d2(6 downto 0)) & "00";
   cInAddFar <= EffSub_d2 and not sticky;
   fracAdder: IntAdder_11_f700_uid84  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   fracGRS<= fracAddResult & sticky; 
   extendedExpInc<= ("00" & expX_d2) + '1';
   LZC_component: LZCShifter_12_to_12_counting_16_F700_uid92  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   updatedExp <= extendedExpInc_d3 - ("000000" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew_d1="1111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(10 downto 3);
   ---------------- cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   stk<= shiftedFrac_d1(1) or shiftedFrac_d1(0);
   rnd<= shiftedFrac_d1(2);
   grd<= shiftedFrac_d1(3);
   lsb<= shiftedFrac_d1(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   roundingAdder: IntAdder_18_f700_uid96  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "000000000000000000");
   ---------------- cycle 6----------------
   upExc <= RoundedExpFrac(17 downto 16);
   fracR <= RoundedExpFrac(7 downto 1);
   expR <= RoundedExpFrac(15 downto 8);
   ----------------Synchro barrier, entering cycle 7----------------
   exExpExc <= upExc_d1 & excRt_d6;
   with (exExpExc) select 
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR <= "00" when (eqdiffsign_d1='1' and EffSub_d6='1' and not(excRt_d6="11")) else excRt2;
   signR2 <= '0' when (eqdiffsign_d1='1' and EffSub_d6='1') else signR_d5;
   computedR <= excR & signR2 & expR_d1 & fracR_d1;
   R <= computedR;
end architecture;

--------------------------------------------------------------------------------
--                    RightShifter_8_by_max_10_F700_uid106
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter_8_by_max_10_F700_uid106 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          S : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of RightShifter_8_by_max_10_F700_uid106 is
signal level0 :  std_logic_vector(7 downto 0);
signal ps, ps_d1 :  std_logic_vector(3 downto 0);
signal level1 :  std_logic_vector(8 downto 0);
signal level2, level2_d1 :  std_logic_vector(10 downto 0);
signal level3 :  std_logic_vector(14 downto 0);
signal level4 :  std_logic_vector(22 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            ps_d1 <=  ps;
            level2_d1 <=  level2;
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 1----------------
   level3<=  (3 downto 0 => '0') & level2_d1 when ps_d1(2) = '1' else    level2_d1 & (3 downto 0 => '0');
   level4<=  (7 downto 0 => '0') & level3 when ps_d1(3) = '1' else    level3 & (7 downto 0 => '0');
   R <= level4(22 downto 5);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_11_f700_uid110
--                     (IntAdderClassical_11_F700_uid112)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_11_f700_uid110 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(10 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(10 downto 0)   );
end entity;

architecture arch of IntAdder_11_f700_uid110 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                LZCShifter_12_to_12_counting_16_F700_uid118
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_12_to_12_counting_16_F700_uid118 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(11 downto 0);
          Count : out  std_logic_vector(3 downto 0);
          O : out  std_logic_vector(11 downto 0)   );
end entity;

architecture arch of LZCShifter_12_to_12_counting_16_F700_uid118 is
signal level4 :  std_logic_vector(11 downto 0);
signal count3, count3_d1, count3_d2 :  std_logic;
signal level3, level3_d1 :  std_logic_vector(11 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(11 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1 :  std_logic_vector(11 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(11 downto 0);
signal sCount :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            count3_d1 <=  count3;
            count3_d2 <=  count3_d1;
            level3_d1 <=  level3;
            count2_d1 <=  count2;
            level2_d1 <=  level2;
            count1_d1 <=  count1;
         end if;
      end process;
   level4 <= I ;
   count3<= '1' when level4(11 downto 4) = (11 downto 4=>'0') else '0';
   level3<= level4(11 downto 0) when count3='0' else level4(3 downto 0) & (7 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 1----------------
   count2<= '1' when level3_d1(11 downto 8) = (11 downto 8=>'0') else '0';
   level2<= level3_d1(11 downto 0) when count2='0' else level3_d1(7 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(11 downto 10) = (11 downto 10=>'0') else '0';
   ----------------Synchro barrier, entering cycle 2----------------
   level1<= level2_d1(11 downto 0) when count1_d1='0' else level2_d1(9 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(11 downto 11) = (11 downto 11=>'0') else '0';
   level0<= level1(11 downto 0) when count0='0' else level1(10 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count3_d2 & count2_d1 & count1_d1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_18_f700_uid122
--                     (IntAdderClassical_18_F700_uid124)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_18_f700_uid122 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          Y : in  std_logic_vector(17 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of IntAdder_18_f700_uid122 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                                    diff
--                          (FPSub_8_7_F700_uid104)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 7 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity diff is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(8+7+2 downto 0);
          Y : in  std_logic_vector(8+7+2 downto 0);
          R : out  std_logic_vector(8+7+2 downto 0)   );
end entity;

architecture arch of diff is
   component RightShifter_8_by_max_10_F700_uid106 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             S : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(17 downto 0)   );
   end component;

   component IntAdder_11_f700_uid110 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(10 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(10 downto 0)   );
   end component;

   component LZCShifter_12_to_12_counting_16_F700_uid118 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(11 downto 0);
             Count : out  std_logic_vector(3 downto 0);
             O : out  std_logic_vector(11 downto 0)   );
   end component;

   component IntAdder_18_f700_uid122 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(17 downto 0);
             Y : in  std_logic_vector(17 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(17 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(16 downto 0);
signal excExpFracY :  std_logic_vector(16 downto 0);
signal eXmeY, eXmeY_d1 :  std_logic_vector(8 downto 0);
signal eYmeX, eYmeX_d1 :  std_logic_vector(8 downto 0);
signal swap, swap_d1 :  std_logic;
signal mY :  std_logic_vector(17 downto 0);
signal newX, newX_d1, newX_d2 :  std_logic_vector(17 downto 0);
signal newY :  std_logic_vector(17 downto 0);
signal expX, expX_d1, expX_d2 :  std_logic_vector(7 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(7 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5 :  std_logic;
signal expDiff :  std_logic_vector(8 downto 0);
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(3 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(17 downto 0);
signal sticky :  std_logic;
signal fracYfar :  std_logic_vector(10 downto 0);
signal EffSubVector :  std_logic_vector(10 downto 0);
signal fracYfarXorOp :  std_logic_vector(10 downto 0);
signal fracXfar :  std_logic_vector(10 downto 0);
signal cInAddFar :  std_logic;
signal fracAddResult :  std_logic_vector(10 downto 0);
signal fracGRS :  std_logic_vector(11 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3 :  std_logic_vector(9 downto 0);
signal nZerosNew, nZerosNew_d1 :  std_logic_vector(3 downto 0);
signal shiftedFrac, shiftedFrac_d1 :  std_logic_vector(11 downto 0);
signal updatedExp :  std_logic_vector(9 downto 0);
signal eqdiffsign, eqdiffsign_d1 :  std_logic;
signal expFrac :  std_logic_vector(17 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal grd :  std_logic;
signal lsb :  std_logic;
signal addToRoundBit :  std_logic;
signal RoundedExpFrac :  std_logic_vector(17 downto 0);
signal upExc, upExc_d1 :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(6 downto 0);
signal expR, expR_d1 :  std_logic_vector(7 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(17 downto 0);
signal X_d1 :  std_logic_vector(8+7+2 downto 0);
signal Y_d1 :  std_logic_vector(8+7+2 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            eXmeY_d1 <=  eXmeY;
            eYmeX_d1 <=  eYmeX;
            swap_d1 <=  swap;
            newX_d1 <=  newX;
            newX_d2 <=  newX_d1;
            expX_d1 <=  expX;
            expX_d2 <=  expX_d1;
            signX_d1 <=  signX;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            EffSub_d3 <=  EffSub_d2;
            EffSub_d4 <=  EffSub_d3;
            EffSub_d5 <=  EffSub_d4;
            EffSub_d6 <=  EffSub_d5;
            sXsYExnXY_d1 <=  sXsYExnXY;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            excRt_d3 <=  excRt_d2;
            excRt_d4 <=  excRt_d3;
            excRt_d5 <=  excRt_d4;
            excRt_d6 <=  excRt_d5;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            signR_d3 <=  signR_d2;
            signR_d4 <=  signR_d3;
            signR_d5 <=  signR_d4;
            shiftedFracY_d1 <=  shiftedFracY;
            extendedExpInc_d1 <=  extendedExpInc;
            extendedExpInc_d2 <=  extendedExpInc_d1;
            extendedExpInc_d3 <=  extendedExpInc_d2;
            nZerosNew_d1 <=  nZerosNew;
            shiftedFrac_d1 <=  shiftedFrac;
            eqdiffsign_d1 <=  eqdiffsign;
            upExc_d1 <=  upExc;
            fracR_d1 <=  fracR;
            expR_d1 <=  expR;
            X_d1 <=  X;
            Y_d1 <=  Y;
         end if;
      end process;
-- Exponent difference and swap  --
   excExpFracX <= X(17 downto 16) & X(14 downto 0);
   excExpFracY <= Y(17 downto 16) & Y(14 downto 0);
   eXmeY <= ("0" & X(14 downto 7)) - ("0" & Y(14 downto 7));
   eYmeX <= ("0" & Y(14 downto 7)) - ("0" & X(14 downto 7));
   swap <= '0' when excExpFracX >= excExpFracY else '1';
   ----------------Synchro barrier, entering cycle 1----------------
   mY <= Y_d1(17 downto 16) & not(Y_d1(15)) & Y_d1(14 downto 0);
   newX <= X_d1 when swap_d1 = '0' else mY;
   newY <= mY when swap_d1 = '0' else X_d1;
   expX<= newX(14 downto 7);
   excX<= newX(17 downto 16);
   excY<= newY(17 downto 16);
   signX<= newX(15);
   signY<= newY(15);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "00000000" when excY="00" else ('1' & newY(6 downto 0));
   with sXsYExnXY select 
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   ----------------Synchro barrier, entering cycle 2----------------
   signR<= '0' when (sXsYExnXY_d1="100000" or sXsYExnXY_d1="010000") else signX_d1;
   ---------------- cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   expDiff <= eXmeY_d1 when swap_d1 = '0' else eYmeX_d1;
   shiftedOut <= '1' when (expDiff > 9) else '0';
   shiftVal <= expDiff(3 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(10,4) ;
   RightShifterComponent: RightShifter_8_by_max_10_F700_uid106  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   sticky <= '0' when (shiftedFracY_d1(7 downto 0)=CONV_STD_LOGIC_VECTOR(0,8)) else '1';
   ---------------- cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   fracYfar <= "0" & shiftedFracY_d1(17 downto 8);
   EffSubVector <= (10 downto 0 => EffSub_d2);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d2(6 downto 0)) & "00";
   cInAddFar <= EffSub_d2 and not sticky;
   fracAdder: IntAdder_11_f700_uid110  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   fracGRS<= fracAddResult & sticky; 
   extendedExpInc<= ("00" & expX_d2) + '1';
   LZC_component: LZCShifter_12_to_12_counting_16_F700_uid118  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   updatedExp <= extendedExpInc_d3 - ("000000" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew_d1="1111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(10 downto 3);
   ---------------- cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   stk<= shiftedFrac_d1(1) or shiftedFrac_d1(0);
   rnd<= shiftedFrac_d1(2);
   grd<= shiftedFrac_d1(3);
   lsb<= shiftedFrac_d1(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   roundingAdder: IntAdder_18_f700_uid122  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "000000000000000000");
   ---------------- cycle 6----------------
   upExc <= RoundedExpFrac(17 downto 16);
   fracR <= RoundedExpFrac(7 downto 1);
   expR <= RoundedExpFrac(15 downto 8);
   ----------------Synchro barrier, entering cycle 7----------------
   exExpExc <= upExc_d1 & excRt_d6;
   with (exExpExc) select 
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR <= "00" when (eqdiffsign_d1='1' and EffSub_d6='1' and not(excRt_d6="11")) else excRt2;
   signR2 <= '0' when (eqdiffsign_d1='1' and EffSub_d6='1') else signR_d5;
   computedR <= excR & signR2 & expR_d1 & fracR_d1;
   R <= computedR;
end architecture;

