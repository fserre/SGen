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
--                    SmallMultTableP3x3r6XuYu_F700_uid36
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP3x3r6XuYu_F700_uid36 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu_F700_uid36 is
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
--                    SmallMultTableP3x3r6XuYu_F700_uid63
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP3x3r6XuYu_F700_uid63 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu_F700_uid63 is
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
--                    SmallMultTableP3x3r6XuYu_F700_uid90
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP3x3r6XuYu_F700_uid90 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu_F700_uid90 is
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
--                    SmallMultTableP3x3r6XuYu_F700_uid109
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP3x3r6XuYu_F700_uid109 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu_F700_uid109 is
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
--                    SmallMultTableP3x3r6XuYu_F700_uid128
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP3x3r6XuYu_F700_uid128 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu_F700_uid128 is
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
--                               Compressor_6_3
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

entity Compressor_6_3 is
   port ( X0 : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_6_3 is
signal X :  std_logic_vector(5 downto 0);
begin
   X <=X0 ;
   with X select R <= 
      "000" when "000000", 
      "001" when "000001", 
      "001" when "000010", 
      "010" when "000011", 
      "001" when "000100", 
      "010" when "000101", 
      "010" when "000110", 
      "011" when "000111", 
      "001" when "001000", 
      "010" when "001001", 
      "010" when "001010", 
      "011" when "001011", 
      "010" when "001100", 
      "011" when "001101", 
      "011" when "001110", 
      "100" when "001111", 
      "001" when "010000", 
      "010" when "010001", 
      "010" when "010010", 
      "011" when "010011", 
      "010" when "010100", 
      "011" when "010101", 
      "011" when "010110", 
      "100" when "010111", 
      "010" when "011000", 
      "011" when "011001", 
      "011" when "011010", 
      "100" when "011011", 
      "011" when "011100", 
      "100" when "011101", 
      "100" when "011110", 
      "101" when "011111", 
      "001" when "100000", 
      "010" when "100001", 
      "010" when "100010", 
      "011" when "100011", 
      "010" when "100100", 
      "011" when "100101", 
      "011" when "100110", 
      "100" when "100111", 
      "010" when "101000", 
      "011" when "101001", 
      "011" when "101010", 
      "100" when "101011", 
      "011" when "101100", 
      "100" when "101101", 
      "100" when "101110", 
      "101" when "101111", 
      "010" when "110000", 
      "011" when "110001", 
      "011" when "110010", 
      "100" when "110011", 
      "011" when "110100", 
      "100" when "110101", 
      "100" when "110110", 
      "101" when "110111", 
      "011" when "111000", 
      "100" when "111001", 
      "100" when "111010", 
      "101" when "111011", 
      "100" when "111100", 
      "101" when "111101", 
      "101" when "111110", 
      "110" when "111111", 
      "---" when others;

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
--                               Compressor_5_3
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

entity Compressor_5_3 is
   port ( X0 : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_5_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X0 ;
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
      "001" when "10000", 
      "010" when "10001", 
      "010" when "10010", 
      "011" when "10011", 
      "010" when "10100", 
      "011" when "10101", 
      "011" when "10110", 
      "100" when "10111", 
      "010" when "11000", 
      "011" when "11001", 
      "011" when "11010", 
      "100" when "11011", 
      "011" when "11100", 
      "100" when "11101", 
      "100" when "11110", 
      "101" when "11111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                               Compressor_4_3
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

entity Compressor_4_3 is
   port ( X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_4_3 is
signal X :  std_logic_vector(3 downto 0);
begin
   X <=X0 ;
   with X select R <= 
      "000" when "0000", 
      "001" when "0001", 
      "001" when "0010", 
      "010" when "0011", 
      "001" when "0100", 
      "010" when "0101", 
      "010" when "0110", 
      "011" when "0111", 
      "001" when "1000", 
      "010" when "1001", 
      "010" when "1010", 
      "011" when "1011", 
      "010" when "1100", 
      "011" when "1101", 
      "011" when "1110", 
      "100" when "1111", 
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
--                               Compressor_3_2
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

entity Compressor_3_2 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_3_2 is
signal X :  std_logic_vector(2 downto 0);
begin
   X <=X0 ;
   with X select R <= 
      "00" when "000", 
      "01" when "001", 
      "01" when "010", 
      "10" when "011", 
      "01" when "100", 
      "10" when "101", 
      "10" when "110", 
      "11" when "111", 
      "--" when others;

end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_104_f700_uid543
--                   (IntAdderAlternative_104_F700_uid547)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_104_f700_uid543 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(103 downto 0);
          Y : in  std_logic_vector(103 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(103 downto 0)   );
end entity;

architecture arch of IntAdder_104_f700_uid543 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx3, s_sum_l0_idx3_d1, s_sum_l0_idx3_d2, s_sum_l0_idx3_d3 :  std_logic_vector(26 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2, sum_l0_idx0_d3 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(25 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal sum_l0_idx3 :  std_logic_vector(25 downto 0);
signal c_l0_idx3 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1, sum_l1_idx1_d2 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(26 downto 0);
signal sum_l2_idx2, sum_l2_idx2_d1 :  std_logic_vector(25 downto 0);
signal c_l2_idx2, c_l2_idx2_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l3_idx3 :  std_logic_vector(26 downto 0);
signal sum_l3_idx3 :  std_logic_vector(25 downto 0);
signal c_l3_idx3 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            s_sum_l0_idx3_d1 <=  s_sum_l0_idx3;
            s_sum_l0_idx3_d2 <=  s_sum_l0_idx3_d1;
            s_sum_l0_idx3_d3 <=  s_sum_l0_idx3_d2;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            sum_l0_idx0_d3 <=  sum_l0_idx0_d2;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            sum_l1_idx1_d2 <=  sum_l1_idx1_d1;
            c_l1_idx1_d1 <=  c_l1_idx1;
            sum_l2_idx2_d1 <=  sum_l2_idx2;
            c_l2_idx2_d1 <=  c_l2_idx2;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(77 downto 52)) + ( "0" & Y(77 downto 52));
   s_sum_l0_idx3 <= ( "0" & X(103 downto 78)) + ( "0" & Y(103 downto 78));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(25 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(26 downto 26);
   sum_l0_idx3 <= s_sum_l0_idx3(25 downto 0);
   c_l0_idx3 <= s_sum_l0_idx3(26 downto 26);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(25 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(26 downto 26);
   ----------------Synchro barrier, entering cycle 3----------------
   s_sum_l3_idx3 <=  s_sum_l0_idx3_d3 + c_l2_idx2_d1(0 downto 0);
   sum_l3_idx3 <= s_sum_l3_idx3(25 downto 0);
   c_l3_idx3 <= s_sum_l3_idx3(26 downto 26);
   R <= sum_l3_idx3(25 downto 0) & sum_l2_idx2_d1(25 downto 0) & sum_l1_idx1_d2(25 downto 0) & sum_l0_idx0_d3(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--            IntMultiplier_UsingDSP_53_53_106_unsigned_F700_uid4
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 8 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_53_53_106_unsigned_F700_uid4 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(52 downto 0);
          Y : in  std_logic_vector(52 downto 0);
          R : out  std_logic_vector(105 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_53_53_106_unsigned_F700_uid4 is
   component IntAdder_104_f700_uid543 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(103 downto 0);
             Y : in  std_logic_vector(103 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(103 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F700_uid9 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F700_uid36 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F700_uid63 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F700_uid90 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F700_uid109 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F700_uid128 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component Compressor_6_3 is
      port ( X0 : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_14_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_5_3 is
      port ( X0 : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_4_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
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

   component Compressor_3_2 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

signal XX_m5 :  std_logic_vector(52 downto 0);
signal YY_m5 :  std_logic_vector(52 downto 0);
signal Xp_m5b7 :  std_logic_vector(5 downto 0);
signal Yp_m5b7 :  std_logic_vector(17 downto 0);
signal x_m5b7_0 :  std_logic_vector(2 downto 0);
signal x_m5b7_1 :  std_logic_vector(2 downto 0);
signal y_m5b7_0 :  std_logic_vector(2 downto 0);
signal y_m5b7_1 :  std_logic_vector(2 downto 0);
signal y_m5b7_2 :  std_logic_vector(2 downto 0);
signal y_m5b7_3 :  std_logic_vector(2 downto 0);
signal y_m5b7_4 :  std_logic_vector(2 downto 0);
signal y_m5b7_5 :  std_logic_vector(2 downto 0);
signal Y0X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w36_0 :  std_logic;
signal heap_bh6_w37_0 :  std_logic;
signal heap_bh6_w38_0 :  std_logic;
signal heap_bh6_w39_0 :  std_logic;
signal Y0X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w38_1 :  std_logic;
signal heap_bh6_w39_1 :  std_logic;
signal heap_bh6_w40_0 :  std_logic;
signal heap_bh6_w41_0 :  std_logic;
signal heap_bh6_w42_0 :  std_logic;
signal Y1X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w38_2 :  std_logic;
signal heap_bh6_w39_2 :  std_logic;
signal heap_bh6_w40_1 :  std_logic;
signal heap_bh6_w41_1 :  std_logic;
signal heap_bh6_w42_1 :  std_logic;
signal Y1X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w40_2 :  std_logic;
signal heap_bh6_w41_2 :  std_logic;
signal heap_bh6_w42_2 :  std_logic;
signal heap_bh6_w43_0 :  std_logic;
signal heap_bh6_w44_0 :  std_logic;
signal heap_bh6_w45_0 :  std_logic;
signal Y2X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w41_3 :  std_logic;
signal heap_bh6_w42_3 :  std_logic;
signal heap_bh6_w43_1 :  std_logic;
signal heap_bh6_w44_1 :  std_logic;
signal heap_bh6_w45_1 :  std_logic;
signal Y2X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w43_2 :  std_logic;
signal heap_bh6_w44_2 :  std_logic;
signal heap_bh6_w45_2 :  std_logic;
signal heap_bh6_w46_0 :  std_logic;
signal heap_bh6_w47_0 :  std_logic;
signal heap_bh6_w48_0 :  std_logic;
signal Y3X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w44_3 :  std_logic;
signal heap_bh6_w45_3 :  std_logic;
signal heap_bh6_w46_1 :  std_logic;
signal heap_bh6_w47_1 :  std_logic;
signal heap_bh6_w48_1 :  std_logic;
signal Y3X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w46_2 :  std_logic;
signal heap_bh6_w47_2 :  std_logic;
signal heap_bh6_w48_2 :  std_logic;
signal heap_bh6_w49_0 :  std_logic;
signal heap_bh6_w50_0 :  std_logic;
signal heap_bh6_w51_0 :  std_logic;
signal Y4X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w47_3 :  std_logic;
signal heap_bh6_w48_3 :  std_logic;
signal heap_bh6_w49_1 :  std_logic;
signal heap_bh6_w50_1 :  std_logic;
signal heap_bh6_w51_1 :  std_logic;
signal Y4X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w49_2 :  std_logic;
signal heap_bh6_w50_2 :  std_logic;
signal heap_bh6_w51_2 :  std_logic;
signal heap_bh6_w52_0 :  std_logic;
signal heap_bh6_w53_0 :  std_logic;
signal heap_bh6_w54_0 :  std_logic;
signal Y5X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w50_3 :  std_logic;
signal heap_bh6_w51_3 :  std_logic;
signal heap_bh6_w52_1 :  std_logic;
signal heap_bh6_w53_1 :  std_logic;
signal heap_bh6_w54_1 :  std_logic;
signal Y5X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w52_2 :  std_logic;
signal heap_bh6_w53_2 :  std_logic;
signal heap_bh6_w54_2 :  std_logic;
signal heap_bh6_w55_0 :  std_logic;
signal heap_bh6_w56_0, heap_bh6_w56_0_d1 :  std_logic;
signal heap_bh6_w57_0, heap_bh6_w57_0_d1 :  std_logic;
signal Xp_m5b34 :  std_logic_vector(5 downto 0);
signal Yp_m5b34 :  std_logic_vector(17 downto 0);
signal x_m5b34_0 :  std_logic_vector(2 downto 0);
signal x_m5b34_1 :  std_logic_vector(2 downto 0);
signal y_m5b34_0 :  std_logic_vector(2 downto 0);
signal y_m5b34_1 :  std_logic_vector(2 downto 0);
signal y_m5b34_2 :  std_logic_vector(2 downto 0);
signal y_m5b34_3 :  std_logic_vector(2 downto 0);
signal y_m5b34_4 :  std_logic_vector(2 downto 0);
signal y_m5b34_5 :  std_logic_vector(2 downto 0);
signal Y0X0_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w19_0 :  std_logic;
signal heap_bh6_w20_0 :  std_logic;
signal heap_bh6_w21_0 :  std_logic;
signal heap_bh6_w22_0 :  std_logic;
signal Y0X1_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w21_1 :  std_logic;
signal heap_bh6_w22_1 :  std_logic;
signal heap_bh6_w23_0 :  std_logic;
signal heap_bh6_w24_0 :  std_logic;
signal heap_bh6_w25_0 :  std_logic;
signal Y1X0_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w21_2 :  std_logic;
signal heap_bh6_w22_2 :  std_logic;
signal heap_bh6_w23_1 :  std_logic;
signal heap_bh6_w24_1 :  std_logic;
signal heap_bh6_w25_1 :  std_logic;
signal Y1X1_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w23_2 :  std_logic;
signal heap_bh6_w24_2 :  std_logic;
signal heap_bh6_w25_2 :  std_logic;
signal heap_bh6_w26_0 :  std_logic;
signal heap_bh6_w27_0 :  std_logic;
signal heap_bh6_w28_0 :  std_logic;
signal Y2X0_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w24_3 :  std_logic;
signal heap_bh6_w25_3 :  std_logic;
signal heap_bh6_w26_1 :  std_logic;
signal heap_bh6_w27_1 :  std_logic;
signal heap_bh6_w28_1 :  std_logic;
signal Y2X1_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w26_2 :  std_logic;
signal heap_bh6_w27_2 :  std_logic;
signal heap_bh6_w28_2 :  std_logic;
signal heap_bh6_w29_0 :  std_logic;
signal heap_bh6_w30_0 :  std_logic;
signal heap_bh6_w31_0 :  std_logic;
signal Y3X0_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w27_3 :  std_logic;
signal heap_bh6_w28_3 :  std_logic;
signal heap_bh6_w29_1 :  std_logic;
signal heap_bh6_w30_1 :  std_logic;
signal heap_bh6_w31_1 :  std_logic;
signal Y3X1_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w29_2 :  std_logic;
signal heap_bh6_w30_2 :  std_logic;
signal heap_bh6_w31_2 :  std_logic;
signal heap_bh6_w32_0 :  std_logic;
signal heap_bh6_w33_0 :  std_logic;
signal heap_bh6_w34_0 :  std_logic;
signal Y4X0_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X0Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w30_3 :  std_logic;
signal heap_bh6_w31_3 :  std_logic;
signal heap_bh6_w32_1 :  std_logic;
signal heap_bh6_w33_1 :  std_logic;
signal heap_bh6_w34_1 :  std_logic;
signal Y4X1_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X1Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w32_2 :  std_logic;
signal heap_bh6_w33_2 :  std_logic;
signal heap_bh6_w34_2 :  std_logic;
signal heap_bh6_w35_0 :  std_logic;
signal heap_bh6_w36_1 :  std_logic;
signal heap_bh6_w37_1 :  std_logic;
signal Y5X0_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X0Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w33_3 :  std_logic;
signal heap_bh6_w34_3 :  std_logic;
signal heap_bh6_w35_1 :  std_logic;
signal heap_bh6_w36_2 :  std_logic;
signal heap_bh6_w37_2 :  std_logic;
signal Y5X1_34_m5 :  std_logic_vector(5 downto 0);
signal PP34X1Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w35_2 :  std_logic;
signal heap_bh6_w36_3 :  std_logic;
signal heap_bh6_w37_3 :  std_logic;
signal heap_bh6_w38_3 :  std_logic;
signal heap_bh6_w39_3 :  std_logic;
signal heap_bh6_w40_3 :  std_logic;
signal Xp_m5b61 :  std_logic_vector(5 downto 0);
signal Yp_m5b61 :  std_logic_vector(17 downto 0);
signal x_m5b61_0 :  std_logic_vector(2 downto 0);
signal x_m5b61_1 :  std_logic_vector(2 downto 0);
signal y_m5b61_0 :  std_logic_vector(2 downto 0);
signal y_m5b61_1 :  std_logic_vector(2 downto 0);
signal y_m5b61_2 :  std_logic_vector(2 downto 0);
signal y_m5b61_3 :  std_logic_vector(2 downto 0);
signal y_m5b61_4 :  std_logic_vector(2 downto 0);
signal y_m5b61_5 :  std_logic_vector(2 downto 0);
signal Y0X0_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w2_0 :  std_logic;
signal heap_bh6_w3_0, heap_bh6_w3_0_d1, heap_bh6_w3_0_d2, heap_bh6_w3_0_d3, heap_bh6_w3_0_d4, heap_bh6_w3_0_d5 :  std_logic;
signal heap_bh6_w4_0 :  std_logic;
signal heap_bh6_w5_0 :  std_logic;
signal Y0X1_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w4_1 :  std_logic;
signal heap_bh6_w5_1 :  std_logic;
signal heap_bh6_w6_0 :  std_logic;
signal heap_bh6_w7_0 :  std_logic;
signal heap_bh6_w8_0 :  std_logic;
signal Y1X0_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w4_2 :  std_logic;
signal heap_bh6_w5_2 :  std_logic;
signal heap_bh6_w6_1 :  std_logic;
signal heap_bh6_w7_1 :  std_logic;
signal heap_bh6_w8_1 :  std_logic;
signal Y1X1_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w6_2 :  std_logic;
signal heap_bh6_w7_2 :  std_logic;
signal heap_bh6_w8_2 :  std_logic;
signal heap_bh6_w9_0 :  std_logic;
signal heap_bh6_w10_0 :  std_logic;
signal heap_bh6_w11_0 :  std_logic;
signal Y2X0_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w7_3 :  std_logic;
signal heap_bh6_w8_3 :  std_logic;
signal heap_bh6_w9_1 :  std_logic;
signal heap_bh6_w10_1 :  std_logic;
signal heap_bh6_w11_1 :  std_logic;
signal Y2X1_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w9_2 :  std_logic;
signal heap_bh6_w10_2 :  std_logic;
signal heap_bh6_w11_2 :  std_logic;
signal heap_bh6_w12_0 :  std_logic;
signal heap_bh6_w13_0 :  std_logic;
signal heap_bh6_w14_0 :  std_logic;
signal Y3X0_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w10_3 :  std_logic;
signal heap_bh6_w11_3 :  std_logic;
signal heap_bh6_w12_1 :  std_logic;
signal heap_bh6_w13_1 :  std_logic;
signal heap_bh6_w14_1 :  std_logic;
signal Y3X1_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w12_2 :  std_logic;
signal heap_bh6_w13_2 :  std_logic;
signal heap_bh6_w14_2 :  std_logic;
signal heap_bh6_w15_0 :  std_logic;
signal heap_bh6_w16_0 :  std_logic;
signal heap_bh6_w17_0 :  std_logic;
signal Y4X0_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X0Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w13_3 :  std_logic;
signal heap_bh6_w14_3 :  std_logic;
signal heap_bh6_w15_1 :  std_logic;
signal heap_bh6_w16_1 :  std_logic;
signal heap_bh6_w17_1 :  std_logic;
signal Y4X1_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X1Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w15_2 :  std_logic;
signal heap_bh6_w16_2 :  std_logic;
signal heap_bh6_w17_2 :  std_logic;
signal heap_bh6_w18_0 :  std_logic;
signal heap_bh6_w19_1 :  std_logic;
signal heap_bh6_w20_1 :  std_logic;
signal Y5X0_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X0Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w16_3 :  std_logic;
signal heap_bh6_w17_3 :  std_logic;
signal heap_bh6_w18_1 :  std_logic;
signal heap_bh6_w19_2 :  std_logic;
signal heap_bh6_w20_2 :  std_logic;
signal Y5X1_61_m5 :  std_logic_vector(5 downto 0);
signal PP61X1Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w18_2 :  std_logic;
signal heap_bh6_w19_3 :  std_logic;
signal heap_bh6_w20_3 :  std_logic;
signal heap_bh6_w21_3 :  std_logic;
signal heap_bh6_w22_3 :  std_logic;
signal heap_bh6_w23_3 :  std_logic;
signal Xp_m5b88 :  std_logic_vector(23 downto 0);
signal Yp_m5b88 :  std_logic_vector(2 downto 0);
signal x_m5b88_0 :  std_logic_vector(2 downto 0);
signal x_m5b88_1 :  std_logic_vector(2 downto 0);
signal x_m5b88_2 :  std_logic_vector(2 downto 0);
signal x_m5b88_3 :  std_logic_vector(2 downto 0);
signal x_m5b88_4 :  std_logic_vector(2 downto 0);
signal x_m5b88_5 :  std_logic_vector(2 downto 0);
signal x_m5b88_6 :  std_logic_vector(2 downto 0);
signal x_m5b88_7 :  std_logic_vector(2 downto 0);
signal y_m5b88_0 :  std_logic_vector(2 downto 0);
signal Y0X0_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w29_3 :  std_logic;
signal heap_bh6_w30_4 :  std_logic;
signal heap_bh6_w31_4, heap_bh6_w31_4_d1 :  std_logic;
signal heap_bh6_w32_3 :  std_logic;
signal heap_bh6_w33_4 :  std_logic;
signal Y0X1_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w32_4 :  std_logic;
signal heap_bh6_w33_5 :  std_logic;
signal heap_bh6_w34_4, heap_bh6_w34_4_d1 :  std_logic;
signal heap_bh6_w35_3 :  std_logic;
signal heap_bh6_w36_4 :  std_logic;
signal Y0X2_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w35_4 :  std_logic;
signal heap_bh6_w36_5 :  std_logic;
signal heap_bh6_w37_4 :  std_logic;
signal heap_bh6_w38_4 :  std_logic;
signal heap_bh6_w39_4 :  std_logic;
signal Y0X3_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w38_5 :  std_logic;
signal heap_bh6_w39_5 :  std_logic;
signal heap_bh6_w40_4 :  std_logic;
signal heap_bh6_w41_4 :  std_logic;
signal heap_bh6_w42_4 :  std_logic;
signal Y0X4_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w41_5 :  std_logic;
signal heap_bh6_w42_5 :  std_logic;
signal heap_bh6_w43_3 :  std_logic;
signal heap_bh6_w44_4 :  std_logic;
signal heap_bh6_w45_4 :  std_logic;
signal Y0X5_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X5Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w44_5 :  std_logic;
signal heap_bh6_w45_5 :  std_logic;
signal heap_bh6_w46_3 :  std_logic;
signal heap_bh6_w47_4 :  std_logic;
signal heap_bh6_w48_4 :  std_logic;
signal Y0X6_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X6Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w47_5 :  std_logic;
signal heap_bh6_w48_5 :  std_logic;
signal heap_bh6_w49_3 :  std_logic;
signal heap_bh6_w50_4 :  std_logic;
signal heap_bh6_w51_4 :  std_logic;
signal Y0X7_88_m5 :  std_logic_vector(5 downto 0);
signal PP88X7Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w50_5 :  std_logic;
signal heap_bh6_w51_5 :  std_logic;
signal heap_bh6_w52_3 :  std_logic;
signal heap_bh6_w53_3 :  std_logic;
signal heap_bh6_w54_3 :  std_logic;
signal Xp_m5b107 :  std_logic_vector(23 downto 0);
signal Yp_m5b107 :  std_logic_vector(2 downto 0);
signal x_m5b107_0 :  std_logic_vector(2 downto 0);
signal x_m5b107_1 :  std_logic_vector(2 downto 0);
signal x_m5b107_2 :  std_logic_vector(2 downto 0);
signal x_m5b107_3 :  std_logic_vector(2 downto 0);
signal x_m5b107_4 :  std_logic_vector(2 downto 0);
signal x_m5b107_5 :  std_logic_vector(2 downto 0);
signal x_m5b107_6 :  std_logic_vector(2 downto 0);
signal x_m5b107_7 :  std_logic_vector(2 downto 0);
signal y_m5b107_0 :  std_logic_vector(2 downto 0);
signal Y0X0_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w5_3 :  std_logic;
signal heap_bh6_w6_3 :  std_logic;
signal heap_bh6_w7_4 :  std_logic;
signal heap_bh6_w8_4 :  std_logic;
signal heap_bh6_w9_3, heap_bh6_w9_3_d1 :  std_logic;
signal Y0X1_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w8_5 :  std_logic;
signal heap_bh6_w9_4 :  std_logic;
signal heap_bh6_w10_4 :  std_logic;
signal heap_bh6_w11_4 :  std_logic;
signal heap_bh6_w12_3, heap_bh6_w12_3_d1 :  std_logic;
signal Y0X2_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w11_5 :  std_logic;
signal heap_bh6_w12_4 :  std_logic;
signal heap_bh6_w13_4 :  std_logic;
signal heap_bh6_w14_4 :  std_logic;
signal heap_bh6_w15_3, heap_bh6_w15_3_d1 :  std_logic;
signal Y0X3_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w14_5 :  std_logic;
signal heap_bh6_w15_4 :  std_logic;
signal heap_bh6_w16_4 :  std_logic;
signal heap_bh6_w17_4 :  std_logic;
signal heap_bh6_w18_3, heap_bh6_w18_3_d1 :  std_logic;
signal Y0X4_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w17_5 :  std_logic;
signal heap_bh6_w18_4 :  std_logic;
signal heap_bh6_w19_4 :  std_logic;
signal heap_bh6_w20_4 :  std_logic;
signal heap_bh6_w21_4 :  std_logic;
signal Y0X5_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X5Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w20_5 :  std_logic;
signal heap_bh6_w21_5 :  std_logic;
signal heap_bh6_w22_4 :  std_logic;
signal heap_bh6_w23_4 :  std_logic;
signal heap_bh6_w24_4 :  std_logic;
signal Y0X6_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X6Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w23_5 :  std_logic;
signal heap_bh6_w24_5 :  std_logic;
signal heap_bh6_w25_4, heap_bh6_w25_4_d1 :  std_logic;
signal heap_bh6_w26_3 :  std_logic;
signal heap_bh6_w27_4 :  std_logic;
signal Y0X7_107_m5 :  std_logic_vector(5 downto 0);
signal PP107X7Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w26_4 :  std_logic;
signal heap_bh6_w27_5 :  std_logic;
signal heap_bh6_w28_4, heap_bh6_w28_4_d1 :  std_logic;
signal heap_bh6_w29_4 :  std_logic;
signal heap_bh6_w30_5 :  std_logic;
signal Xp_m5b126 :  std_logic_vector(5 downto 0);
signal Yp_m5b126 :  std_logic_vector(2 downto 0);
signal x_m5b126_0 :  std_logic_vector(2 downto 0);
signal x_m5b126_1 :  std_logic_vector(2 downto 0);
signal y_m5b126_0 :  std_logic_vector(2 downto 0);
signal Y0X0_126_m5 :  std_logic_vector(5 downto 0);
signal PP126X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w0_0 :  std_logic;
signal heap_bh6_w1_0 :  std_logic;
signal heap_bh6_w2_1 :  std_logic;
signal heap_bh6_w3_1 :  std_logic;
signal Y0X1_126_m5 :  std_logic_vector(5 downto 0);
signal PP126X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w2_2 :  std_logic;
signal heap_bh6_w3_2 :  std_logic;
signal heap_bh6_w4_3 :  std_logic;
signal heap_bh6_w5_4 :  std_logic;
signal heap_bh6_w6_4 :  std_logic;
signal DSP_bh6_ch0_0, DSP_bh6_ch0_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh6_w105_0, heap_bh6_w105_0_d1, heap_bh6_w105_0_d2, heap_bh6_w105_0_d3, heap_bh6_w105_0_d4 :  std_logic;
signal heap_bh6_w104_0, heap_bh6_w104_0_d1, heap_bh6_w104_0_d2, heap_bh6_w104_0_d3, heap_bh6_w104_0_d4 :  std_logic;
signal heap_bh6_w103_0, heap_bh6_w103_0_d1, heap_bh6_w103_0_d2, heap_bh6_w103_0_d3, heap_bh6_w103_0_d4 :  std_logic;
signal heap_bh6_w102_0, heap_bh6_w102_0_d1, heap_bh6_w102_0_d2, heap_bh6_w102_0_d3, heap_bh6_w102_0_d4 :  std_logic;
signal heap_bh6_w101_0, heap_bh6_w101_0_d1, heap_bh6_w101_0_d2, heap_bh6_w101_0_d3, heap_bh6_w101_0_d4 :  std_logic;
signal heap_bh6_w100_0, heap_bh6_w100_0_d1, heap_bh6_w100_0_d2, heap_bh6_w100_0_d3, heap_bh6_w100_0_d4 :  std_logic;
signal heap_bh6_w99_0, heap_bh6_w99_0_d1, heap_bh6_w99_0_d2, heap_bh6_w99_0_d3, heap_bh6_w99_0_d4 :  std_logic;
signal heap_bh6_w98_0, heap_bh6_w98_0_d1, heap_bh6_w98_0_d2, heap_bh6_w98_0_d3, heap_bh6_w98_0_d4 :  std_logic;
signal heap_bh6_w97_0, heap_bh6_w97_0_d1, heap_bh6_w97_0_d2, heap_bh6_w97_0_d3, heap_bh6_w97_0_d4 :  std_logic;
signal heap_bh6_w96_0, heap_bh6_w96_0_d1, heap_bh6_w96_0_d2, heap_bh6_w96_0_d3, heap_bh6_w96_0_d4 :  std_logic;
signal heap_bh6_w95_0, heap_bh6_w95_0_d1, heap_bh6_w95_0_d2, heap_bh6_w95_0_d3, heap_bh6_w95_0_d4 :  std_logic;
signal heap_bh6_w94_0, heap_bh6_w94_0_d1, heap_bh6_w94_0_d2, heap_bh6_w94_0_d3, heap_bh6_w94_0_d4 :  std_logic;
signal heap_bh6_w93_0, heap_bh6_w93_0_d1, heap_bh6_w93_0_d2, heap_bh6_w93_0_d3, heap_bh6_w93_0_d4 :  std_logic;
signal heap_bh6_w92_0, heap_bh6_w92_0_d1, heap_bh6_w92_0_d2, heap_bh6_w92_0_d3, heap_bh6_w92_0_d4 :  std_logic;
signal heap_bh6_w91_0, heap_bh6_w91_0_d1, heap_bh6_w91_0_d2, heap_bh6_w91_0_d3, heap_bh6_w91_0_d4 :  std_logic;
signal heap_bh6_w90_0, heap_bh6_w90_0_d1, heap_bh6_w90_0_d2, heap_bh6_w90_0_d3, heap_bh6_w90_0_d4 :  std_logic;
signal heap_bh6_w89_0, heap_bh6_w89_0_d1, heap_bh6_w89_0_d2, heap_bh6_w89_0_d3, heap_bh6_w89_0_d4 :  std_logic;
signal heap_bh6_w88_0, heap_bh6_w88_0_d1 :  std_logic;
signal heap_bh6_w87_0, heap_bh6_w87_0_d1 :  std_logic;
signal heap_bh6_w86_0, heap_bh6_w86_0_d1 :  std_logic;
signal heap_bh6_w85_0, heap_bh6_w85_0_d1 :  std_logic;
signal heap_bh6_w84_0 :  std_logic;
signal heap_bh6_w83_0 :  std_logic;
signal heap_bh6_w82_0 :  std_logic;
signal heap_bh6_w81_0 :  std_logic;
signal heap_bh6_w80_0, heap_bh6_w80_0_d1 :  std_logic;
signal heap_bh6_w79_0 :  std_logic;
signal heap_bh6_w78_0, heap_bh6_w78_0_d1 :  std_logic;
signal heap_bh6_w77_0 :  std_logic;
signal heap_bh6_w76_0, heap_bh6_w76_0_d1 :  std_logic;
signal heap_bh6_w75_0 :  std_logic;
signal heap_bh6_w74_0, heap_bh6_w74_0_d1 :  std_logic;
signal heap_bh6_w73_0 :  std_logic;
signal heap_bh6_w72_0 :  std_logic;
signal heap_bh6_w71_0 :  std_logic;
signal heap_bh6_w70_0 :  std_logic;
signal heap_bh6_w69_0 :  std_logic;
signal heap_bh6_w68_0 :  std_logic;
signal heap_bh6_w67_0 :  std_logic;
signal heap_bh6_w66_0 :  std_logic;
signal heap_bh6_w65_0 :  std_logic;
signal DSP_bh6_ch1_0, DSP_bh6_ch1_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh6_w81_1 :  std_logic;
signal heap_bh6_w80_1 :  std_logic;
signal heap_bh6_w79_1 :  std_logic;
signal heap_bh6_w78_1 :  std_logic;
signal heap_bh6_w77_1 :  std_logic;
signal heap_bh6_w76_1 :  std_logic;
signal heap_bh6_w75_1 :  std_logic;
signal heap_bh6_w74_1 :  std_logic;
signal heap_bh6_w73_1 :  std_logic;
signal heap_bh6_w72_1 :  std_logic;
signal heap_bh6_w71_1 :  std_logic;
signal heap_bh6_w70_1 :  std_logic;
signal heap_bh6_w69_1 :  std_logic;
signal heap_bh6_w68_1 :  std_logic;
signal heap_bh6_w67_1 :  std_logic;
signal heap_bh6_w66_1 :  std_logic;
signal heap_bh6_w65_1 :  std_logic;
signal heap_bh6_w64_0 :  std_logic;
signal heap_bh6_w63_0 :  std_logic;
signal heap_bh6_w62_0 :  std_logic;
signal heap_bh6_w61_0 :  std_logic;
signal heap_bh6_w60_0 :  std_logic;
signal heap_bh6_w59_0 :  std_logic;
signal heap_bh6_w58_0 :  std_logic;
signal heap_bh6_w57_1 :  std_logic;
signal heap_bh6_w56_1 :  std_logic;
signal heap_bh6_w55_1 :  std_logic;
signal heap_bh6_w54_4 :  std_logic;
signal heap_bh6_w53_4 :  std_logic;
signal heap_bh6_w52_4 :  std_logic;
signal heap_bh6_w51_6 :  std_logic;
signal heap_bh6_w50_6 :  std_logic;
signal heap_bh6_w49_4 :  std_logic;
signal heap_bh6_w48_6 :  std_logic;
signal heap_bh6_w47_6 :  std_logic;
signal heap_bh6_w46_4 :  std_logic;
signal heap_bh6_w45_6 :  std_logic;
signal heap_bh6_w44_6 :  std_logic;
signal heap_bh6_w43_4 :  std_logic;
signal heap_bh6_w42_6 :  std_logic;
signal heap_bh6_w41_6 :  std_logic;
signal DSP_bh6_ch2_0, DSP_bh6_ch2_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh6_w88_1, heap_bh6_w88_1_d1 :  std_logic;
signal heap_bh6_w87_1, heap_bh6_w87_1_d1 :  std_logic;
signal heap_bh6_w86_1, heap_bh6_w86_1_d1 :  std_logic;
signal heap_bh6_w85_1, heap_bh6_w85_1_d1 :  std_logic;
signal heap_bh6_w84_1 :  std_logic;
signal heap_bh6_w83_1 :  std_logic;
signal heap_bh6_w82_1 :  std_logic;
signal heap_bh6_w81_2 :  std_logic;
signal heap_bh6_w80_2 :  std_logic;
signal heap_bh6_w79_2 :  std_logic;
signal heap_bh6_w78_2 :  std_logic;
signal heap_bh6_w77_2 :  std_logic;
signal heap_bh6_w76_2 :  std_logic;
signal heap_bh6_w75_2 :  std_logic;
signal heap_bh6_w74_2 :  std_logic;
signal heap_bh6_w73_2 :  std_logic;
signal heap_bh6_w72_2 :  std_logic;
signal heap_bh6_w71_2 :  std_logic;
signal heap_bh6_w70_2 :  std_logic;
signal heap_bh6_w69_2 :  std_logic;
signal heap_bh6_w68_2 :  std_logic;
signal heap_bh6_w67_2 :  std_logic;
signal heap_bh6_w66_2 :  std_logic;
signal heap_bh6_w65_2 :  std_logic;
signal heap_bh6_w64_1 :  std_logic;
signal heap_bh6_w63_1 :  std_logic;
signal heap_bh6_w62_1 :  std_logic;
signal heap_bh6_w61_1 :  std_logic;
signal heap_bh6_w60_1 :  std_logic;
signal heap_bh6_w59_1 :  std_logic;
signal heap_bh6_w58_1 :  std_logic;
signal heap_bh6_w57_2 :  std_logic;
signal heap_bh6_w56_2 :  std_logic;
signal heap_bh6_w55_2 :  std_logic;
signal heap_bh6_w54_5 :  std_logic;
signal heap_bh6_w53_5 :  std_logic;
signal heap_bh6_w52_5 :  std_logic;
signal heap_bh6_w51_7 :  std_logic;
signal heap_bh6_w50_7 :  std_logic;
signal heap_bh6_w49_5 :  std_logic;
signal heap_bh6_w48_7 :  std_logic;
signal DSP_bh6_ch3_0, DSP_bh6_ch3_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh6_w64_2 :  std_logic;
signal heap_bh6_w63_2 :  std_logic;
signal heap_bh6_w62_2 :  std_logic;
signal heap_bh6_w61_2 :  std_logic;
signal heap_bh6_w60_2 :  std_logic;
signal heap_bh6_w59_2 :  std_logic;
signal heap_bh6_w58_2 :  std_logic;
signal heap_bh6_w57_3 :  std_logic;
signal heap_bh6_w56_3 :  std_logic;
signal heap_bh6_w55_3 :  std_logic;
signal heap_bh6_w54_6 :  std_logic;
signal heap_bh6_w53_6 :  std_logic;
signal heap_bh6_w52_6 :  std_logic;
signal heap_bh6_w51_8 :  std_logic;
signal heap_bh6_w50_8 :  std_logic;
signal heap_bh6_w49_6 :  std_logic;
signal heap_bh6_w48_8 :  std_logic;
signal heap_bh6_w47_7 :  std_logic;
signal heap_bh6_w46_5 :  std_logic;
signal heap_bh6_w45_7 :  std_logic;
signal heap_bh6_w44_7 :  std_logic;
signal heap_bh6_w43_5 :  std_logic;
signal heap_bh6_w42_7 :  std_logic;
signal heap_bh6_w41_7 :  std_logic;
signal heap_bh6_w40_5 :  std_logic;
signal heap_bh6_w39_6 :  std_logic;
signal heap_bh6_w38_6 :  std_logic;
signal heap_bh6_w37_5 :  std_logic;
signal heap_bh6_w36_6 :  std_logic;
signal heap_bh6_w35_5 :  std_logic;
signal heap_bh6_w34_5 :  std_logic;
signal heap_bh6_w33_6 :  std_logic;
signal heap_bh6_w32_5 :  std_logic;
signal heap_bh6_w31_5 :  std_logic;
signal heap_bh6_w30_6 :  std_logic;
signal heap_bh6_w29_5 :  std_logic;
signal heap_bh6_w28_5 :  std_logic;
signal heap_bh6_w27_6 :  std_logic;
signal heap_bh6_w26_5 :  std_logic;
signal heap_bh6_w25_5 :  std_logic;
signal heap_bh6_w24_6 :  std_logic;
signal DSP_bh6_ch4_0, DSP_bh6_ch4_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh6_w71_3 :  std_logic;
signal heap_bh6_w70_3 :  std_logic;
signal heap_bh6_w69_3 :  std_logic;
signal heap_bh6_w68_3 :  std_logic;
signal heap_bh6_w67_3 :  std_logic;
signal heap_bh6_w66_3 :  std_logic;
signal heap_bh6_w65_3 :  std_logic;
signal heap_bh6_w64_3 :  std_logic;
signal heap_bh6_w63_3 :  std_logic;
signal heap_bh6_w62_3 :  std_logic;
signal heap_bh6_w61_3 :  std_logic;
signal heap_bh6_w60_3 :  std_logic;
signal heap_bh6_w59_3 :  std_logic;
signal heap_bh6_w58_3 :  std_logic;
signal heap_bh6_w57_4 :  std_logic;
signal heap_bh6_w56_4 :  std_logic;
signal heap_bh6_w55_4 :  std_logic;
signal heap_bh6_w54_7 :  std_logic;
signal heap_bh6_w53_7 :  std_logic;
signal heap_bh6_w52_7 :  std_logic;
signal heap_bh6_w51_9 :  std_logic;
signal heap_bh6_w50_9 :  std_logic;
signal heap_bh6_w49_7 :  std_logic;
signal heap_bh6_w48_9 :  std_logic;
signal heap_bh6_w47_8 :  std_logic;
signal heap_bh6_w46_6 :  std_logic;
signal heap_bh6_w45_8 :  std_logic;
signal heap_bh6_w44_8 :  std_logic;
signal heap_bh6_w43_6 :  std_logic;
signal heap_bh6_w42_8 :  std_logic;
signal heap_bh6_w41_8 :  std_logic;
signal heap_bh6_w40_6 :  std_logic;
signal heap_bh6_w39_7 :  std_logic;
signal heap_bh6_w38_7 :  std_logic;
signal heap_bh6_w37_6 :  std_logic;
signal heap_bh6_w36_7 :  std_logic;
signal heap_bh6_w35_6 :  std_logic;
signal heap_bh6_w34_6 :  std_logic;
signal heap_bh6_w33_7 :  std_logic;
signal heap_bh6_w32_6 :  std_logic;
signal heap_bh6_w31_6 :  std_logic;
signal DSP_bh6_ch5_0, DSP_bh6_ch5_0_d1 :  std_logic_vector(40 downto 0);
signal heap_bh6_w47_9 :  std_logic;
signal heap_bh6_w46_7 :  std_logic;
signal heap_bh6_w45_9 :  std_logic;
signal heap_bh6_w44_9 :  std_logic;
signal heap_bh6_w43_7 :  std_logic;
signal heap_bh6_w42_9 :  std_logic;
signal heap_bh6_w41_9 :  std_logic;
signal heap_bh6_w40_7 :  std_logic;
signal heap_bh6_w39_8 :  std_logic;
signal heap_bh6_w38_8 :  std_logic;
signal heap_bh6_w37_7 :  std_logic;
signal heap_bh6_w36_8 :  std_logic;
signal heap_bh6_w35_7 :  std_logic;
signal heap_bh6_w34_7 :  std_logic;
signal heap_bh6_w33_8 :  std_logic;
signal heap_bh6_w32_7 :  std_logic;
signal heap_bh6_w31_7 :  std_logic;
signal heap_bh6_w30_7 :  std_logic;
signal heap_bh6_w29_6 :  std_logic;
signal heap_bh6_w28_6 :  std_logic;
signal heap_bh6_w27_7 :  std_logic;
signal heap_bh6_w26_6 :  std_logic;
signal heap_bh6_w25_6 :  std_logic;
signal heap_bh6_w24_7 :  std_logic;
signal heap_bh6_w23_6 :  std_logic;
signal heap_bh6_w22_5, heap_bh6_w22_5_d1 :  std_logic;
signal heap_bh6_w21_6 :  std_logic;
signal heap_bh6_w20_6 :  std_logic;
signal heap_bh6_w19_5 :  std_logic;
signal heap_bh6_w18_5 :  std_logic;
signal heap_bh6_w17_6 :  std_logic;
signal heap_bh6_w16_5 :  std_logic;
signal heap_bh6_w15_5 :  std_logic;
signal heap_bh6_w14_6 :  std_logic;
signal heap_bh6_w13_5 :  std_logic;
signal heap_bh6_w12_5 :  std_logic;
signal heap_bh6_w11_6 :  std_logic;
signal heap_bh6_w10_5 :  std_logic;
signal heap_bh6_w9_5 :  std_logic;
signal heap_bh6_w8_6, heap_bh6_w8_6_d1, heap_bh6_w8_6_d2, heap_bh6_w8_6_d3, heap_bh6_w8_6_d4 :  std_logic;
signal heap_bh6_w7_5 :  std_logic;
signal tempR_bh6_0, tempR_bh6_0_d1, tempR_bh6_0_d2, tempR_bh6_0_d3, tempR_bh6_0_d4, tempR_bh6_0_d5, tempR_bh6_0_d6, tempR_bh6_0_d7, tempR_bh6_0_d8 :  std_logic_vector(1 downto 0);
signal CompressorIn_bh6_0_0 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_0_0 :  std_logic_vector(2 downto 0);
signal heap_bh6_w8_7, heap_bh6_w8_7_d1 :  std_logic;
signal heap_bh6_w9_6, heap_bh6_w9_6_d1 :  std_logic;
signal heap_bh6_w10_6, heap_bh6_w10_6_d1 :  std_logic;
signal CompressorIn_bh6_1_1 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_1_1 :  std_logic_vector(2 downto 0);
signal heap_bh6_w11_7, heap_bh6_w11_7_d1 :  std_logic;
signal heap_bh6_w12_6, heap_bh6_w12_6_d1 :  std_logic;
signal heap_bh6_w13_6, heap_bh6_w13_6_d1 :  std_logic;
signal CompressorIn_bh6_2_2 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_2_2 :  std_logic_vector(2 downto 0);
signal heap_bh6_w14_7, heap_bh6_w14_7_d1 :  std_logic;
signal heap_bh6_w15_6, heap_bh6_w15_6_d1 :  std_logic;
signal heap_bh6_w16_6, heap_bh6_w16_6_d1 :  std_logic;
signal CompressorIn_bh6_3_3 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_3_3 :  std_logic_vector(2 downto 0);
signal heap_bh6_w17_7, heap_bh6_w17_7_d1 :  std_logic;
signal heap_bh6_w18_6, heap_bh6_w18_6_d1 :  std_logic;
signal heap_bh6_w19_6, heap_bh6_w19_6_d1 :  std_logic;
signal CompressorIn_bh6_4_4 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_4_4 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_7, heap_bh6_w20_7_d1 :  std_logic;
signal heap_bh6_w21_7, heap_bh6_w21_7_d1 :  std_logic;
signal heap_bh6_w22_6, heap_bh6_w22_6_d1 :  std_logic;
signal CompressorIn_bh6_5_5 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_5_5 :  std_logic_vector(2 downto 0);
signal heap_bh6_w21_8, heap_bh6_w21_8_d1 :  std_logic;
signal heap_bh6_w22_7, heap_bh6_w22_7_d1 :  std_logic;
signal heap_bh6_w23_7, heap_bh6_w23_7_d1 :  std_logic;
signal CompressorIn_bh6_6_6 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_6_6 :  std_logic_vector(2 downto 0);
signal heap_bh6_w23_8, heap_bh6_w23_8_d1 :  std_logic;
signal heap_bh6_w24_8, heap_bh6_w24_8_d1 :  std_logic;
signal heap_bh6_w25_7, heap_bh6_w25_7_d1 :  std_logic;
signal CompressorIn_bh6_7_7 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_7_7 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_9, heap_bh6_w24_9_d1 :  std_logic;
signal heap_bh6_w25_8, heap_bh6_w25_8_d1 :  std_logic;
signal heap_bh6_w26_7, heap_bh6_w26_7_d1 :  std_logic;
signal CompressorIn_bh6_8_8 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_8_8 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_8, heap_bh6_w27_8_d1 :  std_logic;
signal heap_bh6_w28_7, heap_bh6_w28_7_d1 :  std_logic;
signal heap_bh6_w29_7, heap_bh6_w29_7_d1 :  std_logic;
signal CompressorIn_bh6_9_9 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_9_9 :  std_logic_vector(2 downto 0);
signal heap_bh6_w30_8, heap_bh6_w30_8_d1 :  std_logic;
signal heap_bh6_w31_8, heap_bh6_w31_8_d1 :  std_logic;
signal heap_bh6_w32_8, heap_bh6_w32_8_d1 :  std_logic;
signal CompressorIn_bh6_10_10 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_10_10 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_9, heap_bh6_w33_9_d1 :  std_logic;
signal heap_bh6_w34_8, heap_bh6_w34_8_d1 :  std_logic;
signal heap_bh6_w35_8, heap_bh6_w35_8_d1 :  std_logic;
signal CompressorIn_bh6_11_11 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_11_11 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_9, heap_bh6_w36_9_d1 :  std_logic;
signal heap_bh6_w37_8, heap_bh6_w37_8_d1 :  std_logic;
signal heap_bh6_w38_9, heap_bh6_w38_9_d1 :  std_logic;
signal CompressorIn_bh6_12_12 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_12_12 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_10, heap_bh6_w38_10_d1 :  std_logic;
signal heap_bh6_w39_9, heap_bh6_w39_9_d1 :  std_logic;
signal heap_bh6_w40_8, heap_bh6_w40_8_d1 :  std_logic;
signal CompressorIn_bh6_13_13 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_13_13 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_10, heap_bh6_w39_10_d1 :  std_logic;
signal heap_bh6_w40_9, heap_bh6_w40_9_d1 :  std_logic;
signal heap_bh6_w41_10, heap_bh6_w41_10_d1 :  std_logic;
signal CompressorIn_bh6_14_14 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_14_14 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_11, heap_bh6_w41_11_d1 :  std_logic;
signal heap_bh6_w42_10, heap_bh6_w42_10_d1 :  std_logic;
signal heap_bh6_w43_8, heap_bh6_w43_8_d1 :  std_logic;
signal CompressorIn_bh6_15_15 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_15_15 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_11, heap_bh6_w42_11_d1 :  std_logic;
signal heap_bh6_w43_9, heap_bh6_w43_9_d1 :  std_logic;
signal heap_bh6_w44_10, heap_bh6_w44_10_d1 :  std_logic;
signal CompressorIn_bh6_16_16 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_16_16 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_11, heap_bh6_w44_11_d1 :  std_logic;
signal heap_bh6_w45_10, heap_bh6_w45_10_d1 :  std_logic;
signal heap_bh6_w46_8, heap_bh6_w46_8_d1 :  std_logic;
signal CompressorIn_bh6_17_17 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_17_17 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_11, heap_bh6_w45_11_d1 :  std_logic;
signal heap_bh6_w46_9, heap_bh6_w46_9_d1 :  std_logic;
signal heap_bh6_w47_10, heap_bh6_w47_10_d1 :  std_logic;
signal CompressorIn_bh6_18_18 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_18_18 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_11, heap_bh6_w47_11_d1 :  std_logic;
signal heap_bh6_w48_10, heap_bh6_w48_10_d1 :  std_logic;
signal heap_bh6_w49_8, heap_bh6_w49_8_d1 :  std_logic;
signal CompressorIn_bh6_19_19 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_19_19 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_11, heap_bh6_w48_11_d1 :  std_logic;
signal heap_bh6_w49_9, heap_bh6_w49_9_d1 :  std_logic;
signal heap_bh6_w50_10, heap_bh6_w50_10_d1 :  std_logic;
signal CompressorIn_bh6_20_20 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_20_20 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_11, heap_bh6_w50_11_d1 :  std_logic;
signal heap_bh6_w51_10, heap_bh6_w51_10_d1 :  std_logic;
signal heap_bh6_w52_8, heap_bh6_w52_8_d1 :  std_logic;
signal CompressorIn_bh6_21_21 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_21_21 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_11, heap_bh6_w51_11_d1 :  std_logic;
signal heap_bh6_w52_9, heap_bh6_w52_9_d1 :  std_logic;
signal heap_bh6_w53_8, heap_bh6_w53_8_d1 :  std_logic;
signal CompressorIn_bh6_22_22 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_22_23 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_22_22 :  std_logic_vector(2 downto 0);
signal heap_bh6_w4_4, heap_bh6_w4_4_d1, heap_bh6_w4_4_d2, heap_bh6_w4_4_d3, heap_bh6_w4_4_d4, heap_bh6_w4_4_d5 :  std_logic;
signal heap_bh6_w5_5, heap_bh6_w5_5_d1, heap_bh6_w5_5_d2, heap_bh6_w5_5_d3, heap_bh6_w5_5_d4, heap_bh6_w5_5_d5 :  std_logic;
signal heap_bh6_w6_5, heap_bh6_w6_5_d1 :  std_logic;
signal CompressorIn_bh6_23_24 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_23_25 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_23_23 :  std_logic_vector(2 downto 0);
signal heap_bh6_w5_6, heap_bh6_w5_6_d1, heap_bh6_w5_6_d2, heap_bh6_w5_6_d3, heap_bh6_w5_6_d4, heap_bh6_w5_6_d5 :  std_logic;
signal heap_bh6_w6_6, heap_bh6_w6_6_d1 :  std_logic;
signal heap_bh6_w7_6, heap_bh6_w7_6_d1 :  std_logic;
signal CompressorIn_bh6_24_26 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_24_27 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_24_24 :  std_logic_vector(2 downto 0);
signal heap_bh6_w6_7, heap_bh6_w6_7_d1 :  std_logic;
signal heap_bh6_w7_7, heap_bh6_w7_7_d1 :  std_logic;
signal heap_bh6_w8_8, heap_bh6_w8_8_d1 :  std_logic;
signal CompressorIn_bh6_25_28 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_25_29 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_25_25 :  std_logic_vector(2 downto 0);
signal heap_bh6_w9_7, heap_bh6_w9_7_d1 :  std_logic;
signal heap_bh6_w10_7, heap_bh6_w10_7_d1 :  std_logic;
signal heap_bh6_w11_8, heap_bh6_w11_8_d1 :  std_logic;
signal CompressorIn_bh6_26_30 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_26_31 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_26_26 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_7, heap_bh6_w12_7_d1 :  std_logic;
signal heap_bh6_w13_7, heap_bh6_w13_7_d1 :  std_logic;
signal heap_bh6_w14_8, heap_bh6_w14_8_d1 :  std_logic;
signal CompressorIn_bh6_27_32 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_27_33 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_27_27 :  std_logic_vector(2 downto 0);
signal heap_bh6_w15_7, heap_bh6_w15_7_d1 :  std_logic;
signal heap_bh6_w16_7, heap_bh6_w16_7_d1 :  std_logic;
signal heap_bh6_w17_8, heap_bh6_w17_8_d1 :  std_logic;
signal CompressorIn_bh6_28_34 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_28_35 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_28_28 :  std_logic_vector(2 downto 0);
signal heap_bh6_w18_7, heap_bh6_w18_7_d1 :  std_logic;
signal heap_bh6_w19_7, heap_bh6_w19_7_d1 :  std_logic;
signal heap_bh6_w20_8, heap_bh6_w20_8_d1 :  std_logic;
signal CompressorIn_bh6_29_36 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_29_37 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_29_29 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_9, heap_bh6_w25_9_d1 :  std_logic;
signal heap_bh6_w26_8, heap_bh6_w26_8_d1 :  std_logic;
signal heap_bh6_w27_9, heap_bh6_w27_9_d1 :  std_logic;
signal CompressorIn_bh6_30_38 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_30_39 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_30_30 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_8, heap_bh6_w28_8_d1 :  std_logic;
signal heap_bh6_w29_8, heap_bh6_w29_8_d1 :  std_logic;
signal heap_bh6_w30_9, heap_bh6_w30_9_d1 :  std_logic;
signal CompressorIn_bh6_31_40 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_31_41 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_31_31 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_9, heap_bh6_w31_9_d1 :  std_logic;
signal heap_bh6_w32_9, heap_bh6_w32_9_d1 :  std_logic;
signal heap_bh6_w33_10, heap_bh6_w33_10_d1 :  std_logic;
signal CompressorIn_bh6_32_42 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_32_43 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_32_32 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_9, heap_bh6_w34_9_d1 :  std_logic;
signal heap_bh6_w35_9, heap_bh6_w35_9_d1 :  std_logic;
signal heap_bh6_w36_10, heap_bh6_w36_10_d1 :  std_logic;
signal CompressorIn_bh6_33_44 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_33_45 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_33_33 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_10, heap_bh6_w52_10_d1 :  std_logic;
signal heap_bh6_w53_9, heap_bh6_w53_9_d1 :  std_logic;
signal heap_bh6_w54_8, heap_bh6_w54_8_d1 :  std_logic;
signal CompressorIn_bh6_34_46 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_34_47 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_34_34 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_9, heap_bh6_w54_9_d1 :  std_logic;
signal heap_bh6_w55_5, heap_bh6_w55_5_d1 :  std_logic;
signal heap_bh6_w56_5, heap_bh6_w56_5_d1 :  std_logic;
signal CompressorIn_bh6_35_48 :  std_logic_vector(4 downto 0);
signal CompressorOut_bh6_35_35 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_8, heap_bh6_w22_8_d1 :  std_logic;
signal heap_bh6_w23_9, heap_bh6_w23_9_d1 :  std_logic;
signal heap_bh6_w24_10, heap_bh6_w24_10_d1 :  std_logic;
signal CompressorIn_bh6_36_49 :  std_logic_vector(4 downto 0);
signal CompressorOut_bh6_36_36 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_9, heap_bh6_w37_9_d1 :  std_logic;
signal heap_bh6_w38_11, heap_bh6_w38_11_d1 :  std_logic;
signal heap_bh6_w39_11, heap_bh6_w39_11_d1 :  std_logic;
signal CompressorIn_bh6_37_50 :  std_logic_vector(4 downto 0);
signal CompressorOut_bh6_37_37 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_10, heap_bh6_w40_10_d1 :  std_logic;
signal heap_bh6_w41_12, heap_bh6_w41_12_d1 :  std_logic;
signal heap_bh6_w42_12, heap_bh6_w42_12_d1 :  std_logic;
signal CompressorIn_bh6_38_51 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_38_38 :  std_logic_vector(2 downto 0);
signal heap_bh6_w7_8, heap_bh6_w7_8_d1 :  std_logic;
signal heap_bh6_w8_9, heap_bh6_w8_9_d1 :  std_logic;
signal heap_bh6_w9_8, heap_bh6_w9_8_d1 :  std_logic;
signal CompressorIn_bh6_39_52 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_39_39 :  std_logic_vector(2 downto 0);
signal heap_bh6_w10_8, heap_bh6_w10_8_d1 :  std_logic;
signal heap_bh6_w11_9, heap_bh6_w11_9_d1 :  std_logic;
signal heap_bh6_w12_8, heap_bh6_w12_8_d1 :  std_logic;
signal CompressorIn_bh6_40_53 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_40_40 :  std_logic_vector(2 downto 0);
signal heap_bh6_w13_8, heap_bh6_w13_8_d1 :  std_logic;
signal heap_bh6_w14_9, heap_bh6_w14_9_d1 :  std_logic;
signal heap_bh6_w15_8, heap_bh6_w15_8_d1 :  std_logic;
signal CompressorIn_bh6_41_54 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_41_41 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_8, heap_bh6_w16_8_d1 :  std_logic;
signal heap_bh6_w17_9, heap_bh6_w17_9_d1 :  std_logic;
signal heap_bh6_w18_8, heap_bh6_w18_8_d1 :  std_logic;
signal CompressorIn_bh6_42_55 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_42_42 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_8, heap_bh6_w19_8_d1 :  std_logic;
signal heap_bh6_w20_9, heap_bh6_w20_9_d1 :  std_logic;
signal heap_bh6_w21_9, heap_bh6_w21_9_d1 :  std_logic;
signal CompressorIn_bh6_43_56 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_43_43 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_9, heap_bh6_w26_9_d1 :  std_logic;
signal heap_bh6_w27_10, heap_bh6_w27_10_d1 :  std_logic;
signal heap_bh6_w28_9, heap_bh6_w28_9_d1 :  std_logic;
signal CompressorIn_bh6_44_57 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_44_44 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_9, heap_bh6_w29_9_d1 :  std_logic;
signal heap_bh6_w30_10, heap_bh6_w30_10_d1 :  std_logic;
signal heap_bh6_w31_10, heap_bh6_w31_10_d1 :  std_logic;
signal CompressorIn_bh6_45_58 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_45_45 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_10, heap_bh6_w32_10_d1 :  std_logic;
signal heap_bh6_w33_11, heap_bh6_w33_11_d1 :  std_logic;
signal heap_bh6_w34_10, heap_bh6_w34_10_d1 :  std_logic;
signal CompressorIn_bh6_46_59 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_46_46 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_10, heap_bh6_w35_10_d1 :  std_logic;
signal heap_bh6_w36_11, heap_bh6_w36_11_d1 :  std_logic;
signal heap_bh6_w37_10, heap_bh6_w37_10_d1 :  std_logic;
signal CompressorIn_bh6_47_60 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_47_47 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_10, heap_bh6_w43_10_d1 :  std_logic;
signal heap_bh6_w44_12, heap_bh6_w44_12_d1 :  std_logic;
signal heap_bh6_w45_12, heap_bh6_w45_12_d1 :  std_logic;
signal CompressorIn_bh6_48_61 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_48_48 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_10, heap_bh6_w46_10_d1 :  std_logic;
signal heap_bh6_w47_12, heap_bh6_w47_12_d1 :  std_logic;
signal heap_bh6_w48_12, heap_bh6_w48_12_d1 :  std_logic;
signal CompressorIn_bh6_49_62 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_49_49 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_10, heap_bh6_w49_10_d1 :  std_logic;
signal heap_bh6_w50_12, heap_bh6_w50_12_d1 :  std_logic;
signal heap_bh6_w51_12, heap_bh6_w51_12_d1 :  std_logic;
signal CompressorIn_bh6_50_63 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_50_64 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_50_50 :  std_logic_vector(2 downto 0);
signal heap_bh6_w2_3 :  std_logic;
signal heap_bh6_w3_3, heap_bh6_w3_3_d1, heap_bh6_w3_3_d2, heap_bh6_w3_3_d3, heap_bh6_w3_3_d4, heap_bh6_w3_3_d5 :  std_logic;
signal heap_bh6_w4_5, heap_bh6_w4_5_d1, heap_bh6_w4_5_d2, heap_bh6_w4_5_d3, heap_bh6_w4_5_d4, heap_bh6_w4_5_d5 :  std_logic;
signal CompressorIn_bh6_51_65 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_51_51 :  std_logic_vector(1 downto 0);
signal heap_bh6_w53_10, heap_bh6_w53_10_d1 :  std_logic;
signal heap_bh6_w54_10, heap_bh6_w54_10_d1 :  std_logic;
signal tempR_bh6_1, tempR_bh6_1_d1, tempR_bh6_1_d2, tempR_bh6_1_d3, tempR_bh6_1_d4, tempR_bh6_1_d5, tempR_bh6_1_d6, tempR_bh6_1_d7, tempR_bh6_1_d8 :  std_logic;
signal CompressorIn_bh6_52_66 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_52_67 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_52_52 :  std_logic_vector(2 downto 0);
signal heap_bh6_w9_9 :  std_logic;
signal heap_bh6_w10_9 :  std_logic;
signal heap_bh6_w11_10 :  std_logic;
signal CompressorIn_bh6_53_68 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_53_69 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_53_53 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_9 :  std_logic;
signal heap_bh6_w13_9 :  std_logic;
signal heap_bh6_w14_10 :  std_logic;
signal CompressorIn_bh6_54_70 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_54_71 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_54_54 :  std_logic_vector(2 downto 0);
signal heap_bh6_w15_9 :  std_logic;
signal heap_bh6_w16_9 :  std_logic;
signal heap_bh6_w17_10 :  std_logic;
signal CompressorIn_bh6_55_72 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_55_73 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_55_55 :  std_logic_vector(2 downto 0);
signal heap_bh6_w18_9 :  std_logic;
signal heap_bh6_w19_9 :  std_logic;
signal heap_bh6_w20_10 :  std_logic;
signal CompressorIn_bh6_56_74 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_56_75 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_56_56 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_10 :  std_logic;
signal heap_bh6_w26_10 :  std_logic;
signal heap_bh6_w27_11 :  std_logic;
signal CompressorIn_bh6_57_76 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_57_77 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_57_57 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_10 :  std_logic;
signal heap_bh6_w29_10 :  std_logic;
signal heap_bh6_w30_11 :  std_logic;
signal CompressorIn_bh6_58_78 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_58_79 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_58_58 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_11 :  std_logic;
signal heap_bh6_w32_11 :  std_logic;
signal heap_bh6_w33_12 :  std_logic;
signal CompressorIn_bh6_59_80 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_59_81 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_59_59 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_11 :  std_logic;
signal heap_bh6_w35_11 :  std_logic;
signal heap_bh6_w36_12 :  std_logic;
signal CompressorIn_bh6_60_82 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_60_83 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_60_60 :  std_logic_vector(2 downto 0);
signal heap_bh6_w6_8, heap_bh6_w6_8_d1, heap_bh6_w6_8_d2, heap_bh6_w6_8_d3, heap_bh6_w6_8_d4 :  std_logic;
signal heap_bh6_w7_9 :  std_logic;
signal heap_bh6_w8_10 :  std_logic;
signal CompressorIn_bh6_61_84 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_61_85 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_61_61 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_11 :  std_logic;
signal heap_bh6_w21_10 :  std_logic;
signal heap_bh6_w22_9 :  std_logic;
signal CompressorIn_bh6_62_86 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_62_87 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_62_62 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_10 :  std_logic;
signal heap_bh6_w23_10 :  std_logic;
signal heap_bh6_w24_11 :  std_logic;
signal CompressorIn_bh6_63_88 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_63_89 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_63_63 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_13 :  std_logic;
signal heap_bh6_w37_11 :  std_logic;
signal heap_bh6_w38_12 :  std_logic;
signal CompressorIn_bh6_64_90 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_64_91 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_64_64 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_13 :  std_logic;
signal heap_bh6_w39_12 :  std_logic;
signal heap_bh6_w40_11 :  std_logic;
signal CompressorIn_bh6_65_92 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_65_93 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_65_65 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_12 :  std_logic;
signal heap_bh6_w41_13 :  std_logic;
signal heap_bh6_w42_13 :  std_logic;
signal CompressorIn_bh6_66_94 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_66_95 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_66_66 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_14 :  std_logic;
signal heap_bh6_w43_11 :  std_logic;
signal heap_bh6_w44_13 :  std_logic;
signal CompressorIn_bh6_67_96 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_67_97 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_67_67 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_14 :  std_logic;
signal heap_bh6_w45_13 :  std_logic;
signal heap_bh6_w46_11 :  std_logic;
signal CompressorIn_bh6_68_98 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_68_99 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_68_68 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_12 :  std_logic;
signal heap_bh6_w47_13 :  std_logic;
signal heap_bh6_w48_13 :  std_logic;
signal CompressorIn_bh6_69_100 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_69_101 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_69_69 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_14 :  std_logic;
signal heap_bh6_w49_11 :  std_logic;
signal heap_bh6_w50_13 :  std_logic;
signal CompressorIn_bh6_70_102 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_70_103 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_70_70 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_14 :  std_logic;
signal heap_bh6_w51_13 :  std_logic;
signal heap_bh6_w52_11 :  std_logic;
signal CompressorIn_bh6_71_104 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_71_105 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_71_71 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_12 :  std_logic;
signal heap_bh6_w53_11 :  std_logic;
signal heap_bh6_w54_11 :  std_logic;
signal CompressorIn_bh6_72_106 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_72_107 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_72_72 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_12 :  std_logic;
signal heap_bh6_w55_6 :  std_logic;
signal heap_bh6_w56_6 :  std_logic;
signal CompressorIn_bh6_73_108 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_73_73 :  std_logic_vector(1 downto 0);
signal heap_bh6_w8_11 :  std_logic;
signal heap_bh6_w9_10 :  std_logic;
signal CompressorIn_bh6_74_109 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_74_74 :  std_logic_vector(1 downto 0);
signal heap_bh6_w11_11 :  std_logic;
signal heap_bh6_w12_10 :  std_logic;
signal CompressorIn_bh6_75_110 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_75_75 :  std_logic_vector(1 downto 0);
signal heap_bh6_w14_11 :  std_logic;
signal heap_bh6_w15_10 :  std_logic;
signal CompressorIn_bh6_76_111 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_76_76 :  std_logic_vector(1 downto 0);
signal heap_bh6_w17_11 :  std_logic;
signal heap_bh6_w18_10 :  std_logic;
signal CompressorIn_bh6_77_112 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_77_77 :  std_logic_vector(1 downto 0);
signal heap_bh6_w24_12 :  std_logic;
signal heap_bh6_w25_11 :  std_logic;
signal CompressorIn_bh6_78_113 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_78_78 :  std_logic_vector(1 downto 0);
signal heap_bh6_w27_12 :  std_logic;
signal heap_bh6_w28_11 :  std_logic;
signal CompressorIn_bh6_79_114 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_79_79 :  std_logic_vector(1 downto 0);
signal heap_bh6_w30_12 :  std_logic;
signal heap_bh6_w31_12 :  std_logic;
signal CompressorIn_bh6_80_115 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_80_80 :  std_logic_vector(1 downto 0);
signal heap_bh6_w33_13 :  std_logic;
signal heap_bh6_w34_12 :  std_logic;
signal CompressorIn_bh6_81_116 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_81_81 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_12, heap_bh6_w32_12_d1 :  std_logic;
signal heap_bh6_w33_14 :  std_logic;
signal heap_bh6_w34_13, heap_bh6_w34_13_d1 :  std_logic;
signal CompressorIn_bh6_82_117 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_82_82 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_12 :  std_logic;
signal heap_bh6_w36_14 :  std_logic;
signal heap_bh6_w37_12, heap_bh6_w37_12_d1 :  std_logic;
signal CompressorIn_bh6_83_118 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_83_83 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_14, heap_bh6_w41_14_d1 :  std_logic;
signal heap_bh6_w42_15 :  std_logic;
signal heap_bh6_w43_12, heap_bh6_w43_12_d1 :  std_logic;
signal CompressorIn_bh6_84_119 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_84_84 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_16 :  std_logic;
signal heap_bh6_w43_13 :  std_logic;
signal heap_bh6_w44_15 :  std_logic;
signal CompressorIn_bh6_85_120 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_85_85 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_14 :  std_logic;
signal heap_bh6_w44_16 :  std_logic;
signal heap_bh6_w45_14, heap_bh6_w45_14_d1, heap_bh6_w45_14_d2 :  std_logic;
signal CompressorIn_bh6_86_121 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_86_86 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_17 :  std_logic;
signal heap_bh6_w45_15 :  std_logic;
signal heap_bh6_w46_13 :  std_logic;
signal CompressorIn_bh6_87_122 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_87_87 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_16 :  std_logic;
signal heap_bh6_w46_14 :  std_logic;
signal heap_bh6_w47_14, heap_bh6_w47_14_d1, heap_bh6_w47_14_d2 :  std_logic;
signal CompressorIn_bh6_88_123 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_88_88 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_15 :  std_logic;
signal heap_bh6_w47_15 :  std_logic;
signal heap_bh6_w48_15 :  std_logic;
signal CompressorIn_bh6_89_124 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_89_89 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_16 :  std_logic;
signal heap_bh6_w48_16 :  std_logic;
signal heap_bh6_w49_12, heap_bh6_w49_12_d1, heap_bh6_w49_12_d2 :  std_logic;
signal CompressorIn_bh6_90_125 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_90_90 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_17 :  std_logic;
signal heap_bh6_w49_13 :  std_logic;
signal heap_bh6_w50_15 :  std_logic;
signal CompressorIn_bh6_91_126 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_91_91 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_14 :  std_logic;
signal heap_bh6_w50_16 :  std_logic;
signal heap_bh6_w51_14, heap_bh6_w51_14_d1, heap_bh6_w51_14_d2 :  std_logic;
signal CompressorIn_bh6_92_127 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_92_92 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_17 :  std_logic;
signal heap_bh6_w51_15 :  std_logic;
signal heap_bh6_w52_13 :  std_logic;
signal CompressorIn_bh6_93_128 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_93_93 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_16 :  std_logic;
signal heap_bh6_w52_14 :  std_logic;
signal heap_bh6_w53_12, heap_bh6_w53_12_d1, heap_bh6_w53_12_d2, heap_bh6_w53_12_d3 :  std_logic;
signal CompressorIn_bh6_94_129 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_94_94 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_15 :  std_logic;
signal heap_bh6_w53_13 :  std_logic;
signal heap_bh6_w54_13 :  std_logic;
signal CompressorIn_bh6_95_130 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_95_95 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_14 :  std_logic;
signal heap_bh6_w54_14 :  std_logic;
signal heap_bh6_w55_7 :  std_logic;
signal CompressorIn_bh6_96_131 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_96_96 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_15 :  std_logic;
signal heap_bh6_w55_8 :  std_logic;
signal heap_bh6_w56_7, heap_bh6_w56_7_d1 :  std_logic;
signal CompressorIn_bh6_97_132 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_97_97 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_8, heap_bh6_w56_8_d1 :  std_logic;
signal heap_bh6_w57_5 :  std_logic;
signal heap_bh6_w58_4, heap_bh6_w58_4_d1 :  std_logic;
signal CompressorIn_bh6_98_133 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_98_134 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_98_98 :  std_logic_vector(2 downto 0);
signal heap_bh6_w10_10, heap_bh6_w10_10_d1, heap_bh6_w10_10_d2, heap_bh6_w10_10_d3, heap_bh6_w10_10_d4 :  std_logic;
signal heap_bh6_w11_12 :  std_logic;
signal heap_bh6_w12_11 :  std_logic;
signal CompressorIn_bh6_99_135 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_99_136 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_99_99 :  std_logic_vector(2 downto 0);
signal heap_bh6_w13_10, heap_bh6_w13_10_d1 :  std_logic;
signal heap_bh6_w14_12 :  std_logic;
signal heap_bh6_w15_11 :  std_logic;
signal CompressorIn_bh6_100_137 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_100_138 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_100_100 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_10, heap_bh6_w16_10_d1 :  std_logic;
signal heap_bh6_w17_12 :  std_logic;
signal heap_bh6_w18_11 :  std_logic;
signal CompressorIn_bh6_101_139 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_101_140 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_101_101 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_10, heap_bh6_w19_10_d1 :  std_logic;
signal heap_bh6_w20_12 :  std_logic;
signal heap_bh6_w21_11 :  std_logic;
signal CompressorIn_bh6_102_141 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_102_142 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_102_102 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_13, heap_bh6_w24_13_d1 :  std_logic;
signal heap_bh6_w25_12, heap_bh6_w25_12_d1 :  std_logic;
signal heap_bh6_w26_11 :  std_logic;
signal CompressorIn_bh6_103_143 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_103_144 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_103_103 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_12 :  std_logic;
signal heap_bh6_w27_13, heap_bh6_w27_13_d1, heap_bh6_w27_13_d2, heap_bh6_w27_13_d3, heap_bh6_w27_13_d4 :  std_logic;
signal heap_bh6_w28_12 :  std_logic;
signal CompressorIn_bh6_104_145 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_104_146 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_104_104 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_13 :  std_logic;
signal heap_bh6_w29_11 :  std_logic;
signal heap_bh6_w30_13 :  std_logic;
signal CompressorIn_bh6_105_147 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_105_148 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_105_105 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_12 :  std_logic;
signal heap_bh6_w30_14 :  std_logic;
signal heap_bh6_w31_13, heap_bh6_w31_13_d1, heap_bh6_w31_13_d2, heap_bh6_w31_13_d3, heap_bh6_w31_13_d4 :  std_logic;
signal CompressorIn_bh6_106_149 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_106_150 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_106_106 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_15 :  std_logic;
signal heap_bh6_w34_14, heap_bh6_w34_14_d1 :  std_logic;
signal heap_bh6_w35_13 :  std_logic;
signal CompressorIn_bh6_107_151 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_107_152 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_107_107 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_15 :  std_logic;
signal heap_bh6_w37_13, heap_bh6_w37_13_d1 :  std_logic;
signal heap_bh6_w38_14 :  std_logic;
signal CompressorIn_bh6_108_153 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_108_154 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_108_108 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_14 :  std_logic;
signal heap_bh6_w38_15 :  std_logic;
signal heap_bh6_w39_13, heap_bh6_w39_13_d1 :  std_logic;
signal CompressorIn_bh6_109_155 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_109_156 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_109_109 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_16 :  std_logic;
signal heap_bh6_w39_14 :  std_logic;
signal heap_bh6_w40_13 :  std_logic;
signal CompressorIn_bh6_110_157 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_110_158 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_110_110 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_15 :  std_logic;
signal heap_bh6_w40_14 :  std_logic;
signal heap_bh6_w41_15 :  std_logic;
signal CompressorIn_bh6_111_159 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_111_160 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_111_111 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_9 :  std_logic;
signal heap_bh6_w56_9 :  std_logic;
signal heap_bh6_w57_6 :  std_logic;
signal CompressorIn_bh6_112_161 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_112_162 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_112_112 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_7 :  std_logic;
signal heap_bh6_w58_5, heap_bh6_w58_5_d1 :  std_logic;
signal heap_bh6_w59_4 :  std_logic;
signal CompressorIn_bh6_113_163 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_113_164 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_113_113 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_5 :  std_logic;
signal heap_bh6_w60_4 :  std_logic;
signal heap_bh6_w61_4 :  std_logic;
signal CompressorIn_bh6_114_165 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_114_166 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_114_114 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_5 :  std_logic;
signal heap_bh6_w62_4 :  std_logic;
signal heap_bh6_w63_4 :  std_logic;
signal CompressorIn_bh6_115_167 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_115_168 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_115_115 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_5 :  std_logic;
signal heap_bh6_w64_4 :  std_logic;
signal heap_bh6_w65_4 :  std_logic;
signal CompressorIn_bh6_116_169 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_116_170 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_116_116 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_5 :  std_logic;
signal heap_bh6_w66_4 :  std_logic;
signal heap_bh6_w67_4 :  std_logic;
signal CompressorIn_bh6_117_171 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_117_172 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_117_117 :  std_logic_vector(2 downto 0);
signal heap_bh6_w67_5 :  std_logic;
signal heap_bh6_w68_4 :  std_logic;
signal heap_bh6_w69_4 :  std_logic;
signal CompressorIn_bh6_118_173 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_118_174 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_118_118 :  std_logic_vector(2 downto 0);
signal heap_bh6_w69_5 :  std_logic;
signal heap_bh6_w70_4 :  std_logic;
signal heap_bh6_w71_4 :  std_logic;
signal CompressorIn_bh6_119_175 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_119_176 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_119_119 :  std_logic_vector(2 downto 0);
signal heap_bh6_w71_5 :  std_logic;
signal heap_bh6_w72_3, heap_bh6_w72_3_d1, heap_bh6_w72_3_d2, heap_bh6_w72_3_d3, heap_bh6_w72_3_d4 :  std_logic;
signal heap_bh6_w73_3, heap_bh6_w73_3_d1 :  std_logic;
signal CompressorIn_bh6_120_177 :  std_logic_vector(4 downto 0);
signal CompressorOut_bh6_120_120 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_14 :  std_logic;
signal heap_bh6_w32_13, heap_bh6_w32_13_d1 :  std_logic;
signal heap_bh6_w33_16 :  std_logic;
signal CompressorIn_bh6_121_178 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_121_121 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_15 :  std_logic;
signal heap_bh6_w35_14 :  std_logic;
signal heap_bh6_w36_16 :  std_logic;
signal CompressorIn_bh6_122_179 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_122_122 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_15 :  std_logic;
signal heap_bh6_w41_16 :  std_logic;
signal heap_bh6_w42_17 :  std_logic;
signal CompressorIn_bh6_123_180 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_123_181 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_123_123 :  std_logic_vector(2 downto 0);
signal heap_bh6_w7_10, heap_bh6_w7_10_d1, heap_bh6_w7_10_d2, heap_bh6_w7_10_d3, heap_bh6_w7_10_d4 :  std_logic;
signal heap_bh6_w8_12, heap_bh6_w8_12_d1, heap_bh6_w8_12_d2, heap_bh6_w8_12_d3, heap_bh6_w8_12_d4 :  std_logic;
signal heap_bh6_w9_11, heap_bh6_w9_11_d1, heap_bh6_w9_11_d2, heap_bh6_w9_11_d3, heap_bh6_w9_11_d4 :  std_logic;
signal CompressorIn_bh6_124_182 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_124_183 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_124_124 :  std_logic_vector(2 downto 0);
signal heap_bh6_w21_12 :  std_logic;
signal heap_bh6_w22_11, heap_bh6_w22_11_d1 :  std_logic;
signal heap_bh6_w23_11, heap_bh6_w23_11_d1 :  std_logic;
signal CompressorIn_bh6_125_184 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_125_185 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_125_125 :  std_logic_vector(2 downto 0);
signal heap_bh6_w73_4, heap_bh6_w73_4_d1 :  std_logic;
signal heap_bh6_w74_3, heap_bh6_w74_3_d1 :  std_logic;
signal heap_bh6_w75_3, heap_bh6_w75_3_d1 :  std_logic;
signal CompressorIn_bh6_126_186 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_126_187 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_126_126 :  std_logic_vector(2 downto 0);
signal heap_bh6_w75_4, heap_bh6_w75_4_d1 :  std_logic;
signal heap_bh6_w76_3, heap_bh6_w76_3_d1 :  std_logic;
signal heap_bh6_w77_3, heap_bh6_w77_3_d1 :  std_logic;
signal CompressorIn_bh6_127_188 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_127_189 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_127_127 :  std_logic_vector(2 downto 0);
signal heap_bh6_w77_4, heap_bh6_w77_4_d1 :  std_logic;
signal heap_bh6_w78_3, heap_bh6_w78_3_d1 :  std_logic;
signal heap_bh6_w79_3, heap_bh6_w79_3_d1 :  std_logic;
signal CompressorIn_bh6_128_190 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_128_191 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_128_128 :  std_logic_vector(2 downto 0);
signal heap_bh6_w79_4, heap_bh6_w79_4_d1 :  std_logic;
signal heap_bh6_w80_3, heap_bh6_w80_3_d1 :  std_logic;
signal heap_bh6_w81_3, heap_bh6_w81_3_d1, heap_bh6_w81_3_d2 :  std_logic;
signal CompressorIn_bh6_129_192 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_129_193 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_129_129 :  std_logic_vector(2 downto 0);
signal heap_bh6_w81_4, heap_bh6_w81_4_d1, heap_bh6_w81_4_d2 :  std_logic;
signal heap_bh6_w82_2, heap_bh6_w82_2_d1, heap_bh6_w82_2_d2 :  std_logic;
signal heap_bh6_w83_2 :  std_logic;
signal CompressorIn_bh6_130_194 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_130_195 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_130_130 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_13, heap_bh6_w25_13_d1 :  std_logic;
signal heap_bh6_w26_13 :  std_logic;
signal heap_bh6_w27_14 :  std_logic;
signal CompressorIn_bh6_131_196 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_131_131 :  std_logic_vector(1 downto 0);
signal heap_bh6_w9_12, heap_bh6_w9_12_d1, heap_bh6_w9_12_d2, heap_bh6_w9_12_d3, heap_bh6_w9_12_d4 :  std_logic;
signal heap_bh6_w10_11, heap_bh6_w10_11_d1, heap_bh6_w10_11_d2, heap_bh6_w10_11_d3, heap_bh6_w10_11_d4 :  std_logic;
signal CompressorIn_bh6_132_197 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_132_132 :  std_logic_vector(1 downto 0);
signal heap_bh6_w12_12 :  std_logic;
signal heap_bh6_w13_11, heap_bh6_w13_11_d1 :  std_logic;
signal CompressorIn_bh6_133_198 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_133_133 :  std_logic_vector(1 downto 0);
signal heap_bh6_w15_12 :  std_logic;
signal heap_bh6_w16_11, heap_bh6_w16_11_d1 :  std_logic;
signal CompressorIn_bh6_134_199 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_134_134 :  std_logic_vector(1 downto 0);
signal heap_bh6_w18_12 :  std_logic;
signal heap_bh6_w19_11, heap_bh6_w19_11_d1 :  std_logic;
signal CompressorIn_bh6_135_200 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_135_135 :  std_logic_vector(1 downto 0);
signal heap_bh6_w23_12, heap_bh6_w23_12_d1 :  std_logic;
signal heap_bh6_w24_14, heap_bh6_w24_14_d1 :  std_logic;
signal CompressorIn_bh6_136_201 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_136_136 :  std_logic_vector(1 downto 0);
signal heap_bh6_w27_15 :  std_logic;
signal heap_bh6_w28_14 :  std_logic;
signal CompressorIn_bh6_137_202 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_137_137 :  std_logic_vector(1 downto 0);
signal heap_bh6_w30_15 :  std_logic;
signal heap_bh6_w31_15 :  std_logic;
signal CompressorIn_bh6_138_203 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_138_138 :  std_logic_vector(1 downto 0);
signal heap_bh6_w58_6 :  std_logic;
signal heap_bh6_w59_6 :  std_logic;
signal CompressorIn_bh6_139_204 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_139_139 :  std_logic_vector(1 downto 0);
signal heap_bh6_w60_5 :  std_logic;
signal heap_bh6_w61_6 :  std_logic;
signal CompressorIn_bh6_140_205 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_140_140 :  std_logic_vector(1 downto 0);
signal heap_bh6_w62_5 :  std_logic;
signal heap_bh6_w63_6 :  std_logic;
signal CompressorIn_bh6_141_206 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_141_141 :  std_logic_vector(1 downto 0);
signal heap_bh6_w64_5 :  std_logic;
signal heap_bh6_w65_6 :  std_logic;
signal CompressorIn_bh6_142_207 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_142_142 :  std_logic_vector(1 downto 0);
signal heap_bh6_w66_5 :  std_logic;
signal heap_bh6_w67_6 :  std_logic;
signal CompressorIn_bh6_143_208 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_143_143 :  std_logic_vector(1 downto 0);
signal heap_bh6_w68_5 :  std_logic;
signal heap_bh6_w69_6 :  std_logic;
signal CompressorIn_bh6_144_209 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_144_144 :  std_logic_vector(1 downto 0);
signal heap_bh6_w70_5 :  std_logic;
signal heap_bh6_w71_6 :  std_logic;
signal CompressorIn_bh6_145_210 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_145_211 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_145_145 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_17, heap_bh6_w33_17_d1 :  std_logic;
signal heap_bh6_w34_16, heap_bh6_w34_16_d1 :  std_logic;
signal heap_bh6_w35_15, heap_bh6_w35_15_d1 :  std_logic;
signal CompressorIn_bh6_146_212 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_146_213 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_146_146 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_17, heap_bh6_w36_17_d1 :  std_logic;
signal heap_bh6_w37_15, heap_bh6_w37_15_d1 :  std_logic;
signal heap_bh6_w38_17, heap_bh6_w38_17_d1 :  std_logic;
signal CompressorIn_bh6_147_214 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_147_215 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_147_147 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_10, heap_bh6_w55_10_d1, heap_bh6_w55_10_d2, heap_bh6_w55_10_d3 :  std_logic;
signal heap_bh6_w56_10, heap_bh6_w56_10_d1 :  std_logic;
signal heap_bh6_w57_8, heap_bh6_w57_8_d1 :  std_logic;
signal CompressorIn_bh6_148_216 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_148_217 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_148_148 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_9, heap_bh6_w57_9_d1 :  std_logic;
signal heap_bh6_w58_7, heap_bh6_w58_7_d1 :  std_logic;
signal heap_bh6_w59_7, heap_bh6_w59_7_d1 :  std_logic;
signal CompressorIn_bh6_149_218 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_149_219 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_149_149 :  std_logic_vector(2 downto 0);
signal heap_bh6_w11_13, heap_bh6_w11_13_d1, heap_bh6_w11_13_d2, heap_bh6_w11_13_d3, heap_bh6_w11_13_d4 :  std_logic;
signal heap_bh6_w12_13, heap_bh6_w12_13_d1, heap_bh6_w12_13_d2, heap_bh6_w12_13_d3, heap_bh6_w12_13_d4 :  std_logic;
signal heap_bh6_w13_12, heap_bh6_w13_12_d1 :  std_logic;
signal CompressorIn_bh6_150_220 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_150_221 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_150_150 :  std_logic_vector(2 downto 0);
signal heap_bh6_w14_13, heap_bh6_w14_13_d1 :  std_logic;
signal heap_bh6_w15_13, heap_bh6_w15_13_d1, heap_bh6_w15_13_d2, heap_bh6_w15_13_d3, heap_bh6_w15_13_d4 :  std_logic;
signal heap_bh6_w16_12, heap_bh6_w16_12_d1 :  std_logic;
signal CompressorIn_bh6_151_222 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_151_223 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_151_151 :  std_logic_vector(2 downto 0);
signal heap_bh6_w17_13, heap_bh6_w17_13_d1 :  std_logic;
signal heap_bh6_w18_13, heap_bh6_w18_13_d1, heap_bh6_w18_13_d2, heap_bh6_w18_13_d3, heap_bh6_w18_13_d4 :  std_logic;
signal heap_bh6_w19_12, heap_bh6_w19_12_d1 :  std_logic;
signal CompressorIn_bh6_152_224 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_152_225 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_152_152 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_13, heap_bh6_w20_13_d1 :  std_logic;
signal heap_bh6_w21_13, heap_bh6_w21_13_d1, heap_bh6_w21_13_d2, heap_bh6_w21_13_d3, heap_bh6_w21_13_d4 :  std_logic;
signal heap_bh6_w22_12, heap_bh6_w22_12_d1 :  std_logic;
signal CompressorIn_bh6_153_226 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_153_227 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_153_153 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_14, heap_bh6_w26_14_d1, heap_bh6_w26_14_d2, heap_bh6_w26_14_d3, heap_bh6_w26_14_d4 :  std_logic;
signal heap_bh6_w27_16, heap_bh6_w27_16_d1, heap_bh6_w27_16_d2, heap_bh6_w27_16_d3, heap_bh6_w27_16_d4 :  std_logic;
signal heap_bh6_w28_15, heap_bh6_w28_15_d1, heap_bh6_w28_15_d2, heap_bh6_w28_15_d3, heap_bh6_w28_15_d4 :  std_logic;
signal CompressorIn_bh6_154_228 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_154_229 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_154_154 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_16, heap_bh6_w28_16_d1, heap_bh6_w28_16_d2, heap_bh6_w28_16_d3, heap_bh6_w28_16_d4 :  std_logic;
signal heap_bh6_w29_13, heap_bh6_w29_13_d1, heap_bh6_w29_13_d2, heap_bh6_w29_13_d3, heap_bh6_w29_13_d4 :  std_logic;
signal heap_bh6_w30_16, heap_bh6_w30_16_d1, heap_bh6_w30_16_d2, heap_bh6_w30_16_d3, heap_bh6_w30_16_d4 :  std_logic;
signal CompressorIn_bh6_155_230 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_155_231 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_155_155 :  std_logic_vector(2 downto 0);
signal heap_bh6_w30_17, heap_bh6_w30_17_d1, heap_bh6_w30_17_d2, heap_bh6_w30_17_d3, heap_bh6_w30_17_d4 :  std_logic;
signal heap_bh6_w31_16, heap_bh6_w31_16_d1, heap_bh6_w31_16_d2, heap_bh6_w31_16_d3, heap_bh6_w31_16_d4 :  std_logic;
signal heap_bh6_w32_14, heap_bh6_w32_14_d1 :  std_logic;
signal CompressorIn_bh6_156_232 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_156_233 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_156_156 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_18, heap_bh6_w38_18_d1 :  std_logic;
signal heap_bh6_w39_16, heap_bh6_w39_16_d1 :  std_logic;
signal heap_bh6_w40_16, heap_bh6_w40_16_d1 :  std_logic;
signal CompressorIn_bh6_157_234 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_157_235 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_157_157 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_17, heap_bh6_w40_17_d1 :  std_logic;
signal heap_bh6_w41_17, heap_bh6_w41_17_d1 :  std_logic;
signal heap_bh6_w42_18, heap_bh6_w42_18_d1 :  std_logic;
signal CompressorIn_bh6_158_236 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_158_237 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_158_158 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_19, heap_bh6_w42_19_d1 :  std_logic;
signal heap_bh6_w43_15, heap_bh6_w43_15_d1 :  std_logic;
signal heap_bh6_w44_18, heap_bh6_w44_18_d1 :  std_logic;
signal CompressorIn_bh6_159_238 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_159_239 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_159_159 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_19, heap_bh6_w44_19_d1 :  std_logic;
signal heap_bh6_w45_17, heap_bh6_w45_17_d1, heap_bh6_w45_17_d2 :  std_logic;
signal heap_bh6_w46_16, heap_bh6_w46_16_d1, heap_bh6_w46_16_d2 :  std_logic;
signal CompressorIn_bh6_160_240 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_160_241 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_160_160 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_17, heap_bh6_w46_17_d1, heap_bh6_w46_17_d2 :  std_logic;
signal heap_bh6_w47_17, heap_bh6_w47_17_d1, heap_bh6_w47_17_d2 :  std_logic;
signal heap_bh6_w48_18, heap_bh6_w48_18_d1, heap_bh6_w48_18_d2 :  std_logic;
signal CompressorIn_bh6_161_242 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_161_243 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_161_161 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_19, heap_bh6_w48_19_d1, heap_bh6_w48_19_d2 :  std_logic;
signal heap_bh6_w49_15, heap_bh6_w49_15_d1, heap_bh6_w49_15_d2 :  std_logic;
signal heap_bh6_w50_18, heap_bh6_w50_18_d1, heap_bh6_w50_18_d2 :  std_logic;
signal CompressorIn_bh6_162_244 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_162_245 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_162_162 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_19, heap_bh6_w50_19_d1, heap_bh6_w50_19_d2 :  std_logic;
signal heap_bh6_w51_17, heap_bh6_w51_17_d1, heap_bh6_w51_17_d2 :  std_logic;
signal heap_bh6_w52_16, heap_bh6_w52_16_d1, heap_bh6_w52_16_d2 :  std_logic;
signal CompressorIn_bh6_163_246 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_163_247 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_163_163 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_17, heap_bh6_w52_17_d1, heap_bh6_w52_17_d2 :  std_logic;
signal heap_bh6_w53_15, heap_bh6_w53_15_d1, heap_bh6_w53_15_d2, heap_bh6_w53_15_d3 :  std_logic;
signal heap_bh6_w54_16, heap_bh6_w54_16_d1, heap_bh6_w54_16_d2, heap_bh6_w54_16_d3 :  std_logic;
signal CompressorIn_bh6_164_248 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_164_249 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_164_164 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_8, heap_bh6_w59_8_d1 :  std_logic;
signal heap_bh6_w60_6, heap_bh6_w60_6_d1, heap_bh6_w60_6_d2, heap_bh6_w60_6_d3, heap_bh6_w60_6_d4 :  std_logic;
signal heap_bh6_w61_7, heap_bh6_w61_7_d1, heap_bh6_w61_7_d2, heap_bh6_w61_7_d3, heap_bh6_w61_7_d4 :  std_logic;
signal CompressorIn_bh6_165_250 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_165_251 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_165_165 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_8, heap_bh6_w61_8_d1, heap_bh6_w61_8_d2, heap_bh6_w61_8_d3, heap_bh6_w61_8_d4 :  std_logic;
signal heap_bh6_w62_6, heap_bh6_w62_6_d1, heap_bh6_w62_6_d2, heap_bh6_w62_6_d3, heap_bh6_w62_6_d4 :  std_logic;
signal heap_bh6_w63_7, heap_bh6_w63_7_d1, heap_bh6_w63_7_d2, heap_bh6_w63_7_d3, heap_bh6_w63_7_d4 :  std_logic;
signal CompressorIn_bh6_166_252 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_166_253 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_166_166 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_8, heap_bh6_w63_8_d1, heap_bh6_w63_8_d2, heap_bh6_w63_8_d3, heap_bh6_w63_8_d4 :  std_logic;
signal heap_bh6_w64_6, heap_bh6_w64_6_d1, heap_bh6_w64_6_d2, heap_bh6_w64_6_d3, heap_bh6_w64_6_d4 :  std_logic;
signal heap_bh6_w65_7, heap_bh6_w65_7_d1, heap_bh6_w65_7_d2, heap_bh6_w65_7_d3, heap_bh6_w65_7_d4 :  std_logic;
signal CompressorIn_bh6_167_254 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_167_255 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_167_167 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_8, heap_bh6_w65_8_d1, heap_bh6_w65_8_d2, heap_bh6_w65_8_d3, heap_bh6_w65_8_d4 :  std_logic;
signal heap_bh6_w66_6, heap_bh6_w66_6_d1, heap_bh6_w66_6_d2, heap_bh6_w66_6_d3, heap_bh6_w66_6_d4 :  std_logic;
signal heap_bh6_w67_7, heap_bh6_w67_7_d1, heap_bh6_w67_7_d2, heap_bh6_w67_7_d3, heap_bh6_w67_7_d4 :  std_logic;
signal CompressorIn_bh6_168_256 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_168_257 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_168_168 :  std_logic_vector(2 downto 0);
signal heap_bh6_w67_8, heap_bh6_w67_8_d1, heap_bh6_w67_8_d2, heap_bh6_w67_8_d3, heap_bh6_w67_8_d4 :  std_logic;
signal heap_bh6_w68_6, heap_bh6_w68_6_d1, heap_bh6_w68_6_d2, heap_bh6_w68_6_d3, heap_bh6_w68_6_d4 :  std_logic;
signal heap_bh6_w69_7, heap_bh6_w69_7_d1, heap_bh6_w69_7_d2, heap_bh6_w69_7_d3, heap_bh6_w69_7_d4 :  std_logic;
signal CompressorIn_bh6_169_258 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_169_259 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_169_169 :  std_logic_vector(2 downto 0);
signal heap_bh6_w69_8, heap_bh6_w69_8_d1, heap_bh6_w69_8_d2, heap_bh6_w69_8_d3, heap_bh6_w69_8_d4 :  std_logic;
signal heap_bh6_w70_6, heap_bh6_w70_6_d1, heap_bh6_w70_6_d2, heap_bh6_w70_6_d3, heap_bh6_w70_6_d4 :  std_logic;
signal heap_bh6_w71_7, heap_bh6_w71_7_d1, heap_bh6_w71_7_d2, heap_bh6_w71_7_d3, heap_bh6_w71_7_d4 :  std_logic;
signal CompressorIn_bh6_170_260 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_170_261 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_170_170 :  std_logic_vector(2 downto 0);
signal heap_bh6_w71_8, heap_bh6_w71_8_d1, heap_bh6_w71_8_d2, heap_bh6_w71_8_d3, heap_bh6_w71_8_d4 :  std_logic;
signal heap_bh6_w72_4, heap_bh6_w72_4_d1, heap_bh6_w72_4_d2, heap_bh6_w72_4_d3, heap_bh6_w72_4_d4 :  std_logic;
signal heap_bh6_w73_5, heap_bh6_w73_5_d1 :  std_logic;
signal CompressorIn_bh6_171_262 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_171_263 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_171_171 :  std_logic_vector(2 downto 0);
signal heap_bh6_w83_3, heap_bh6_w83_3_d1, heap_bh6_w83_3_d2, heap_bh6_w83_3_d3, heap_bh6_w83_3_d4 :  std_logic;
signal heap_bh6_w84_2, heap_bh6_w84_2_d1, heap_bh6_w84_2_d2, heap_bh6_w84_2_d3, heap_bh6_w84_2_d4 :  std_logic;
signal heap_bh6_w85_2, heap_bh6_w85_2_d1 :  std_logic;
signal CompressorIn_bh6_172_264 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_172_172 :  std_logic_vector(1 downto 0);
signal heap_bh6_w35_16, heap_bh6_w35_16_d1 :  std_logic;
signal heap_bh6_w36_18, heap_bh6_w36_18_d1 :  std_logic;
signal CompressorIn_bh6_173_265 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_173_173 :  std_logic_vector(1 downto 0);
signal heap_bh6_w54_17, heap_bh6_w54_17_d1, heap_bh6_w54_17_d2, heap_bh6_w54_17_d3 :  std_logic;
signal heap_bh6_w55_11, heap_bh6_w55_11_d1, heap_bh6_w55_11_d2, heap_bh6_w55_11_d3 :  std_logic;
signal CompressorIn_bh6_174_266 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_174_267 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_174_174 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_13, heap_bh6_w22_13_d1, heap_bh6_w22_13_d2, heap_bh6_w22_13_d3 :  std_logic;
signal heap_bh6_w23_13, heap_bh6_w23_13_d1, heap_bh6_w23_13_d2, heap_bh6_w23_13_d3 :  std_logic;
signal heap_bh6_w24_15 :  std_logic;
signal CompressorIn_bh6_175_268 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_175_269 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_175_175 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_17, heap_bh6_w34_17_d1, heap_bh6_w34_17_d2, heap_bh6_w34_17_d3 :  std_logic;
signal heap_bh6_w35_17, heap_bh6_w35_17_d1, heap_bh6_w35_17_d2, heap_bh6_w35_17_d3 :  std_logic;
signal heap_bh6_w36_19 :  std_logic;
signal CompressorIn_bh6_176_270 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_176_271 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_176_176 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_16 :  std_logic;
signal heap_bh6_w38_19, heap_bh6_w38_19_d1, heap_bh6_w38_19_d2, heap_bh6_w38_19_d3 :  std_logic;
signal heap_bh6_w39_17 :  std_logic;
signal CompressorIn_bh6_177_272 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_177_273 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_177_177 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_11, heap_bh6_w56_11_d1, heap_bh6_w56_11_d2 :  std_logic;
signal heap_bh6_w57_10, heap_bh6_w57_10_d1, heap_bh6_w57_10_d2, heap_bh6_w57_10_d3 :  std_logic;
signal heap_bh6_w58_8, heap_bh6_w58_8_d1, heap_bh6_w58_8_d2, heap_bh6_w58_8_d3 :  std_logic;
signal CompressorIn_bh6_178_274 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_178_275 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_178_178 :  std_logic_vector(2 downto 0);
signal heap_bh6_w58_9, heap_bh6_w58_9_d1, heap_bh6_w58_9_d2, heap_bh6_w58_9_d3 :  std_logic;
signal heap_bh6_w59_9, heap_bh6_w59_9_d1, heap_bh6_w59_9_d2, heap_bh6_w59_9_d3 :  std_logic;
signal heap_bh6_w60_7, heap_bh6_w60_7_d1, heap_bh6_w60_7_d2, heap_bh6_w60_7_d3 :  std_logic;
signal CompressorIn_bh6_179_276 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_179_277 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_179_179 :  std_logic_vector(2 downto 0);
signal heap_bh6_w73_6, heap_bh6_w73_6_d1, heap_bh6_w73_6_d2, heap_bh6_w73_6_d3 :  std_logic;
signal heap_bh6_w74_4, heap_bh6_w74_4_d1, heap_bh6_w74_4_d2, heap_bh6_w74_4_d3 :  std_logic;
signal heap_bh6_w75_5 :  std_logic;
signal CompressorIn_bh6_180_278 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_180_279 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_180_180 :  std_logic_vector(2 downto 0);
signal heap_bh6_w85_3, heap_bh6_w85_3_d1, heap_bh6_w85_3_d2, heap_bh6_w85_3_d3 :  std_logic;
signal heap_bh6_w86_2, heap_bh6_w86_2_d1, heap_bh6_w86_2_d2, heap_bh6_w86_2_d3 :  std_logic;
signal heap_bh6_w87_2 :  std_logic;
signal CompressorIn_bh6_181_280 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_181_281 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_181_181 :  std_logic_vector(2 downto 0);
signal heap_bh6_w13_13, heap_bh6_w13_13_d1, heap_bh6_w13_13_d2, heap_bh6_w13_13_d3 :  std_logic;
signal heap_bh6_w14_14, heap_bh6_w14_14_d1, heap_bh6_w14_14_d2, heap_bh6_w14_14_d3 :  std_logic;
signal heap_bh6_w15_14, heap_bh6_w15_14_d1, heap_bh6_w15_14_d2, heap_bh6_w15_14_d3 :  std_logic;
signal CompressorIn_bh6_182_282 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_182_283 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_182_182 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_13, heap_bh6_w16_13_d1, heap_bh6_w16_13_d2, heap_bh6_w16_13_d3 :  std_logic;
signal heap_bh6_w17_14, heap_bh6_w17_14_d1, heap_bh6_w17_14_d2, heap_bh6_w17_14_d3 :  std_logic;
signal heap_bh6_w18_14, heap_bh6_w18_14_d1, heap_bh6_w18_14_d2, heap_bh6_w18_14_d3 :  std_logic;
signal CompressorIn_bh6_183_284 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_183_285 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_183_183 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_13, heap_bh6_w19_13_d1, heap_bh6_w19_13_d2, heap_bh6_w19_13_d3 :  std_logic;
signal heap_bh6_w20_14, heap_bh6_w20_14_d1, heap_bh6_w20_14_d2, heap_bh6_w20_14_d3 :  std_logic;
signal heap_bh6_w21_14, heap_bh6_w21_14_d1, heap_bh6_w21_14_d2, heap_bh6_w21_14_d3 :  std_logic;
signal CompressorIn_bh6_184_286 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_184_287 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_184_184 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_15, heap_bh6_w32_15_d1, heap_bh6_w32_15_d2, heap_bh6_w32_15_d3 :  std_logic;
signal heap_bh6_w33_18, heap_bh6_w33_18_d1, heap_bh6_w33_18_d2, heap_bh6_w33_18_d3 :  std_logic;
signal heap_bh6_w34_18, heap_bh6_w34_18_d1, heap_bh6_w34_18_d2, heap_bh6_w34_18_d3 :  std_logic;
signal CompressorIn_bh6_185_288 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_185_289 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_185_185 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_16, heap_bh6_w24_16_d1, heap_bh6_w24_16_d2, heap_bh6_w24_16_d3 :  std_logic;
signal heap_bh6_w25_14, heap_bh6_w25_14_d1, heap_bh6_w25_14_d2, heap_bh6_w25_14_d3 :  std_logic;
signal heap_bh6_w26_15, heap_bh6_w26_15_d1, heap_bh6_w26_15_d2, heap_bh6_w26_15_d3 :  std_logic;
signal CompressorIn_bh6_186_290 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_186_291 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_186_186 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_18, heap_bh6_w39_18_d1, heap_bh6_w39_18_d2, heap_bh6_w39_18_d3 :  std_logic;
signal heap_bh6_w40_18, heap_bh6_w40_18_d1, heap_bh6_w40_18_d2, heap_bh6_w40_18_d3 :  std_logic;
signal heap_bh6_w41_18 :  std_logic;
signal CompressorIn_bh6_187_292 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_187_293 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_187_187 :  std_logic_vector(2 downto 0);
signal heap_bh6_w75_6, heap_bh6_w75_6_d1, heap_bh6_w75_6_d2, heap_bh6_w75_6_d3 :  std_logic;
signal heap_bh6_w76_4, heap_bh6_w76_4_d1, heap_bh6_w76_4_d2, heap_bh6_w76_4_d3 :  std_logic;
signal heap_bh6_w77_5 :  std_logic;
signal CompressorIn_bh6_188_294 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_188_295 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_188_188 :  std_logic_vector(2 downto 0);
signal heap_bh6_w87_3, heap_bh6_w87_3_d1, heap_bh6_w87_3_d2, heap_bh6_w87_3_d3 :  std_logic;
signal heap_bh6_w88_2, heap_bh6_w88_2_d1, heap_bh6_w88_2_d2, heap_bh6_w88_2_d3 :  std_logic;
signal heap_bh6_w89_1, heap_bh6_w89_1_d1, heap_bh6_w89_1_d2, heap_bh6_w89_1_d3 :  std_logic;
signal CompressorIn_bh6_189_296 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_189_297 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_189_189 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_20, heap_bh6_w36_20_d1, heap_bh6_w36_20_d2, heap_bh6_w36_20_d3 :  std_logic;
signal heap_bh6_w37_17, heap_bh6_w37_17_d1, heap_bh6_w37_17_d2, heap_bh6_w37_17_d3 :  std_logic;
signal heap_bh6_w38_20, heap_bh6_w38_20_d1, heap_bh6_w38_20_d2, heap_bh6_w38_20_d3 :  std_logic;
signal CompressorIn_bh6_190_298 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_190_299 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_190_190 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_19, heap_bh6_w41_19_d1, heap_bh6_w41_19_d2, heap_bh6_w41_19_d3 :  std_logic;
signal heap_bh6_w42_20, heap_bh6_w42_20_d1, heap_bh6_w42_20_d2, heap_bh6_w42_20_d3 :  std_logic;
signal heap_bh6_w43_16 :  std_logic;
signal CompressorIn_bh6_191_300 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_191_301 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_191_191 :  std_logic_vector(2 downto 0);
signal heap_bh6_w77_6, heap_bh6_w77_6_d1, heap_bh6_w77_6_d2, heap_bh6_w77_6_d3 :  std_logic;
signal heap_bh6_w78_4, heap_bh6_w78_4_d1, heap_bh6_w78_4_d2, heap_bh6_w78_4_d3 :  std_logic;
signal heap_bh6_w79_5 :  std_logic;
signal CompressorIn_bh6_192_302 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_192_303 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_192_192 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_17, heap_bh6_w43_17_d1, heap_bh6_w43_17_d2, heap_bh6_w43_17_d3 :  std_logic;
signal heap_bh6_w44_20, heap_bh6_w44_20_d1, heap_bh6_w44_20_d2, heap_bh6_w44_20_d3 :  std_logic;
signal heap_bh6_w45_18, heap_bh6_w45_18_d1 :  std_logic;
signal CompressorIn_bh6_193_304 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_193_305 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_193_193 :  std_logic_vector(2 downto 0);
signal heap_bh6_w79_6, heap_bh6_w79_6_d1, heap_bh6_w79_6_d2, heap_bh6_w79_6_d3 :  std_logic;
signal heap_bh6_w80_4, heap_bh6_w80_4_d1, heap_bh6_w80_4_d2, heap_bh6_w80_4_d3 :  std_logic;
signal heap_bh6_w81_5, heap_bh6_w81_5_d1 :  std_logic;
signal CompressorIn_bh6_194_306 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_194_307 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_194_194 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_19, heap_bh6_w45_19_d1, heap_bh6_w45_19_d2 :  std_logic;
signal heap_bh6_w46_18, heap_bh6_w46_18_d1, heap_bh6_w46_18_d2 :  std_logic;
signal heap_bh6_w47_18 :  std_logic;
signal CompressorIn_bh6_195_308 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_195_309 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_195_195 :  std_logic_vector(2 downto 0);
signal heap_bh6_w81_6, heap_bh6_w81_6_d1, heap_bh6_w81_6_d2 :  std_logic;
signal heap_bh6_w82_3, heap_bh6_w82_3_d1, heap_bh6_w82_3_d2 :  std_logic;
signal heap_bh6_w83_4, heap_bh6_w83_4_d1, heap_bh6_w83_4_d2 :  std_logic;
signal CompressorIn_bh6_196_310 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_196_311 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_196_196 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_19, heap_bh6_w47_19_d1, heap_bh6_w47_19_d2 :  std_logic;
signal heap_bh6_w48_20, heap_bh6_w48_20_d1, heap_bh6_w48_20_d2 :  std_logic;
signal heap_bh6_w49_16 :  std_logic;
signal CompressorIn_bh6_197_312 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_197_313 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_197_197 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_17, heap_bh6_w49_17_d1, heap_bh6_w49_17_d2 :  std_logic;
signal heap_bh6_w50_20, heap_bh6_w50_20_d1, heap_bh6_w50_20_d2 :  std_logic;
signal heap_bh6_w51_18 :  std_logic;
signal CompressorIn_bh6_198_314 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_198_315 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_198_198 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_19, heap_bh6_w51_19_d1, heap_bh6_w51_19_d2 :  std_logic;
signal heap_bh6_w52_18, heap_bh6_w52_18_d1, heap_bh6_w52_18_d2 :  std_logic;
signal heap_bh6_w53_16, heap_bh6_w53_16_d1 :  std_logic;
signal CompressorIn_bh6_199_316 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_199_317 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_199_199 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_17, heap_bh6_w53_17_d1 :  std_logic;
signal heap_bh6_w54_18, heap_bh6_w54_18_d1 :  std_logic;
signal heap_bh6_w55_12 :  std_logic;
signal CompressorIn_bh6_200_318 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_200_319 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_200_200 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_13, heap_bh6_w55_13_d1 :  std_logic;
signal heap_bh6_w56_12, heap_bh6_w56_12_d1 :  std_logic;
signal heap_bh6_w57_11, heap_bh6_w57_11_d1 :  std_logic;
signal finalAdderIn0_bh6 :  std_logic_vector(103 downto 0);
signal finalAdderIn1_bh6 :  std_logic_vector(103 downto 0);
signal finalAdderCin_bh6 :  std_logic;
signal finalAdderOut_bh6 :  std_logic_vector(103 downto 0);
signal CompressionResult6 :  std_logic_vector(106 downto 0);
attribute rom_extract: string;
attribute rom_style: string;
attribute rom_extract of SmallMultTableP3x3r6XuYu_F700_uid109: component is "yes";
attribute rom_extract of SmallMultTableP3x3r6XuYu_F700_uid128: component is "yes";
attribute rom_extract of SmallMultTableP3x3r6XuYu_F700_uid36: component is "yes";
attribute rom_extract of SmallMultTableP3x3r6XuYu_F700_uid63: component is "yes";
attribute rom_extract of SmallMultTableP3x3r6XuYu_F700_uid90: component is "yes";
attribute rom_extract of SmallMultTableP3x3r6XuYu_F700_uid9: component is "yes";
attribute rom_style of SmallMultTableP3x3r6XuYu_F700_uid109: component is "distributed";
attribute rom_style of SmallMultTableP3x3r6XuYu_F700_uid128: component is "distributed";
attribute rom_style of SmallMultTableP3x3r6XuYu_F700_uid36: component is "distributed";
attribute rom_style of SmallMultTableP3x3r6XuYu_F700_uid63: component is "distributed";
attribute rom_style of SmallMultTableP3x3r6XuYu_F700_uid90: component is "distributed";
attribute rom_style of SmallMultTableP3x3r6XuYu_F700_uid9: component is "distributed";
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            heap_bh6_w56_0_d1 <=  heap_bh6_w56_0;
            heap_bh6_w57_0_d1 <=  heap_bh6_w57_0;
            heap_bh6_w3_0_d1 <=  heap_bh6_w3_0;
            heap_bh6_w3_0_d2 <=  heap_bh6_w3_0_d1;
            heap_bh6_w3_0_d3 <=  heap_bh6_w3_0_d2;
            heap_bh6_w3_0_d4 <=  heap_bh6_w3_0_d3;
            heap_bh6_w3_0_d5 <=  heap_bh6_w3_0_d4;
            heap_bh6_w31_4_d1 <=  heap_bh6_w31_4;
            heap_bh6_w34_4_d1 <=  heap_bh6_w34_4;
            heap_bh6_w9_3_d1 <=  heap_bh6_w9_3;
            heap_bh6_w12_3_d1 <=  heap_bh6_w12_3;
            heap_bh6_w15_3_d1 <=  heap_bh6_w15_3;
            heap_bh6_w18_3_d1 <=  heap_bh6_w18_3;
            heap_bh6_w25_4_d1 <=  heap_bh6_w25_4;
            heap_bh6_w28_4_d1 <=  heap_bh6_w28_4;
            DSP_bh6_ch0_0_d1 <=  DSP_bh6_ch0_0;
            heap_bh6_w105_0_d1 <=  heap_bh6_w105_0;
            heap_bh6_w105_0_d2 <=  heap_bh6_w105_0_d1;
            heap_bh6_w105_0_d3 <=  heap_bh6_w105_0_d2;
            heap_bh6_w105_0_d4 <=  heap_bh6_w105_0_d3;
            heap_bh6_w104_0_d1 <=  heap_bh6_w104_0;
            heap_bh6_w104_0_d2 <=  heap_bh6_w104_0_d1;
            heap_bh6_w104_0_d3 <=  heap_bh6_w104_0_d2;
            heap_bh6_w104_0_d4 <=  heap_bh6_w104_0_d3;
            heap_bh6_w103_0_d1 <=  heap_bh6_w103_0;
            heap_bh6_w103_0_d2 <=  heap_bh6_w103_0_d1;
            heap_bh6_w103_0_d3 <=  heap_bh6_w103_0_d2;
            heap_bh6_w103_0_d4 <=  heap_bh6_w103_0_d3;
            heap_bh6_w102_0_d1 <=  heap_bh6_w102_0;
            heap_bh6_w102_0_d2 <=  heap_bh6_w102_0_d1;
            heap_bh6_w102_0_d3 <=  heap_bh6_w102_0_d2;
            heap_bh6_w102_0_d4 <=  heap_bh6_w102_0_d3;
            heap_bh6_w101_0_d1 <=  heap_bh6_w101_0;
            heap_bh6_w101_0_d2 <=  heap_bh6_w101_0_d1;
            heap_bh6_w101_0_d3 <=  heap_bh6_w101_0_d2;
            heap_bh6_w101_0_d4 <=  heap_bh6_w101_0_d3;
            heap_bh6_w100_0_d1 <=  heap_bh6_w100_0;
            heap_bh6_w100_0_d2 <=  heap_bh6_w100_0_d1;
            heap_bh6_w100_0_d3 <=  heap_bh6_w100_0_d2;
            heap_bh6_w100_0_d4 <=  heap_bh6_w100_0_d3;
            heap_bh6_w99_0_d1 <=  heap_bh6_w99_0;
            heap_bh6_w99_0_d2 <=  heap_bh6_w99_0_d1;
            heap_bh6_w99_0_d3 <=  heap_bh6_w99_0_d2;
            heap_bh6_w99_0_d4 <=  heap_bh6_w99_0_d3;
            heap_bh6_w98_0_d1 <=  heap_bh6_w98_0;
            heap_bh6_w98_0_d2 <=  heap_bh6_w98_0_d1;
            heap_bh6_w98_0_d3 <=  heap_bh6_w98_0_d2;
            heap_bh6_w98_0_d4 <=  heap_bh6_w98_0_d3;
            heap_bh6_w97_0_d1 <=  heap_bh6_w97_0;
            heap_bh6_w97_0_d2 <=  heap_bh6_w97_0_d1;
            heap_bh6_w97_0_d3 <=  heap_bh6_w97_0_d2;
            heap_bh6_w97_0_d4 <=  heap_bh6_w97_0_d3;
            heap_bh6_w96_0_d1 <=  heap_bh6_w96_0;
            heap_bh6_w96_0_d2 <=  heap_bh6_w96_0_d1;
            heap_bh6_w96_0_d3 <=  heap_bh6_w96_0_d2;
            heap_bh6_w96_0_d4 <=  heap_bh6_w96_0_d3;
            heap_bh6_w95_0_d1 <=  heap_bh6_w95_0;
            heap_bh6_w95_0_d2 <=  heap_bh6_w95_0_d1;
            heap_bh6_w95_0_d3 <=  heap_bh6_w95_0_d2;
            heap_bh6_w95_0_d4 <=  heap_bh6_w95_0_d3;
            heap_bh6_w94_0_d1 <=  heap_bh6_w94_0;
            heap_bh6_w94_0_d2 <=  heap_bh6_w94_0_d1;
            heap_bh6_w94_0_d3 <=  heap_bh6_w94_0_d2;
            heap_bh6_w94_0_d4 <=  heap_bh6_w94_0_d3;
            heap_bh6_w93_0_d1 <=  heap_bh6_w93_0;
            heap_bh6_w93_0_d2 <=  heap_bh6_w93_0_d1;
            heap_bh6_w93_0_d3 <=  heap_bh6_w93_0_d2;
            heap_bh6_w93_0_d4 <=  heap_bh6_w93_0_d3;
            heap_bh6_w92_0_d1 <=  heap_bh6_w92_0;
            heap_bh6_w92_0_d2 <=  heap_bh6_w92_0_d1;
            heap_bh6_w92_0_d3 <=  heap_bh6_w92_0_d2;
            heap_bh6_w92_0_d4 <=  heap_bh6_w92_0_d3;
            heap_bh6_w91_0_d1 <=  heap_bh6_w91_0;
            heap_bh6_w91_0_d2 <=  heap_bh6_w91_0_d1;
            heap_bh6_w91_0_d3 <=  heap_bh6_w91_0_d2;
            heap_bh6_w91_0_d4 <=  heap_bh6_w91_0_d3;
            heap_bh6_w90_0_d1 <=  heap_bh6_w90_0;
            heap_bh6_w90_0_d2 <=  heap_bh6_w90_0_d1;
            heap_bh6_w90_0_d3 <=  heap_bh6_w90_0_d2;
            heap_bh6_w90_0_d4 <=  heap_bh6_w90_0_d3;
            heap_bh6_w89_0_d1 <=  heap_bh6_w89_0;
            heap_bh6_w89_0_d2 <=  heap_bh6_w89_0_d1;
            heap_bh6_w89_0_d3 <=  heap_bh6_w89_0_d2;
            heap_bh6_w89_0_d4 <=  heap_bh6_w89_0_d3;
            heap_bh6_w88_0_d1 <=  heap_bh6_w88_0;
            heap_bh6_w87_0_d1 <=  heap_bh6_w87_0;
            heap_bh6_w86_0_d1 <=  heap_bh6_w86_0;
            heap_bh6_w85_0_d1 <=  heap_bh6_w85_0;
            heap_bh6_w80_0_d1 <=  heap_bh6_w80_0;
            heap_bh6_w78_0_d1 <=  heap_bh6_w78_0;
            heap_bh6_w76_0_d1 <=  heap_bh6_w76_0;
            heap_bh6_w74_0_d1 <=  heap_bh6_w74_0;
            DSP_bh6_ch1_0_d1 <=  DSP_bh6_ch1_0;
            DSP_bh6_ch2_0_d1 <=  DSP_bh6_ch2_0;
            heap_bh6_w88_1_d1 <=  heap_bh6_w88_1;
            heap_bh6_w87_1_d1 <=  heap_bh6_w87_1;
            heap_bh6_w86_1_d1 <=  heap_bh6_w86_1;
            heap_bh6_w85_1_d1 <=  heap_bh6_w85_1;
            DSP_bh6_ch3_0_d1 <=  DSP_bh6_ch3_0;
            DSP_bh6_ch4_0_d1 <=  DSP_bh6_ch4_0;
            DSP_bh6_ch5_0_d1 <=  DSP_bh6_ch5_0;
            heap_bh6_w22_5_d1 <=  heap_bh6_w22_5;
            heap_bh6_w8_6_d1 <=  heap_bh6_w8_6;
            heap_bh6_w8_6_d2 <=  heap_bh6_w8_6_d1;
            heap_bh6_w8_6_d3 <=  heap_bh6_w8_6_d2;
            heap_bh6_w8_6_d4 <=  heap_bh6_w8_6_d3;
            tempR_bh6_0_d1 <=  tempR_bh6_0;
            tempR_bh6_0_d2 <=  tempR_bh6_0_d1;
            tempR_bh6_0_d3 <=  tempR_bh6_0_d2;
            tempR_bh6_0_d4 <=  tempR_bh6_0_d3;
            tempR_bh6_0_d5 <=  tempR_bh6_0_d4;
            tempR_bh6_0_d6 <=  tempR_bh6_0_d5;
            tempR_bh6_0_d7 <=  tempR_bh6_0_d6;
            tempR_bh6_0_d8 <=  tempR_bh6_0_d7;
            heap_bh6_w8_7_d1 <=  heap_bh6_w8_7;
            heap_bh6_w9_6_d1 <=  heap_bh6_w9_6;
            heap_bh6_w10_6_d1 <=  heap_bh6_w10_6;
            heap_bh6_w11_7_d1 <=  heap_bh6_w11_7;
            heap_bh6_w12_6_d1 <=  heap_bh6_w12_6;
            heap_bh6_w13_6_d1 <=  heap_bh6_w13_6;
            heap_bh6_w14_7_d1 <=  heap_bh6_w14_7;
            heap_bh6_w15_6_d1 <=  heap_bh6_w15_6;
            heap_bh6_w16_6_d1 <=  heap_bh6_w16_6;
            heap_bh6_w17_7_d1 <=  heap_bh6_w17_7;
            heap_bh6_w18_6_d1 <=  heap_bh6_w18_6;
            heap_bh6_w19_6_d1 <=  heap_bh6_w19_6;
            heap_bh6_w20_7_d1 <=  heap_bh6_w20_7;
            heap_bh6_w21_7_d1 <=  heap_bh6_w21_7;
            heap_bh6_w22_6_d1 <=  heap_bh6_w22_6;
            heap_bh6_w21_8_d1 <=  heap_bh6_w21_8;
            heap_bh6_w22_7_d1 <=  heap_bh6_w22_7;
            heap_bh6_w23_7_d1 <=  heap_bh6_w23_7;
            heap_bh6_w23_8_d1 <=  heap_bh6_w23_8;
            heap_bh6_w24_8_d1 <=  heap_bh6_w24_8;
            heap_bh6_w25_7_d1 <=  heap_bh6_w25_7;
            heap_bh6_w24_9_d1 <=  heap_bh6_w24_9;
            heap_bh6_w25_8_d1 <=  heap_bh6_w25_8;
            heap_bh6_w26_7_d1 <=  heap_bh6_w26_7;
            heap_bh6_w27_8_d1 <=  heap_bh6_w27_8;
            heap_bh6_w28_7_d1 <=  heap_bh6_w28_7;
            heap_bh6_w29_7_d1 <=  heap_bh6_w29_7;
            heap_bh6_w30_8_d1 <=  heap_bh6_w30_8;
            heap_bh6_w31_8_d1 <=  heap_bh6_w31_8;
            heap_bh6_w32_8_d1 <=  heap_bh6_w32_8;
            heap_bh6_w33_9_d1 <=  heap_bh6_w33_9;
            heap_bh6_w34_8_d1 <=  heap_bh6_w34_8;
            heap_bh6_w35_8_d1 <=  heap_bh6_w35_8;
            heap_bh6_w36_9_d1 <=  heap_bh6_w36_9;
            heap_bh6_w37_8_d1 <=  heap_bh6_w37_8;
            heap_bh6_w38_9_d1 <=  heap_bh6_w38_9;
            heap_bh6_w38_10_d1 <=  heap_bh6_w38_10;
            heap_bh6_w39_9_d1 <=  heap_bh6_w39_9;
            heap_bh6_w40_8_d1 <=  heap_bh6_w40_8;
            heap_bh6_w39_10_d1 <=  heap_bh6_w39_10;
            heap_bh6_w40_9_d1 <=  heap_bh6_w40_9;
            heap_bh6_w41_10_d1 <=  heap_bh6_w41_10;
            heap_bh6_w41_11_d1 <=  heap_bh6_w41_11;
            heap_bh6_w42_10_d1 <=  heap_bh6_w42_10;
            heap_bh6_w43_8_d1 <=  heap_bh6_w43_8;
            heap_bh6_w42_11_d1 <=  heap_bh6_w42_11;
            heap_bh6_w43_9_d1 <=  heap_bh6_w43_9;
            heap_bh6_w44_10_d1 <=  heap_bh6_w44_10;
            heap_bh6_w44_11_d1 <=  heap_bh6_w44_11;
            heap_bh6_w45_10_d1 <=  heap_bh6_w45_10;
            heap_bh6_w46_8_d1 <=  heap_bh6_w46_8;
            heap_bh6_w45_11_d1 <=  heap_bh6_w45_11;
            heap_bh6_w46_9_d1 <=  heap_bh6_w46_9;
            heap_bh6_w47_10_d1 <=  heap_bh6_w47_10;
            heap_bh6_w47_11_d1 <=  heap_bh6_w47_11;
            heap_bh6_w48_10_d1 <=  heap_bh6_w48_10;
            heap_bh6_w49_8_d1 <=  heap_bh6_w49_8;
            heap_bh6_w48_11_d1 <=  heap_bh6_w48_11;
            heap_bh6_w49_9_d1 <=  heap_bh6_w49_9;
            heap_bh6_w50_10_d1 <=  heap_bh6_w50_10;
            heap_bh6_w50_11_d1 <=  heap_bh6_w50_11;
            heap_bh6_w51_10_d1 <=  heap_bh6_w51_10;
            heap_bh6_w52_8_d1 <=  heap_bh6_w52_8;
            heap_bh6_w51_11_d1 <=  heap_bh6_w51_11;
            heap_bh6_w52_9_d1 <=  heap_bh6_w52_9;
            heap_bh6_w53_8_d1 <=  heap_bh6_w53_8;
            heap_bh6_w4_4_d1 <=  heap_bh6_w4_4;
            heap_bh6_w4_4_d2 <=  heap_bh6_w4_4_d1;
            heap_bh6_w4_4_d3 <=  heap_bh6_w4_4_d2;
            heap_bh6_w4_4_d4 <=  heap_bh6_w4_4_d3;
            heap_bh6_w4_4_d5 <=  heap_bh6_w4_4_d4;
            heap_bh6_w5_5_d1 <=  heap_bh6_w5_5;
            heap_bh6_w5_5_d2 <=  heap_bh6_w5_5_d1;
            heap_bh6_w5_5_d3 <=  heap_bh6_w5_5_d2;
            heap_bh6_w5_5_d4 <=  heap_bh6_w5_5_d3;
            heap_bh6_w5_5_d5 <=  heap_bh6_w5_5_d4;
            heap_bh6_w6_5_d1 <=  heap_bh6_w6_5;
            heap_bh6_w5_6_d1 <=  heap_bh6_w5_6;
            heap_bh6_w5_6_d2 <=  heap_bh6_w5_6_d1;
            heap_bh6_w5_6_d3 <=  heap_bh6_w5_6_d2;
            heap_bh6_w5_6_d4 <=  heap_bh6_w5_6_d3;
            heap_bh6_w5_6_d5 <=  heap_bh6_w5_6_d4;
            heap_bh6_w6_6_d1 <=  heap_bh6_w6_6;
            heap_bh6_w7_6_d1 <=  heap_bh6_w7_6;
            heap_bh6_w6_7_d1 <=  heap_bh6_w6_7;
            heap_bh6_w7_7_d1 <=  heap_bh6_w7_7;
            heap_bh6_w8_8_d1 <=  heap_bh6_w8_8;
            heap_bh6_w9_7_d1 <=  heap_bh6_w9_7;
            heap_bh6_w10_7_d1 <=  heap_bh6_w10_7;
            heap_bh6_w11_8_d1 <=  heap_bh6_w11_8;
            heap_bh6_w12_7_d1 <=  heap_bh6_w12_7;
            heap_bh6_w13_7_d1 <=  heap_bh6_w13_7;
            heap_bh6_w14_8_d1 <=  heap_bh6_w14_8;
            heap_bh6_w15_7_d1 <=  heap_bh6_w15_7;
            heap_bh6_w16_7_d1 <=  heap_bh6_w16_7;
            heap_bh6_w17_8_d1 <=  heap_bh6_w17_8;
            heap_bh6_w18_7_d1 <=  heap_bh6_w18_7;
            heap_bh6_w19_7_d1 <=  heap_bh6_w19_7;
            heap_bh6_w20_8_d1 <=  heap_bh6_w20_8;
            heap_bh6_w25_9_d1 <=  heap_bh6_w25_9;
            heap_bh6_w26_8_d1 <=  heap_bh6_w26_8;
            heap_bh6_w27_9_d1 <=  heap_bh6_w27_9;
            heap_bh6_w28_8_d1 <=  heap_bh6_w28_8;
            heap_bh6_w29_8_d1 <=  heap_bh6_w29_8;
            heap_bh6_w30_9_d1 <=  heap_bh6_w30_9;
            heap_bh6_w31_9_d1 <=  heap_bh6_w31_9;
            heap_bh6_w32_9_d1 <=  heap_bh6_w32_9;
            heap_bh6_w33_10_d1 <=  heap_bh6_w33_10;
            heap_bh6_w34_9_d1 <=  heap_bh6_w34_9;
            heap_bh6_w35_9_d1 <=  heap_bh6_w35_9;
            heap_bh6_w36_10_d1 <=  heap_bh6_w36_10;
            heap_bh6_w52_10_d1 <=  heap_bh6_w52_10;
            heap_bh6_w53_9_d1 <=  heap_bh6_w53_9;
            heap_bh6_w54_8_d1 <=  heap_bh6_w54_8;
            heap_bh6_w54_9_d1 <=  heap_bh6_w54_9;
            heap_bh6_w55_5_d1 <=  heap_bh6_w55_5;
            heap_bh6_w56_5_d1 <=  heap_bh6_w56_5;
            heap_bh6_w22_8_d1 <=  heap_bh6_w22_8;
            heap_bh6_w23_9_d1 <=  heap_bh6_w23_9;
            heap_bh6_w24_10_d1 <=  heap_bh6_w24_10;
            heap_bh6_w37_9_d1 <=  heap_bh6_w37_9;
            heap_bh6_w38_11_d1 <=  heap_bh6_w38_11;
            heap_bh6_w39_11_d1 <=  heap_bh6_w39_11;
            heap_bh6_w40_10_d1 <=  heap_bh6_w40_10;
            heap_bh6_w41_12_d1 <=  heap_bh6_w41_12;
            heap_bh6_w42_12_d1 <=  heap_bh6_w42_12;
            heap_bh6_w7_8_d1 <=  heap_bh6_w7_8;
            heap_bh6_w8_9_d1 <=  heap_bh6_w8_9;
            heap_bh6_w9_8_d1 <=  heap_bh6_w9_8;
            heap_bh6_w10_8_d1 <=  heap_bh6_w10_8;
            heap_bh6_w11_9_d1 <=  heap_bh6_w11_9;
            heap_bh6_w12_8_d1 <=  heap_bh6_w12_8;
            heap_bh6_w13_8_d1 <=  heap_bh6_w13_8;
            heap_bh6_w14_9_d1 <=  heap_bh6_w14_9;
            heap_bh6_w15_8_d1 <=  heap_bh6_w15_8;
            heap_bh6_w16_8_d1 <=  heap_bh6_w16_8;
            heap_bh6_w17_9_d1 <=  heap_bh6_w17_9;
            heap_bh6_w18_8_d1 <=  heap_bh6_w18_8;
            heap_bh6_w19_8_d1 <=  heap_bh6_w19_8;
            heap_bh6_w20_9_d1 <=  heap_bh6_w20_9;
            heap_bh6_w21_9_d1 <=  heap_bh6_w21_9;
            heap_bh6_w26_9_d1 <=  heap_bh6_w26_9;
            heap_bh6_w27_10_d1 <=  heap_bh6_w27_10;
            heap_bh6_w28_9_d1 <=  heap_bh6_w28_9;
            heap_bh6_w29_9_d1 <=  heap_bh6_w29_9;
            heap_bh6_w30_10_d1 <=  heap_bh6_w30_10;
            heap_bh6_w31_10_d1 <=  heap_bh6_w31_10;
            heap_bh6_w32_10_d1 <=  heap_bh6_w32_10;
            heap_bh6_w33_11_d1 <=  heap_bh6_w33_11;
            heap_bh6_w34_10_d1 <=  heap_bh6_w34_10;
            heap_bh6_w35_10_d1 <=  heap_bh6_w35_10;
            heap_bh6_w36_11_d1 <=  heap_bh6_w36_11;
            heap_bh6_w37_10_d1 <=  heap_bh6_w37_10;
            heap_bh6_w43_10_d1 <=  heap_bh6_w43_10;
            heap_bh6_w44_12_d1 <=  heap_bh6_w44_12;
            heap_bh6_w45_12_d1 <=  heap_bh6_w45_12;
            heap_bh6_w46_10_d1 <=  heap_bh6_w46_10;
            heap_bh6_w47_12_d1 <=  heap_bh6_w47_12;
            heap_bh6_w48_12_d1 <=  heap_bh6_w48_12;
            heap_bh6_w49_10_d1 <=  heap_bh6_w49_10;
            heap_bh6_w50_12_d1 <=  heap_bh6_w50_12;
            heap_bh6_w51_12_d1 <=  heap_bh6_w51_12;
            heap_bh6_w3_3_d1 <=  heap_bh6_w3_3;
            heap_bh6_w3_3_d2 <=  heap_bh6_w3_3_d1;
            heap_bh6_w3_3_d3 <=  heap_bh6_w3_3_d2;
            heap_bh6_w3_3_d4 <=  heap_bh6_w3_3_d3;
            heap_bh6_w3_3_d5 <=  heap_bh6_w3_3_d4;
            heap_bh6_w4_5_d1 <=  heap_bh6_w4_5;
            heap_bh6_w4_5_d2 <=  heap_bh6_w4_5_d1;
            heap_bh6_w4_5_d3 <=  heap_bh6_w4_5_d2;
            heap_bh6_w4_5_d4 <=  heap_bh6_w4_5_d3;
            heap_bh6_w4_5_d5 <=  heap_bh6_w4_5_d4;
            heap_bh6_w53_10_d1 <=  heap_bh6_w53_10;
            heap_bh6_w54_10_d1 <=  heap_bh6_w54_10;
            tempR_bh6_1_d1 <=  tempR_bh6_1;
            tempR_bh6_1_d2 <=  tempR_bh6_1_d1;
            tempR_bh6_1_d3 <=  tempR_bh6_1_d2;
            tempR_bh6_1_d4 <=  tempR_bh6_1_d3;
            tempR_bh6_1_d5 <=  tempR_bh6_1_d4;
            tempR_bh6_1_d6 <=  tempR_bh6_1_d5;
            tempR_bh6_1_d7 <=  tempR_bh6_1_d6;
            tempR_bh6_1_d8 <=  tempR_bh6_1_d7;
            heap_bh6_w6_8_d1 <=  heap_bh6_w6_8;
            heap_bh6_w6_8_d2 <=  heap_bh6_w6_8_d1;
            heap_bh6_w6_8_d3 <=  heap_bh6_w6_8_d2;
            heap_bh6_w6_8_d4 <=  heap_bh6_w6_8_d3;
            heap_bh6_w32_12_d1 <=  heap_bh6_w32_12;
            heap_bh6_w34_13_d1 <=  heap_bh6_w34_13;
            heap_bh6_w37_12_d1 <=  heap_bh6_w37_12;
            heap_bh6_w41_14_d1 <=  heap_bh6_w41_14;
            heap_bh6_w43_12_d1 <=  heap_bh6_w43_12;
            heap_bh6_w45_14_d1 <=  heap_bh6_w45_14;
            heap_bh6_w45_14_d2 <=  heap_bh6_w45_14_d1;
            heap_bh6_w47_14_d1 <=  heap_bh6_w47_14;
            heap_bh6_w47_14_d2 <=  heap_bh6_w47_14_d1;
            heap_bh6_w49_12_d1 <=  heap_bh6_w49_12;
            heap_bh6_w49_12_d2 <=  heap_bh6_w49_12_d1;
            heap_bh6_w51_14_d1 <=  heap_bh6_w51_14;
            heap_bh6_w51_14_d2 <=  heap_bh6_w51_14_d1;
            heap_bh6_w53_12_d1 <=  heap_bh6_w53_12;
            heap_bh6_w53_12_d2 <=  heap_bh6_w53_12_d1;
            heap_bh6_w53_12_d3 <=  heap_bh6_w53_12_d2;
            heap_bh6_w56_7_d1 <=  heap_bh6_w56_7;
            heap_bh6_w56_8_d1 <=  heap_bh6_w56_8;
            heap_bh6_w58_4_d1 <=  heap_bh6_w58_4;
            heap_bh6_w10_10_d1 <=  heap_bh6_w10_10;
            heap_bh6_w10_10_d2 <=  heap_bh6_w10_10_d1;
            heap_bh6_w10_10_d3 <=  heap_bh6_w10_10_d2;
            heap_bh6_w10_10_d4 <=  heap_bh6_w10_10_d3;
            heap_bh6_w13_10_d1 <=  heap_bh6_w13_10;
            heap_bh6_w16_10_d1 <=  heap_bh6_w16_10;
            heap_bh6_w19_10_d1 <=  heap_bh6_w19_10;
            heap_bh6_w24_13_d1 <=  heap_bh6_w24_13;
            heap_bh6_w25_12_d1 <=  heap_bh6_w25_12;
            heap_bh6_w27_13_d1 <=  heap_bh6_w27_13;
            heap_bh6_w27_13_d2 <=  heap_bh6_w27_13_d1;
            heap_bh6_w27_13_d3 <=  heap_bh6_w27_13_d2;
            heap_bh6_w27_13_d4 <=  heap_bh6_w27_13_d3;
            heap_bh6_w31_13_d1 <=  heap_bh6_w31_13;
            heap_bh6_w31_13_d2 <=  heap_bh6_w31_13_d1;
            heap_bh6_w31_13_d3 <=  heap_bh6_w31_13_d2;
            heap_bh6_w31_13_d4 <=  heap_bh6_w31_13_d3;
            heap_bh6_w34_14_d1 <=  heap_bh6_w34_14;
            heap_bh6_w37_13_d1 <=  heap_bh6_w37_13;
            heap_bh6_w39_13_d1 <=  heap_bh6_w39_13;
            heap_bh6_w58_5_d1 <=  heap_bh6_w58_5;
            heap_bh6_w72_3_d1 <=  heap_bh6_w72_3;
            heap_bh6_w72_3_d2 <=  heap_bh6_w72_3_d1;
            heap_bh6_w72_3_d3 <=  heap_bh6_w72_3_d2;
            heap_bh6_w72_3_d4 <=  heap_bh6_w72_3_d3;
            heap_bh6_w73_3_d1 <=  heap_bh6_w73_3;
            heap_bh6_w32_13_d1 <=  heap_bh6_w32_13;
            heap_bh6_w7_10_d1 <=  heap_bh6_w7_10;
            heap_bh6_w7_10_d2 <=  heap_bh6_w7_10_d1;
            heap_bh6_w7_10_d3 <=  heap_bh6_w7_10_d2;
            heap_bh6_w7_10_d4 <=  heap_bh6_w7_10_d3;
            heap_bh6_w8_12_d1 <=  heap_bh6_w8_12;
            heap_bh6_w8_12_d2 <=  heap_bh6_w8_12_d1;
            heap_bh6_w8_12_d3 <=  heap_bh6_w8_12_d2;
            heap_bh6_w8_12_d4 <=  heap_bh6_w8_12_d3;
            heap_bh6_w9_11_d1 <=  heap_bh6_w9_11;
            heap_bh6_w9_11_d2 <=  heap_bh6_w9_11_d1;
            heap_bh6_w9_11_d3 <=  heap_bh6_w9_11_d2;
            heap_bh6_w9_11_d4 <=  heap_bh6_w9_11_d3;
            heap_bh6_w22_11_d1 <=  heap_bh6_w22_11;
            heap_bh6_w23_11_d1 <=  heap_bh6_w23_11;
            heap_bh6_w73_4_d1 <=  heap_bh6_w73_4;
            heap_bh6_w74_3_d1 <=  heap_bh6_w74_3;
            heap_bh6_w75_3_d1 <=  heap_bh6_w75_3;
            heap_bh6_w75_4_d1 <=  heap_bh6_w75_4;
            heap_bh6_w76_3_d1 <=  heap_bh6_w76_3;
            heap_bh6_w77_3_d1 <=  heap_bh6_w77_3;
            heap_bh6_w77_4_d1 <=  heap_bh6_w77_4;
            heap_bh6_w78_3_d1 <=  heap_bh6_w78_3;
            heap_bh6_w79_3_d1 <=  heap_bh6_w79_3;
            heap_bh6_w79_4_d1 <=  heap_bh6_w79_4;
            heap_bh6_w80_3_d1 <=  heap_bh6_w80_3;
            heap_bh6_w81_3_d1 <=  heap_bh6_w81_3;
            heap_bh6_w81_3_d2 <=  heap_bh6_w81_3_d1;
            heap_bh6_w81_4_d1 <=  heap_bh6_w81_4;
            heap_bh6_w81_4_d2 <=  heap_bh6_w81_4_d1;
            heap_bh6_w82_2_d1 <=  heap_bh6_w82_2;
            heap_bh6_w82_2_d2 <=  heap_bh6_w82_2_d1;
            heap_bh6_w25_13_d1 <=  heap_bh6_w25_13;
            heap_bh6_w9_12_d1 <=  heap_bh6_w9_12;
            heap_bh6_w9_12_d2 <=  heap_bh6_w9_12_d1;
            heap_bh6_w9_12_d3 <=  heap_bh6_w9_12_d2;
            heap_bh6_w9_12_d4 <=  heap_bh6_w9_12_d3;
            heap_bh6_w10_11_d1 <=  heap_bh6_w10_11;
            heap_bh6_w10_11_d2 <=  heap_bh6_w10_11_d1;
            heap_bh6_w10_11_d3 <=  heap_bh6_w10_11_d2;
            heap_bh6_w10_11_d4 <=  heap_bh6_w10_11_d3;
            heap_bh6_w13_11_d1 <=  heap_bh6_w13_11;
            heap_bh6_w16_11_d1 <=  heap_bh6_w16_11;
            heap_bh6_w19_11_d1 <=  heap_bh6_w19_11;
            heap_bh6_w23_12_d1 <=  heap_bh6_w23_12;
            heap_bh6_w24_14_d1 <=  heap_bh6_w24_14;
            heap_bh6_w33_17_d1 <=  heap_bh6_w33_17;
            heap_bh6_w34_16_d1 <=  heap_bh6_w34_16;
            heap_bh6_w35_15_d1 <=  heap_bh6_w35_15;
            heap_bh6_w36_17_d1 <=  heap_bh6_w36_17;
            heap_bh6_w37_15_d1 <=  heap_bh6_w37_15;
            heap_bh6_w38_17_d1 <=  heap_bh6_w38_17;
            heap_bh6_w55_10_d1 <=  heap_bh6_w55_10;
            heap_bh6_w55_10_d2 <=  heap_bh6_w55_10_d1;
            heap_bh6_w55_10_d3 <=  heap_bh6_w55_10_d2;
            heap_bh6_w56_10_d1 <=  heap_bh6_w56_10;
            heap_bh6_w57_8_d1 <=  heap_bh6_w57_8;
            heap_bh6_w57_9_d1 <=  heap_bh6_w57_9;
            heap_bh6_w58_7_d1 <=  heap_bh6_w58_7;
            heap_bh6_w59_7_d1 <=  heap_bh6_w59_7;
            heap_bh6_w11_13_d1 <=  heap_bh6_w11_13;
            heap_bh6_w11_13_d2 <=  heap_bh6_w11_13_d1;
            heap_bh6_w11_13_d3 <=  heap_bh6_w11_13_d2;
            heap_bh6_w11_13_d4 <=  heap_bh6_w11_13_d3;
            heap_bh6_w12_13_d1 <=  heap_bh6_w12_13;
            heap_bh6_w12_13_d2 <=  heap_bh6_w12_13_d1;
            heap_bh6_w12_13_d3 <=  heap_bh6_w12_13_d2;
            heap_bh6_w12_13_d4 <=  heap_bh6_w12_13_d3;
            heap_bh6_w13_12_d1 <=  heap_bh6_w13_12;
            heap_bh6_w14_13_d1 <=  heap_bh6_w14_13;
            heap_bh6_w15_13_d1 <=  heap_bh6_w15_13;
            heap_bh6_w15_13_d2 <=  heap_bh6_w15_13_d1;
            heap_bh6_w15_13_d3 <=  heap_bh6_w15_13_d2;
            heap_bh6_w15_13_d4 <=  heap_bh6_w15_13_d3;
            heap_bh6_w16_12_d1 <=  heap_bh6_w16_12;
            heap_bh6_w17_13_d1 <=  heap_bh6_w17_13;
            heap_bh6_w18_13_d1 <=  heap_bh6_w18_13;
            heap_bh6_w18_13_d2 <=  heap_bh6_w18_13_d1;
            heap_bh6_w18_13_d3 <=  heap_bh6_w18_13_d2;
            heap_bh6_w18_13_d4 <=  heap_bh6_w18_13_d3;
            heap_bh6_w19_12_d1 <=  heap_bh6_w19_12;
            heap_bh6_w20_13_d1 <=  heap_bh6_w20_13;
            heap_bh6_w21_13_d1 <=  heap_bh6_w21_13;
            heap_bh6_w21_13_d2 <=  heap_bh6_w21_13_d1;
            heap_bh6_w21_13_d3 <=  heap_bh6_w21_13_d2;
            heap_bh6_w21_13_d4 <=  heap_bh6_w21_13_d3;
            heap_bh6_w22_12_d1 <=  heap_bh6_w22_12;
            heap_bh6_w26_14_d1 <=  heap_bh6_w26_14;
            heap_bh6_w26_14_d2 <=  heap_bh6_w26_14_d1;
            heap_bh6_w26_14_d3 <=  heap_bh6_w26_14_d2;
            heap_bh6_w26_14_d4 <=  heap_bh6_w26_14_d3;
            heap_bh6_w27_16_d1 <=  heap_bh6_w27_16;
            heap_bh6_w27_16_d2 <=  heap_bh6_w27_16_d1;
            heap_bh6_w27_16_d3 <=  heap_bh6_w27_16_d2;
            heap_bh6_w27_16_d4 <=  heap_bh6_w27_16_d3;
            heap_bh6_w28_15_d1 <=  heap_bh6_w28_15;
            heap_bh6_w28_15_d2 <=  heap_bh6_w28_15_d1;
            heap_bh6_w28_15_d3 <=  heap_bh6_w28_15_d2;
            heap_bh6_w28_15_d4 <=  heap_bh6_w28_15_d3;
            heap_bh6_w28_16_d1 <=  heap_bh6_w28_16;
            heap_bh6_w28_16_d2 <=  heap_bh6_w28_16_d1;
            heap_bh6_w28_16_d3 <=  heap_bh6_w28_16_d2;
            heap_bh6_w28_16_d4 <=  heap_bh6_w28_16_d3;
            heap_bh6_w29_13_d1 <=  heap_bh6_w29_13;
            heap_bh6_w29_13_d2 <=  heap_bh6_w29_13_d1;
            heap_bh6_w29_13_d3 <=  heap_bh6_w29_13_d2;
            heap_bh6_w29_13_d4 <=  heap_bh6_w29_13_d3;
            heap_bh6_w30_16_d1 <=  heap_bh6_w30_16;
            heap_bh6_w30_16_d2 <=  heap_bh6_w30_16_d1;
            heap_bh6_w30_16_d3 <=  heap_bh6_w30_16_d2;
            heap_bh6_w30_16_d4 <=  heap_bh6_w30_16_d3;
            heap_bh6_w30_17_d1 <=  heap_bh6_w30_17;
            heap_bh6_w30_17_d2 <=  heap_bh6_w30_17_d1;
            heap_bh6_w30_17_d3 <=  heap_bh6_w30_17_d2;
            heap_bh6_w30_17_d4 <=  heap_bh6_w30_17_d3;
            heap_bh6_w31_16_d1 <=  heap_bh6_w31_16;
            heap_bh6_w31_16_d2 <=  heap_bh6_w31_16_d1;
            heap_bh6_w31_16_d3 <=  heap_bh6_w31_16_d2;
            heap_bh6_w31_16_d4 <=  heap_bh6_w31_16_d3;
            heap_bh6_w32_14_d1 <=  heap_bh6_w32_14;
            heap_bh6_w38_18_d1 <=  heap_bh6_w38_18;
            heap_bh6_w39_16_d1 <=  heap_bh6_w39_16;
            heap_bh6_w40_16_d1 <=  heap_bh6_w40_16;
            heap_bh6_w40_17_d1 <=  heap_bh6_w40_17;
            heap_bh6_w41_17_d1 <=  heap_bh6_w41_17;
            heap_bh6_w42_18_d1 <=  heap_bh6_w42_18;
            heap_bh6_w42_19_d1 <=  heap_bh6_w42_19;
            heap_bh6_w43_15_d1 <=  heap_bh6_w43_15;
            heap_bh6_w44_18_d1 <=  heap_bh6_w44_18;
            heap_bh6_w44_19_d1 <=  heap_bh6_w44_19;
            heap_bh6_w45_17_d1 <=  heap_bh6_w45_17;
            heap_bh6_w45_17_d2 <=  heap_bh6_w45_17_d1;
            heap_bh6_w46_16_d1 <=  heap_bh6_w46_16;
            heap_bh6_w46_16_d2 <=  heap_bh6_w46_16_d1;
            heap_bh6_w46_17_d1 <=  heap_bh6_w46_17;
            heap_bh6_w46_17_d2 <=  heap_bh6_w46_17_d1;
            heap_bh6_w47_17_d1 <=  heap_bh6_w47_17;
            heap_bh6_w47_17_d2 <=  heap_bh6_w47_17_d1;
            heap_bh6_w48_18_d1 <=  heap_bh6_w48_18;
            heap_bh6_w48_18_d2 <=  heap_bh6_w48_18_d1;
            heap_bh6_w48_19_d1 <=  heap_bh6_w48_19;
            heap_bh6_w48_19_d2 <=  heap_bh6_w48_19_d1;
            heap_bh6_w49_15_d1 <=  heap_bh6_w49_15;
            heap_bh6_w49_15_d2 <=  heap_bh6_w49_15_d1;
            heap_bh6_w50_18_d1 <=  heap_bh6_w50_18;
            heap_bh6_w50_18_d2 <=  heap_bh6_w50_18_d1;
            heap_bh6_w50_19_d1 <=  heap_bh6_w50_19;
            heap_bh6_w50_19_d2 <=  heap_bh6_w50_19_d1;
            heap_bh6_w51_17_d1 <=  heap_bh6_w51_17;
            heap_bh6_w51_17_d2 <=  heap_bh6_w51_17_d1;
            heap_bh6_w52_16_d1 <=  heap_bh6_w52_16;
            heap_bh6_w52_16_d2 <=  heap_bh6_w52_16_d1;
            heap_bh6_w52_17_d1 <=  heap_bh6_w52_17;
            heap_bh6_w52_17_d2 <=  heap_bh6_w52_17_d1;
            heap_bh6_w53_15_d1 <=  heap_bh6_w53_15;
            heap_bh6_w53_15_d2 <=  heap_bh6_w53_15_d1;
            heap_bh6_w53_15_d3 <=  heap_bh6_w53_15_d2;
            heap_bh6_w54_16_d1 <=  heap_bh6_w54_16;
            heap_bh6_w54_16_d2 <=  heap_bh6_w54_16_d1;
            heap_bh6_w54_16_d3 <=  heap_bh6_w54_16_d2;
            heap_bh6_w59_8_d1 <=  heap_bh6_w59_8;
            heap_bh6_w60_6_d1 <=  heap_bh6_w60_6;
            heap_bh6_w60_6_d2 <=  heap_bh6_w60_6_d1;
            heap_bh6_w60_6_d3 <=  heap_bh6_w60_6_d2;
            heap_bh6_w60_6_d4 <=  heap_bh6_w60_6_d3;
            heap_bh6_w61_7_d1 <=  heap_bh6_w61_7;
            heap_bh6_w61_7_d2 <=  heap_bh6_w61_7_d1;
            heap_bh6_w61_7_d3 <=  heap_bh6_w61_7_d2;
            heap_bh6_w61_7_d4 <=  heap_bh6_w61_7_d3;
            heap_bh6_w61_8_d1 <=  heap_bh6_w61_8;
            heap_bh6_w61_8_d2 <=  heap_bh6_w61_8_d1;
            heap_bh6_w61_8_d3 <=  heap_bh6_w61_8_d2;
            heap_bh6_w61_8_d4 <=  heap_bh6_w61_8_d3;
            heap_bh6_w62_6_d1 <=  heap_bh6_w62_6;
            heap_bh6_w62_6_d2 <=  heap_bh6_w62_6_d1;
            heap_bh6_w62_6_d3 <=  heap_bh6_w62_6_d2;
            heap_bh6_w62_6_d4 <=  heap_bh6_w62_6_d3;
            heap_bh6_w63_7_d1 <=  heap_bh6_w63_7;
            heap_bh6_w63_7_d2 <=  heap_bh6_w63_7_d1;
            heap_bh6_w63_7_d3 <=  heap_bh6_w63_7_d2;
            heap_bh6_w63_7_d4 <=  heap_bh6_w63_7_d3;
            heap_bh6_w63_8_d1 <=  heap_bh6_w63_8;
            heap_bh6_w63_8_d2 <=  heap_bh6_w63_8_d1;
            heap_bh6_w63_8_d3 <=  heap_bh6_w63_8_d2;
            heap_bh6_w63_8_d4 <=  heap_bh6_w63_8_d3;
            heap_bh6_w64_6_d1 <=  heap_bh6_w64_6;
            heap_bh6_w64_6_d2 <=  heap_bh6_w64_6_d1;
            heap_bh6_w64_6_d3 <=  heap_bh6_w64_6_d2;
            heap_bh6_w64_6_d4 <=  heap_bh6_w64_6_d3;
            heap_bh6_w65_7_d1 <=  heap_bh6_w65_7;
            heap_bh6_w65_7_d2 <=  heap_bh6_w65_7_d1;
            heap_bh6_w65_7_d3 <=  heap_bh6_w65_7_d2;
            heap_bh6_w65_7_d4 <=  heap_bh6_w65_7_d3;
            heap_bh6_w65_8_d1 <=  heap_bh6_w65_8;
            heap_bh6_w65_8_d2 <=  heap_bh6_w65_8_d1;
            heap_bh6_w65_8_d3 <=  heap_bh6_w65_8_d2;
            heap_bh6_w65_8_d4 <=  heap_bh6_w65_8_d3;
            heap_bh6_w66_6_d1 <=  heap_bh6_w66_6;
            heap_bh6_w66_6_d2 <=  heap_bh6_w66_6_d1;
            heap_bh6_w66_6_d3 <=  heap_bh6_w66_6_d2;
            heap_bh6_w66_6_d4 <=  heap_bh6_w66_6_d3;
            heap_bh6_w67_7_d1 <=  heap_bh6_w67_7;
            heap_bh6_w67_7_d2 <=  heap_bh6_w67_7_d1;
            heap_bh6_w67_7_d3 <=  heap_bh6_w67_7_d2;
            heap_bh6_w67_7_d4 <=  heap_bh6_w67_7_d3;
            heap_bh6_w67_8_d1 <=  heap_bh6_w67_8;
            heap_bh6_w67_8_d2 <=  heap_bh6_w67_8_d1;
            heap_bh6_w67_8_d3 <=  heap_bh6_w67_8_d2;
            heap_bh6_w67_8_d4 <=  heap_bh6_w67_8_d3;
            heap_bh6_w68_6_d1 <=  heap_bh6_w68_6;
            heap_bh6_w68_6_d2 <=  heap_bh6_w68_6_d1;
            heap_bh6_w68_6_d3 <=  heap_bh6_w68_6_d2;
            heap_bh6_w68_6_d4 <=  heap_bh6_w68_6_d3;
            heap_bh6_w69_7_d1 <=  heap_bh6_w69_7;
            heap_bh6_w69_7_d2 <=  heap_bh6_w69_7_d1;
            heap_bh6_w69_7_d3 <=  heap_bh6_w69_7_d2;
            heap_bh6_w69_7_d4 <=  heap_bh6_w69_7_d3;
            heap_bh6_w69_8_d1 <=  heap_bh6_w69_8;
            heap_bh6_w69_8_d2 <=  heap_bh6_w69_8_d1;
            heap_bh6_w69_8_d3 <=  heap_bh6_w69_8_d2;
            heap_bh6_w69_8_d4 <=  heap_bh6_w69_8_d3;
            heap_bh6_w70_6_d1 <=  heap_bh6_w70_6;
            heap_bh6_w70_6_d2 <=  heap_bh6_w70_6_d1;
            heap_bh6_w70_6_d3 <=  heap_bh6_w70_6_d2;
            heap_bh6_w70_6_d4 <=  heap_bh6_w70_6_d3;
            heap_bh6_w71_7_d1 <=  heap_bh6_w71_7;
            heap_bh6_w71_7_d2 <=  heap_bh6_w71_7_d1;
            heap_bh6_w71_7_d3 <=  heap_bh6_w71_7_d2;
            heap_bh6_w71_7_d4 <=  heap_bh6_w71_7_d3;
            heap_bh6_w71_8_d1 <=  heap_bh6_w71_8;
            heap_bh6_w71_8_d2 <=  heap_bh6_w71_8_d1;
            heap_bh6_w71_8_d3 <=  heap_bh6_w71_8_d2;
            heap_bh6_w71_8_d4 <=  heap_bh6_w71_8_d3;
            heap_bh6_w72_4_d1 <=  heap_bh6_w72_4;
            heap_bh6_w72_4_d2 <=  heap_bh6_w72_4_d1;
            heap_bh6_w72_4_d3 <=  heap_bh6_w72_4_d2;
            heap_bh6_w72_4_d4 <=  heap_bh6_w72_4_d3;
            heap_bh6_w73_5_d1 <=  heap_bh6_w73_5;
            heap_bh6_w83_3_d1 <=  heap_bh6_w83_3;
            heap_bh6_w83_3_d2 <=  heap_bh6_w83_3_d1;
            heap_bh6_w83_3_d3 <=  heap_bh6_w83_3_d2;
            heap_bh6_w83_3_d4 <=  heap_bh6_w83_3_d3;
            heap_bh6_w84_2_d1 <=  heap_bh6_w84_2;
            heap_bh6_w84_2_d2 <=  heap_bh6_w84_2_d1;
            heap_bh6_w84_2_d3 <=  heap_bh6_w84_2_d2;
            heap_bh6_w84_2_d4 <=  heap_bh6_w84_2_d3;
            heap_bh6_w85_2_d1 <=  heap_bh6_w85_2;
            heap_bh6_w35_16_d1 <=  heap_bh6_w35_16;
            heap_bh6_w36_18_d1 <=  heap_bh6_w36_18;
            heap_bh6_w54_17_d1 <=  heap_bh6_w54_17;
            heap_bh6_w54_17_d2 <=  heap_bh6_w54_17_d1;
            heap_bh6_w54_17_d3 <=  heap_bh6_w54_17_d2;
            heap_bh6_w55_11_d1 <=  heap_bh6_w55_11;
            heap_bh6_w55_11_d2 <=  heap_bh6_w55_11_d1;
            heap_bh6_w55_11_d3 <=  heap_bh6_w55_11_d2;
            heap_bh6_w22_13_d1 <=  heap_bh6_w22_13;
            heap_bh6_w22_13_d2 <=  heap_bh6_w22_13_d1;
            heap_bh6_w22_13_d3 <=  heap_bh6_w22_13_d2;
            heap_bh6_w23_13_d1 <=  heap_bh6_w23_13;
            heap_bh6_w23_13_d2 <=  heap_bh6_w23_13_d1;
            heap_bh6_w23_13_d3 <=  heap_bh6_w23_13_d2;
            heap_bh6_w34_17_d1 <=  heap_bh6_w34_17;
            heap_bh6_w34_17_d2 <=  heap_bh6_w34_17_d1;
            heap_bh6_w34_17_d3 <=  heap_bh6_w34_17_d2;
            heap_bh6_w35_17_d1 <=  heap_bh6_w35_17;
            heap_bh6_w35_17_d2 <=  heap_bh6_w35_17_d1;
            heap_bh6_w35_17_d3 <=  heap_bh6_w35_17_d2;
            heap_bh6_w38_19_d1 <=  heap_bh6_w38_19;
            heap_bh6_w38_19_d2 <=  heap_bh6_w38_19_d1;
            heap_bh6_w38_19_d3 <=  heap_bh6_w38_19_d2;
            heap_bh6_w56_11_d1 <=  heap_bh6_w56_11;
            heap_bh6_w56_11_d2 <=  heap_bh6_w56_11_d1;
            heap_bh6_w57_10_d1 <=  heap_bh6_w57_10;
            heap_bh6_w57_10_d2 <=  heap_bh6_w57_10_d1;
            heap_bh6_w57_10_d3 <=  heap_bh6_w57_10_d2;
            heap_bh6_w58_8_d1 <=  heap_bh6_w58_8;
            heap_bh6_w58_8_d2 <=  heap_bh6_w58_8_d1;
            heap_bh6_w58_8_d3 <=  heap_bh6_w58_8_d2;
            heap_bh6_w58_9_d1 <=  heap_bh6_w58_9;
            heap_bh6_w58_9_d2 <=  heap_bh6_w58_9_d1;
            heap_bh6_w58_9_d3 <=  heap_bh6_w58_9_d2;
            heap_bh6_w59_9_d1 <=  heap_bh6_w59_9;
            heap_bh6_w59_9_d2 <=  heap_bh6_w59_9_d1;
            heap_bh6_w59_9_d3 <=  heap_bh6_w59_9_d2;
            heap_bh6_w60_7_d1 <=  heap_bh6_w60_7;
            heap_bh6_w60_7_d2 <=  heap_bh6_w60_7_d1;
            heap_bh6_w60_7_d3 <=  heap_bh6_w60_7_d2;
            heap_bh6_w73_6_d1 <=  heap_bh6_w73_6;
            heap_bh6_w73_6_d2 <=  heap_bh6_w73_6_d1;
            heap_bh6_w73_6_d3 <=  heap_bh6_w73_6_d2;
            heap_bh6_w74_4_d1 <=  heap_bh6_w74_4;
            heap_bh6_w74_4_d2 <=  heap_bh6_w74_4_d1;
            heap_bh6_w74_4_d3 <=  heap_bh6_w74_4_d2;
            heap_bh6_w85_3_d1 <=  heap_bh6_w85_3;
            heap_bh6_w85_3_d2 <=  heap_bh6_w85_3_d1;
            heap_bh6_w85_3_d3 <=  heap_bh6_w85_3_d2;
            heap_bh6_w86_2_d1 <=  heap_bh6_w86_2;
            heap_bh6_w86_2_d2 <=  heap_bh6_w86_2_d1;
            heap_bh6_w86_2_d3 <=  heap_bh6_w86_2_d2;
            heap_bh6_w13_13_d1 <=  heap_bh6_w13_13;
            heap_bh6_w13_13_d2 <=  heap_bh6_w13_13_d1;
            heap_bh6_w13_13_d3 <=  heap_bh6_w13_13_d2;
            heap_bh6_w14_14_d1 <=  heap_bh6_w14_14;
            heap_bh6_w14_14_d2 <=  heap_bh6_w14_14_d1;
            heap_bh6_w14_14_d3 <=  heap_bh6_w14_14_d2;
            heap_bh6_w15_14_d1 <=  heap_bh6_w15_14;
            heap_bh6_w15_14_d2 <=  heap_bh6_w15_14_d1;
            heap_bh6_w15_14_d3 <=  heap_bh6_w15_14_d2;
            heap_bh6_w16_13_d1 <=  heap_bh6_w16_13;
            heap_bh6_w16_13_d2 <=  heap_bh6_w16_13_d1;
            heap_bh6_w16_13_d3 <=  heap_bh6_w16_13_d2;
            heap_bh6_w17_14_d1 <=  heap_bh6_w17_14;
            heap_bh6_w17_14_d2 <=  heap_bh6_w17_14_d1;
            heap_bh6_w17_14_d3 <=  heap_bh6_w17_14_d2;
            heap_bh6_w18_14_d1 <=  heap_bh6_w18_14;
            heap_bh6_w18_14_d2 <=  heap_bh6_w18_14_d1;
            heap_bh6_w18_14_d3 <=  heap_bh6_w18_14_d2;
            heap_bh6_w19_13_d1 <=  heap_bh6_w19_13;
            heap_bh6_w19_13_d2 <=  heap_bh6_w19_13_d1;
            heap_bh6_w19_13_d3 <=  heap_bh6_w19_13_d2;
            heap_bh6_w20_14_d1 <=  heap_bh6_w20_14;
            heap_bh6_w20_14_d2 <=  heap_bh6_w20_14_d1;
            heap_bh6_w20_14_d3 <=  heap_bh6_w20_14_d2;
            heap_bh6_w21_14_d1 <=  heap_bh6_w21_14;
            heap_bh6_w21_14_d2 <=  heap_bh6_w21_14_d1;
            heap_bh6_w21_14_d3 <=  heap_bh6_w21_14_d2;
            heap_bh6_w32_15_d1 <=  heap_bh6_w32_15;
            heap_bh6_w32_15_d2 <=  heap_bh6_w32_15_d1;
            heap_bh6_w32_15_d3 <=  heap_bh6_w32_15_d2;
            heap_bh6_w33_18_d1 <=  heap_bh6_w33_18;
            heap_bh6_w33_18_d2 <=  heap_bh6_w33_18_d1;
            heap_bh6_w33_18_d3 <=  heap_bh6_w33_18_d2;
            heap_bh6_w34_18_d1 <=  heap_bh6_w34_18;
            heap_bh6_w34_18_d2 <=  heap_bh6_w34_18_d1;
            heap_bh6_w34_18_d3 <=  heap_bh6_w34_18_d2;
            heap_bh6_w24_16_d1 <=  heap_bh6_w24_16;
            heap_bh6_w24_16_d2 <=  heap_bh6_w24_16_d1;
            heap_bh6_w24_16_d3 <=  heap_bh6_w24_16_d2;
            heap_bh6_w25_14_d1 <=  heap_bh6_w25_14;
            heap_bh6_w25_14_d2 <=  heap_bh6_w25_14_d1;
            heap_bh6_w25_14_d3 <=  heap_bh6_w25_14_d2;
            heap_bh6_w26_15_d1 <=  heap_bh6_w26_15;
            heap_bh6_w26_15_d2 <=  heap_bh6_w26_15_d1;
            heap_bh6_w26_15_d3 <=  heap_bh6_w26_15_d2;
            heap_bh6_w39_18_d1 <=  heap_bh6_w39_18;
            heap_bh6_w39_18_d2 <=  heap_bh6_w39_18_d1;
            heap_bh6_w39_18_d3 <=  heap_bh6_w39_18_d2;
            heap_bh6_w40_18_d1 <=  heap_bh6_w40_18;
            heap_bh6_w40_18_d2 <=  heap_bh6_w40_18_d1;
            heap_bh6_w40_18_d3 <=  heap_bh6_w40_18_d2;
            heap_bh6_w75_6_d1 <=  heap_bh6_w75_6;
            heap_bh6_w75_6_d2 <=  heap_bh6_w75_6_d1;
            heap_bh6_w75_6_d3 <=  heap_bh6_w75_6_d2;
            heap_bh6_w76_4_d1 <=  heap_bh6_w76_4;
            heap_bh6_w76_4_d2 <=  heap_bh6_w76_4_d1;
            heap_bh6_w76_4_d3 <=  heap_bh6_w76_4_d2;
            heap_bh6_w87_3_d1 <=  heap_bh6_w87_3;
            heap_bh6_w87_3_d2 <=  heap_bh6_w87_3_d1;
            heap_bh6_w87_3_d3 <=  heap_bh6_w87_3_d2;
            heap_bh6_w88_2_d1 <=  heap_bh6_w88_2;
            heap_bh6_w88_2_d2 <=  heap_bh6_w88_2_d1;
            heap_bh6_w88_2_d3 <=  heap_bh6_w88_2_d2;
            heap_bh6_w89_1_d1 <=  heap_bh6_w89_1;
            heap_bh6_w89_1_d2 <=  heap_bh6_w89_1_d1;
            heap_bh6_w89_1_d3 <=  heap_bh6_w89_1_d2;
            heap_bh6_w36_20_d1 <=  heap_bh6_w36_20;
            heap_bh6_w36_20_d2 <=  heap_bh6_w36_20_d1;
            heap_bh6_w36_20_d3 <=  heap_bh6_w36_20_d2;
            heap_bh6_w37_17_d1 <=  heap_bh6_w37_17;
            heap_bh6_w37_17_d2 <=  heap_bh6_w37_17_d1;
            heap_bh6_w37_17_d3 <=  heap_bh6_w37_17_d2;
            heap_bh6_w38_20_d1 <=  heap_bh6_w38_20;
            heap_bh6_w38_20_d2 <=  heap_bh6_w38_20_d1;
            heap_bh6_w38_20_d3 <=  heap_bh6_w38_20_d2;
            heap_bh6_w41_19_d1 <=  heap_bh6_w41_19;
            heap_bh6_w41_19_d2 <=  heap_bh6_w41_19_d1;
            heap_bh6_w41_19_d3 <=  heap_bh6_w41_19_d2;
            heap_bh6_w42_20_d1 <=  heap_bh6_w42_20;
            heap_bh6_w42_20_d2 <=  heap_bh6_w42_20_d1;
            heap_bh6_w42_20_d3 <=  heap_bh6_w42_20_d2;
            heap_bh6_w77_6_d1 <=  heap_bh6_w77_6;
            heap_bh6_w77_6_d2 <=  heap_bh6_w77_6_d1;
            heap_bh6_w77_6_d3 <=  heap_bh6_w77_6_d2;
            heap_bh6_w78_4_d1 <=  heap_bh6_w78_4;
            heap_bh6_w78_4_d2 <=  heap_bh6_w78_4_d1;
            heap_bh6_w78_4_d3 <=  heap_bh6_w78_4_d2;
            heap_bh6_w43_17_d1 <=  heap_bh6_w43_17;
            heap_bh6_w43_17_d2 <=  heap_bh6_w43_17_d1;
            heap_bh6_w43_17_d3 <=  heap_bh6_w43_17_d2;
            heap_bh6_w44_20_d1 <=  heap_bh6_w44_20;
            heap_bh6_w44_20_d2 <=  heap_bh6_w44_20_d1;
            heap_bh6_w44_20_d3 <=  heap_bh6_w44_20_d2;
            heap_bh6_w45_18_d1 <=  heap_bh6_w45_18;
            heap_bh6_w79_6_d1 <=  heap_bh6_w79_6;
            heap_bh6_w79_6_d2 <=  heap_bh6_w79_6_d1;
            heap_bh6_w79_6_d3 <=  heap_bh6_w79_6_d2;
            heap_bh6_w80_4_d1 <=  heap_bh6_w80_4;
            heap_bh6_w80_4_d2 <=  heap_bh6_w80_4_d1;
            heap_bh6_w80_4_d3 <=  heap_bh6_w80_4_d2;
            heap_bh6_w81_5_d1 <=  heap_bh6_w81_5;
            heap_bh6_w45_19_d1 <=  heap_bh6_w45_19;
            heap_bh6_w45_19_d2 <=  heap_bh6_w45_19_d1;
            heap_bh6_w46_18_d1 <=  heap_bh6_w46_18;
            heap_bh6_w46_18_d2 <=  heap_bh6_w46_18_d1;
            heap_bh6_w81_6_d1 <=  heap_bh6_w81_6;
            heap_bh6_w81_6_d2 <=  heap_bh6_w81_6_d1;
            heap_bh6_w82_3_d1 <=  heap_bh6_w82_3;
            heap_bh6_w82_3_d2 <=  heap_bh6_w82_3_d1;
            heap_bh6_w83_4_d1 <=  heap_bh6_w83_4;
            heap_bh6_w83_4_d2 <=  heap_bh6_w83_4_d1;
            heap_bh6_w47_19_d1 <=  heap_bh6_w47_19;
            heap_bh6_w47_19_d2 <=  heap_bh6_w47_19_d1;
            heap_bh6_w48_20_d1 <=  heap_bh6_w48_20;
            heap_bh6_w48_20_d2 <=  heap_bh6_w48_20_d1;
            heap_bh6_w49_17_d1 <=  heap_bh6_w49_17;
            heap_bh6_w49_17_d2 <=  heap_bh6_w49_17_d1;
            heap_bh6_w50_20_d1 <=  heap_bh6_w50_20;
            heap_bh6_w50_20_d2 <=  heap_bh6_w50_20_d1;
            heap_bh6_w51_19_d1 <=  heap_bh6_w51_19;
            heap_bh6_w51_19_d2 <=  heap_bh6_w51_19_d1;
            heap_bh6_w52_18_d1 <=  heap_bh6_w52_18;
            heap_bh6_w52_18_d2 <=  heap_bh6_w52_18_d1;
            heap_bh6_w53_16_d1 <=  heap_bh6_w53_16;
            heap_bh6_w53_17_d1 <=  heap_bh6_w53_17;
            heap_bh6_w54_18_d1 <=  heap_bh6_w54_18;
            heap_bh6_w55_13_d1 <=  heap_bh6_w55_13;
            heap_bh6_w56_12_d1 <=  heap_bh6_w56_12;
            heap_bh6_w57_11_d1 <=  heap_bh6_w57_11;
         end if;
      end process;
   XX_m5 <= X ;
   YY_m5 <= Y ;
   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=36 msbX=5 msbY=53
   Xp_m5b7 <= XX_m5(4 downto 0) & "0";
   Yp_m5b7 <= YY_m5(52 downto 36) & "0";
   x_m5b7_0 <= Xp_m5b7(2 downto 0);
   x_m5b7_1 <= Xp_m5b7(5 downto 3);
   y_m5b7_0 <= Yp_m5b7(2 downto 0);
   y_m5b7_1 <= Yp_m5b7(5 downto 3);
   y_m5b7_2 <= Yp_m5b7(8 downto 6);
   y_m5b7_3 <= Yp_m5b7(11 downto 9);
   y_m5b7_4 <= Yp_m5b7(14 downto 12);
   y_m5b7_5 <= Yp_m5b7(17 downto 15);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_7_m5 <= y_m5b7_0 & x_m5b7_0;
   PP_m5_7X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_7_m5,
                 Y => PP7X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w36_0 <= PP7X0Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w37_0 <= PP7X0Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w38_0 <= PP7X0Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w39_0 <= PP7X0Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y0X1_7_m5 <= y_m5b7_0 & x_m5b7_1;
   PP_m5_7X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_7_m5,
                 Y => PP7X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w38_1 <= PP7X1Y0_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w39_1 <= PP7X1Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w40_0 <= PP7X1Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w41_0 <= PP7X1Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w42_0 <= PP7X1Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 1
   Y1X0_7_m5 <= y_m5b7_1 & x_m5b7_0;
   PP_m5_7X0Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_7_m5,
                 Y => PP7X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w38_2 <= PP7X0Y1_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w39_2 <= PP7X0Y1_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w40_1 <= PP7X0Y1_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w41_1 <= PP7X0Y1_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w42_1 <= PP7X0Y1_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y1X1_7_m5 <= y_m5b7_1 & x_m5b7_1;
   PP_m5_7X1Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_7_m5,
                 Y => PP7X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w40_2 <= PP7X1Y1_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w41_2 <= PP7X1Y1_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w42_2 <= PP7X1Y1_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w43_0 <= PP7X1Y1_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w44_0 <= PP7X1Y1_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w45_0 <= PP7X1Y1_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 2
   Y2X0_7_m5 <= y_m5b7_2 & x_m5b7_0;
   PP_m5_7X0Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_7_m5,
                 Y => PP7X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w41_3 <= PP7X0Y2_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w42_3 <= PP7X0Y2_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w43_1 <= PP7X0Y2_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w44_1 <= PP7X0Y2_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w45_1 <= PP7X0Y2_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y2X1_7_m5 <= y_m5b7_2 & x_m5b7_1;
   PP_m5_7X1Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_7_m5,
                 Y => PP7X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w43_2 <= PP7X1Y2_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w44_2 <= PP7X1Y2_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w45_2 <= PP7X1Y2_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w46_0 <= PP7X1Y2_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w47_0 <= PP7X1Y2_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w48_0 <= PP7X1Y2_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 3
   Y3X0_7_m5 <= y_m5b7_3 & x_m5b7_0;
   PP_m5_7X0Y3_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_7_m5,
                 Y => PP7X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w44_3 <= PP7X0Y3_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w45_3 <= PP7X0Y3_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w46_1 <= PP7X0Y3_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w47_1 <= PP7X0Y3_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w48_1 <= PP7X0Y3_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y3X1_7_m5 <= y_m5b7_3 & x_m5b7_1;
   PP_m5_7X1Y3_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_7_m5,
                 Y => PP7X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w46_2 <= PP7X1Y3_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w47_2 <= PP7X1Y3_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w48_2 <= PP7X1Y3_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w49_0 <= PP7X1Y3_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w50_0 <= PP7X1Y3_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w51_0 <= PP7X1Y3_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 4
   Y4X0_7_m5 <= y_m5b7_4 & x_m5b7_0;
   PP_m5_7X0Y4_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X0_7_m5,
                 Y => PP7X0Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w47_3 <= PP7X0Y4_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w48_3 <= PP7X0Y4_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w49_1 <= PP7X0Y4_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w50_1 <= PP7X0Y4_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w51_1 <= PP7X0Y4_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y4X1_7_m5 <= y_m5b7_4 & x_m5b7_1;
   PP_m5_7X1Y4_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X1_7_m5,
                 Y => PP7X1Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w49_2 <= PP7X1Y4_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w50_2 <= PP7X1Y4_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w51_2 <= PP7X1Y4_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w52_0 <= PP7X1Y4_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w53_0 <= PP7X1Y4_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w54_0 <= PP7X1Y4_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 5
   Y5X0_7_m5 <= y_m5b7_5 & x_m5b7_0;
   PP_m5_7X0Y5_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X0_7_m5,
                 Y => PP7X0Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w50_3 <= PP7X0Y5_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w51_3 <= PP7X0Y5_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w52_1 <= PP7X0Y5_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w53_1 <= PP7X0Y5_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w54_1 <= PP7X0Y5_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y5X1_7_m5 <= y_m5b7_5 & x_m5b7_1;
   PP_m5_7X1Y5_Tbl: SmallMultTableP3x3r6XuYu_F700_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X1_7_m5,
                 Y => PP7X1Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w52_2 <= PP7X1Y5_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w53_2 <= PP7X1Y5_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w54_2 <= PP7X1Y5_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w55_0 <= PP7X1Y5_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w56_0 <= PP7X1Y5_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w57_0 <= PP7X1Y5_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=19 msbX=5 msbY=36
   Xp_m5b34 <= XX_m5(4 downto 0) & "0";
   Yp_m5b34 <= YY_m5(35 downto 19) & "0";
   x_m5b34_0 <= Xp_m5b34(2 downto 0);
   x_m5b34_1 <= Xp_m5b34(5 downto 3);
   y_m5b34_0 <= Yp_m5b34(2 downto 0);
   y_m5b34_1 <= Yp_m5b34(5 downto 3);
   y_m5b34_2 <= Yp_m5b34(8 downto 6);
   y_m5b34_3 <= Yp_m5b34(11 downto 9);
   y_m5b34_4 <= Yp_m5b34(14 downto 12);
   y_m5b34_5 <= Yp_m5b34(17 downto 15);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_34_m5 <= y_m5b34_0 & x_m5b34_0;
   PP_m5_34X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_34_m5,
                 Y => PP34X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w19_0 <= PP34X0Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w20_0 <= PP34X0Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w21_0 <= PP34X0Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w22_0 <= PP34X0Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y0X1_34_m5 <= y_m5b34_0 & x_m5b34_1;
   PP_m5_34X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_34_m5,
                 Y => PP34X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w21_1 <= PP34X1Y0_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w22_1 <= PP34X1Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w23_0 <= PP34X1Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w24_0 <= PP34X1Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w25_0 <= PP34X1Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 1
   Y1X0_34_m5 <= y_m5b34_1 & x_m5b34_0;
   PP_m5_34X0Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_34_m5,
                 Y => PP34X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w21_2 <= PP34X0Y1_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w22_2 <= PP34X0Y1_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w23_1 <= PP34X0Y1_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w24_1 <= PP34X0Y1_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w25_1 <= PP34X0Y1_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y1X1_34_m5 <= y_m5b34_1 & x_m5b34_1;
   PP_m5_34X1Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_34_m5,
                 Y => PP34X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w23_2 <= PP34X1Y1_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w24_2 <= PP34X1Y1_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w25_2 <= PP34X1Y1_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w26_0 <= PP34X1Y1_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w27_0 <= PP34X1Y1_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w28_0 <= PP34X1Y1_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 2
   Y2X0_34_m5 <= y_m5b34_2 & x_m5b34_0;
   PP_m5_34X0Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_34_m5,
                 Y => PP34X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w24_3 <= PP34X0Y2_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w25_3 <= PP34X0Y2_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w26_1 <= PP34X0Y2_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w27_1 <= PP34X0Y2_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w28_1 <= PP34X0Y2_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y2X1_34_m5 <= y_m5b34_2 & x_m5b34_1;
   PP_m5_34X1Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_34_m5,
                 Y => PP34X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w26_2 <= PP34X1Y2_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w27_2 <= PP34X1Y2_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w28_2 <= PP34X1Y2_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w29_0 <= PP34X1Y2_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w30_0 <= PP34X1Y2_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w31_0 <= PP34X1Y2_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 3
   Y3X0_34_m5 <= y_m5b34_3 & x_m5b34_0;
   PP_m5_34X0Y3_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_34_m5,
                 Y => PP34X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w27_3 <= PP34X0Y3_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w28_3 <= PP34X0Y3_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w29_1 <= PP34X0Y3_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w30_1 <= PP34X0Y3_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w31_1 <= PP34X0Y3_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y3X1_34_m5 <= y_m5b34_3 & x_m5b34_1;
   PP_m5_34X1Y3_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_34_m5,
                 Y => PP34X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w29_2 <= PP34X1Y3_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w30_2 <= PP34X1Y3_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w31_2 <= PP34X1Y3_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w32_0 <= PP34X1Y3_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w33_0 <= PP34X1Y3_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w34_0 <= PP34X1Y3_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 4
   Y4X0_34_m5 <= y_m5b34_4 & x_m5b34_0;
   PP_m5_34X0Y4_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X0_34_m5,
                 Y => PP34X0Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w30_3 <= PP34X0Y4_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w31_3 <= PP34X0Y4_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w32_1 <= PP34X0Y4_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w33_1 <= PP34X0Y4_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w34_1 <= PP34X0Y4_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y4X1_34_m5 <= y_m5b34_4 & x_m5b34_1;
   PP_m5_34X1Y4_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X1_34_m5,
                 Y => PP34X1Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w32_2 <= PP34X1Y4_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w33_2 <= PP34X1Y4_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w34_2 <= PP34X1Y4_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w35_0 <= PP34X1Y4_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w36_1 <= PP34X1Y4_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w37_1 <= PP34X1Y4_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 5
   Y5X0_34_m5 <= y_m5b34_5 & x_m5b34_0;
   PP_m5_34X0Y5_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X0_34_m5,
                 Y => PP34X0Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w33_3 <= PP34X0Y5_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w34_3 <= PP34X0Y5_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w35_1 <= PP34X0Y5_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w36_2 <= PP34X0Y5_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w37_2 <= PP34X0Y5_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y5X1_34_m5 <= y_m5b34_5 & x_m5b34_1;
   PP_m5_34X1Y5_Tbl: SmallMultTableP3x3r6XuYu_F700_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X1_34_m5,
                 Y => PP34X1Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w35_2 <= PP34X1Y5_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w36_3 <= PP34X1Y5_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w37_3 <= PP34X1Y5_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w38_3 <= PP34X1Y5_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w39_3 <= PP34X1Y5_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w40_3 <= PP34X1Y5_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=2 msbX=5 msbY=19
   Xp_m5b61 <= XX_m5(4 downto 0) & "0";
   Yp_m5b61 <= YY_m5(18 downto 2) & "0";
   x_m5b61_0 <= Xp_m5b61(2 downto 0);
   x_m5b61_1 <= Xp_m5b61(5 downto 3);
   y_m5b61_0 <= Yp_m5b61(2 downto 0);
   y_m5b61_1 <= Yp_m5b61(5 downto 3);
   y_m5b61_2 <= Yp_m5b61(8 downto 6);
   y_m5b61_3 <= Yp_m5b61(11 downto 9);
   y_m5b61_4 <= Yp_m5b61(14 downto 12);
   y_m5b61_5 <= Yp_m5b61(17 downto 15);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_61_m5 <= y_m5b61_0 & x_m5b61_0;
   PP_m5_61X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_61_m5,
                 Y => PP61X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w2_0 <= PP61X0Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w3_0 <= PP61X0Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w4_0 <= PP61X0Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w5_0 <= PP61X0Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y0X1_61_m5 <= y_m5b61_0 & x_m5b61_1;
   PP_m5_61X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_61_m5,
                 Y => PP61X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w4_1 <= PP61X1Y0_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w5_1 <= PP61X1Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w6_0 <= PP61X1Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w7_0 <= PP61X1Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w8_0 <= PP61X1Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 1
   Y1X0_61_m5 <= y_m5b61_1 & x_m5b61_0;
   PP_m5_61X0Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_61_m5,
                 Y => PP61X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w4_2 <= PP61X0Y1_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w5_2 <= PP61X0Y1_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w6_1 <= PP61X0Y1_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w7_1 <= PP61X0Y1_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w8_1 <= PP61X0Y1_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y1X1_61_m5 <= y_m5b61_1 & x_m5b61_1;
   PP_m5_61X1Y1_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_61_m5,
                 Y => PP61X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w6_2 <= PP61X1Y1_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w7_2 <= PP61X1Y1_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w8_2 <= PP61X1Y1_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w9_0 <= PP61X1Y1_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w10_0 <= PP61X1Y1_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w11_0 <= PP61X1Y1_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 2
   Y2X0_61_m5 <= y_m5b61_2 & x_m5b61_0;
   PP_m5_61X0Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_61_m5,
                 Y => PP61X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w7_3 <= PP61X0Y2_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w8_3 <= PP61X0Y2_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w9_1 <= PP61X0Y2_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w10_1 <= PP61X0Y2_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w11_1 <= PP61X0Y2_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y2X1_61_m5 <= y_m5b61_2 & x_m5b61_1;
   PP_m5_61X1Y2_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_61_m5,
                 Y => PP61X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w9_2 <= PP61X1Y2_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w10_2 <= PP61X1Y2_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w11_2 <= PP61X1Y2_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w12_0 <= PP61X1Y2_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w13_0 <= PP61X1Y2_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w14_0 <= PP61X1Y2_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 3
   Y3X0_61_m5 <= y_m5b61_3 & x_m5b61_0;
   PP_m5_61X0Y3_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_61_m5,
                 Y => PP61X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w10_3 <= PP61X0Y3_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w11_3 <= PP61X0Y3_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w12_1 <= PP61X0Y3_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w13_1 <= PP61X0Y3_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w14_1 <= PP61X0Y3_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y3X1_61_m5 <= y_m5b61_3 & x_m5b61_1;
   PP_m5_61X1Y3_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_61_m5,
                 Y => PP61X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_2 <= PP61X1Y3_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w13_2 <= PP61X1Y3_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w14_2 <= PP61X1Y3_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w15_0 <= PP61X1Y3_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w16_0 <= PP61X1Y3_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w17_0 <= PP61X1Y3_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 4
   Y4X0_61_m5 <= y_m5b61_4 & x_m5b61_0;
   PP_m5_61X0Y4_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X0_61_m5,
                 Y => PP61X0Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w13_3 <= PP61X0Y4_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w14_3 <= PP61X0Y4_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w15_1 <= PP61X0Y4_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w16_1 <= PP61X0Y4_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w17_1 <= PP61X0Y4_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y4X1_61_m5 <= y_m5b61_4 & x_m5b61_1;
   PP_m5_61X1Y4_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X1_61_m5,
                 Y => PP61X1Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w15_2 <= PP61X1Y4_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w16_2 <= PP61X1Y4_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w17_2 <= PP61X1Y4_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w18_0 <= PP61X1Y4_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w19_1 <= PP61X1Y4_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w20_1 <= PP61X1Y4_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- Partial product row number 5
   Y5X0_61_m5 <= y_m5b61_5 & x_m5b61_0;
   PP_m5_61X0Y5_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X0_61_m5,
                 Y => PP61X0Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w16_3 <= PP61X0Y5_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w17_3 <= PP61X0Y5_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w18_1 <= PP61X0Y5_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w19_2 <= PP61X0Y5_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w20_2 <= PP61X0Y5_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y5X1_61_m5 <= y_m5b61_5 & x_m5b61_1;
   PP_m5_61X1Y5_Tbl: SmallMultTableP3x3r6XuYu_F700_uid63  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X1_61_m5,
                 Y => PP61X1Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w18_2 <= PP61X1Y5_m5(0); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w19_3 <= PP61X1Y5_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w20_3 <= PP61X1Y5_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w21_3 <= PP61X1Y5_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w22_3 <= PP61X1Y5_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w23_3 <= PP61X1Y5_m5(5); -- cycle= 0 cp= 3.7852e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=29 lsbY=0 msbX=53 msbY=2
   Xp_m5b88 <= XX_m5(52 downto 29) & "";
   Yp_m5b88 <= YY_m5(1 downto 0) & "0";
   x_m5b88_0 <= Xp_m5b88(2 downto 0);
   x_m5b88_1 <= Xp_m5b88(5 downto 3);
   x_m5b88_2 <= Xp_m5b88(8 downto 6);
   x_m5b88_3 <= Xp_m5b88(11 downto 9);
   x_m5b88_4 <= Xp_m5b88(14 downto 12);
   x_m5b88_5 <= Xp_m5b88(17 downto 15);
   x_m5b88_6 <= Xp_m5b88(20 downto 18);
   x_m5b88_7 <= Xp_m5b88(23 downto 21);
   y_m5b88_0 <= Yp_m5b88(2 downto 0);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_88_m5 <= y_m5b88_0 & x_m5b88_0;
   PP_m5_88X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_88_m5,
                 Y => PP88X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w29_3 <= PP88X0Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w30_4 <= PP88X0Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w31_4 <= PP88X0Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w32_3 <= PP88X0Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w33_4 <= PP88X0Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X1_88_m5 <= y_m5b88_0 & x_m5b88_1;
   PP_m5_88X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_88_m5,
                 Y => PP88X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w32_4 <= PP88X1Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w33_5 <= PP88X1Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w34_4 <= PP88X1Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w35_3 <= PP88X1Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w36_4 <= PP88X1Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X2_88_m5 <= y_m5b88_0 & x_m5b88_2;
   PP_m5_88X2Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_88_m5,
                 Y => PP88X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w35_4 <= PP88X2Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w36_5 <= PP88X2Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w37_4 <= PP88X2Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w38_4 <= PP88X2Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w39_4 <= PP88X2Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X3_88_m5 <= y_m5b88_0 & x_m5b88_3;
   PP_m5_88X3Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_88_m5,
                 Y => PP88X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w38_5 <= PP88X3Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w39_5 <= PP88X3Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w40_4 <= PP88X3Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w41_4 <= PP88X3Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w42_4 <= PP88X3Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X4_88_m5 <= y_m5b88_0 & x_m5b88_4;
   PP_m5_88X4Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_88_m5,
                 Y => PP88X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w41_5 <= PP88X4Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w42_5 <= PP88X4Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w43_3 <= PP88X4Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w44_4 <= PP88X4Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w45_4 <= PP88X4Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X5_88_m5 <= y_m5b88_0 & x_m5b88_5;
   PP_m5_88X5Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X5_88_m5,
                 Y => PP88X5Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w44_5 <= PP88X5Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w45_5 <= PP88X5Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w46_3 <= PP88X5Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w47_4 <= PP88X5Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w48_4 <= PP88X5Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X6_88_m5 <= y_m5b88_0 & x_m5b88_6;
   PP_m5_88X6Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X6_88_m5,
                 Y => PP88X6Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w47_5 <= PP88X6Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w48_5 <= PP88X6Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w49_3 <= PP88X6Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w50_4 <= PP88X6Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w51_4 <= PP88X6Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X7_88_m5 <= y_m5b88_0 & x_m5b88_7;
   PP_m5_88X7Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid90  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X7_88_m5,
                 Y => PP88X7Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w50_5 <= PP88X7Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w51_5 <= PP88X7Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w52_3 <= PP88X7Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w53_3 <= PP88X7Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w54_3 <= PP88X7Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=5 lsbY=0 msbX=29 msbY=2
   Xp_m5b107 <= XX_m5(28 downto 5) & "";
   Yp_m5b107 <= YY_m5(1 downto 0) & "0";
   x_m5b107_0 <= Xp_m5b107(2 downto 0);
   x_m5b107_1 <= Xp_m5b107(5 downto 3);
   x_m5b107_2 <= Xp_m5b107(8 downto 6);
   x_m5b107_3 <= Xp_m5b107(11 downto 9);
   x_m5b107_4 <= Xp_m5b107(14 downto 12);
   x_m5b107_5 <= Xp_m5b107(17 downto 15);
   x_m5b107_6 <= Xp_m5b107(20 downto 18);
   x_m5b107_7 <= Xp_m5b107(23 downto 21);
   y_m5b107_0 <= Yp_m5b107(2 downto 0);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_107_m5 <= y_m5b107_0 & x_m5b107_0;
   PP_m5_107X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_107_m5,
                 Y => PP107X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w5_3 <= PP107X0Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w6_3 <= PP107X0Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w7_4 <= PP107X0Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w8_4 <= PP107X0Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w9_3 <= PP107X0Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X1_107_m5 <= y_m5b107_0 & x_m5b107_1;
   PP_m5_107X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_107_m5,
                 Y => PP107X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w8_5 <= PP107X1Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w9_4 <= PP107X1Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w10_4 <= PP107X1Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w11_4 <= PP107X1Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w12_3 <= PP107X1Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X2_107_m5 <= y_m5b107_0 & x_m5b107_2;
   PP_m5_107X2Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_107_m5,
                 Y => PP107X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w11_5 <= PP107X2Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w12_4 <= PP107X2Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w13_4 <= PP107X2Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w14_4 <= PP107X2Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w15_3 <= PP107X2Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X3_107_m5 <= y_m5b107_0 & x_m5b107_3;
   PP_m5_107X3Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_107_m5,
                 Y => PP107X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w14_5 <= PP107X3Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w15_4 <= PP107X3Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w16_4 <= PP107X3Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w17_4 <= PP107X3Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w18_3 <= PP107X3Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X4_107_m5 <= y_m5b107_0 & x_m5b107_4;
   PP_m5_107X4Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_107_m5,
                 Y => PP107X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w17_5 <= PP107X4Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w18_4 <= PP107X4Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w19_4 <= PP107X4Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w20_4 <= PP107X4Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w21_4 <= PP107X4Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X5_107_m5 <= y_m5b107_0 & x_m5b107_5;
   PP_m5_107X5Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X5_107_m5,
                 Y => PP107X5Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w20_5 <= PP107X5Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w21_5 <= PP107X5Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w22_4 <= PP107X5Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w23_4 <= PP107X5Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w24_4 <= PP107X5Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X6_107_m5 <= y_m5b107_0 & x_m5b107_6;
   PP_m5_107X6Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X6_107_m5,
                 Y => PP107X6Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w23_5 <= PP107X6Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w24_5 <= PP107X6Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w25_4 <= PP107X6Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w26_3 <= PP107X6Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w27_4 <= PP107X6Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   Y0X7_107_m5 <= y_m5b107_0 & x_m5b107_7;
   PP_m5_107X7Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid109  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X7_107_m5,
                 Y => PP107X7Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w26_4 <= PP107X7Y0_m5(1); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w27_5 <= PP107X7Y0_m5(2); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w28_4 <= PP107X7Y0_m5(3); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w29_4 <= PP107X7Y0_m5(4); -- cycle= 0 cp= 4.1608e-10
   heap_bh6_w30_5 <= PP107X7Y0_m5(5); -- cycle= 0 cp= 4.1608e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=0 msbX=5 msbY=2
   Xp_m5b126 <= XX_m5(4 downto 0) & "0";
   Yp_m5b126 <= YY_m5(1 downto 0) & "0";
   x_m5b126_0 <= Xp_m5b126(2 downto 0);
   x_m5b126_1 <= Xp_m5b126(5 downto 3);
   y_m5b126_0 <= Yp_m5b126(2 downto 0);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_126_m5 <= y_m5b126_0 & x_m5b126_0;
   PP_m5_126X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid128  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_126_m5,
                 Y => PP126X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w0_0 <= PP126X0Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w1_0 <= PP126X0Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w2_1 <= PP126X0Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w3_1 <= PP126X0Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   Y0X1_126_m5 <= y_m5b126_0 & x_m5b126_1;
   PP_m5_126X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F700_uid128  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_126_m5,
                 Y => PP126X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w2_2 <= PP126X1Y0_m5(1); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w3_2 <= PP126X1Y0_m5(2); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w4_3 <= PP126X1Y0_m5(3); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w5_4 <= PP126X1Y0_m5(4); -- cycle= 0 cp= 3.7852e-10
   heap_bh6_w6_4 <= PP126X1Y0_m5(5); -- cycle= 0 cp= 3.7852e-10

   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch0_0 <= std_logic_vector(unsigned("" & XX_m5(52 downto 29) & "") * unsigned("" & YY_m5(52 downto 36) & ""));
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh6_w105_0 <= DSP_bh6_ch0_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w104_0 <= DSP_bh6_ch0_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w103_0 <= DSP_bh6_ch0_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w102_0 <= DSP_bh6_ch0_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w101_0 <= DSP_bh6_ch0_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w100_0 <= DSP_bh6_ch0_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w99_0 <= DSP_bh6_ch0_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w98_0 <= DSP_bh6_ch0_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w97_0 <= DSP_bh6_ch0_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w96_0 <= DSP_bh6_ch0_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w95_0 <= DSP_bh6_ch0_0_d1(30); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w94_0 <= DSP_bh6_ch0_0_d1(29); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w93_0 <= DSP_bh6_ch0_0_d1(28); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w92_0 <= DSP_bh6_ch0_0_d1(27); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w91_0 <= DSP_bh6_ch0_0_d1(26); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w90_0 <= DSP_bh6_ch0_0_d1(25); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w89_0 <= DSP_bh6_ch0_0_d1(24); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w88_0 <= DSP_bh6_ch0_0_d1(23); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w87_0 <= DSP_bh6_ch0_0_d1(22); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w86_0 <= DSP_bh6_ch0_0_d1(21); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w85_0 <= DSP_bh6_ch0_0_d1(20); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w84_0 <= DSP_bh6_ch0_0_d1(19); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w83_0 <= DSP_bh6_ch0_0_d1(18); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w82_0 <= DSP_bh6_ch0_0_d1(17); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w81_0 <= DSP_bh6_ch0_0_d1(16); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w80_0 <= DSP_bh6_ch0_0_d1(15); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w79_0 <= DSP_bh6_ch0_0_d1(14); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w78_0 <= DSP_bh6_ch0_0_d1(13); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w77_0 <= DSP_bh6_ch0_0_d1(12); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w76_0 <= DSP_bh6_ch0_0_d1(11); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w75_0 <= DSP_bh6_ch0_0_d1(10); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w74_0 <= DSP_bh6_ch0_0_d1(9); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w73_0 <= DSP_bh6_ch0_0_d1(8); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w72_0 <= DSP_bh6_ch0_0_d1(7); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w71_0 <= DSP_bh6_ch0_0_d1(6); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w70_0 <= DSP_bh6_ch0_0_d1(5); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w69_0 <= DSP_bh6_ch0_0_d1(4); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w68_0 <= DSP_bh6_ch0_0_d1(3); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w67_0 <= DSP_bh6_ch0_0_d1(2); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w66_0 <= DSP_bh6_ch0_0_d1(1); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w65_0 <= DSP_bh6_ch0_0_d1(0); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch1_0 <= std_logic_vector(unsigned("" & XX_m5(28 downto 5) & "") * unsigned("" & YY_m5(52 downto 36) & ""));
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh6_w81_1 <= DSP_bh6_ch1_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w80_1 <= DSP_bh6_ch1_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w79_1 <= DSP_bh6_ch1_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w78_1 <= DSP_bh6_ch1_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w77_1 <= DSP_bh6_ch1_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w76_1 <= DSP_bh6_ch1_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w75_1 <= DSP_bh6_ch1_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w74_1 <= DSP_bh6_ch1_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w73_1 <= DSP_bh6_ch1_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w72_1 <= DSP_bh6_ch1_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w71_1 <= DSP_bh6_ch1_0_d1(30); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w70_1 <= DSP_bh6_ch1_0_d1(29); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w69_1 <= DSP_bh6_ch1_0_d1(28); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w68_1 <= DSP_bh6_ch1_0_d1(27); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w67_1 <= DSP_bh6_ch1_0_d1(26); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w66_1 <= DSP_bh6_ch1_0_d1(25); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w65_1 <= DSP_bh6_ch1_0_d1(24); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w64_0 <= DSP_bh6_ch1_0_d1(23); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w63_0 <= DSP_bh6_ch1_0_d1(22); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w62_0 <= DSP_bh6_ch1_0_d1(21); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w61_0 <= DSP_bh6_ch1_0_d1(20); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w60_0 <= DSP_bh6_ch1_0_d1(19); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w59_0 <= DSP_bh6_ch1_0_d1(18); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w58_0 <= DSP_bh6_ch1_0_d1(17); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w57_1 <= DSP_bh6_ch1_0_d1(16); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w56_1 <= DSP_bh6_ch1_0_d1(15); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w55_1 <= DSP_bh6_ch1_0_d1(14); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w54_4 <= DSP_bh6_ch1_0_d1(13); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w53_4 <= DSP_bh6_ch1_0_d1(12); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w52_4 <= DSP_bh6_ch1_0_d1(11); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w51_6 <= DSP_bh6_ch1_0_d1(10); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w50_6 <= DSP_bh6_ch1_0_d1(9); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w49_4 <= DSP_bh6_ch1_0_d1(8); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w48_6 <= DSP_bh6_ch1_0_d1(7); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w47_6 <= DSP_bh6_ch1_0_d1(6); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w46_4 <= DSP_bh6_ch1_0_d1(5); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w45_6 <= DSP_bh6_ch1_0_d1(4); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w44_6 <= DSP_bh6_ch1_0_d1(3); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w43_4 <= DSP_bh6_ch1_0_d1(2); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w42_6 <= DSP_bh6_ch1_0_d1(1); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w41_6 <= DSP_bh6_ch1_0_d1(0); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch2_0 <= std_logic_vector(unsigned("" & XX_m5(52 downto 29) & "") * unsigned("" & YY_m5(35 downto 19) & ""));
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh6_w88_1 <= DSP_bh6_ch2_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w87_1 <= DSP_bh6_ch2_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w86_1 <= DSP_bh6_ch2_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w85_1 <= DSP_bh6_ch2_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w84_1 <= DSP_bh6_ch2_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w83_1 <= DSP_bh6_ch2_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w82_1 <= DSP_bh6_ch2_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w81_2 <= DSP_bh6_ch2_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w80_2 <= DSP_bh6_ch2_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w79_2 <= DSP_bh6_ch2_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w78_2 <= DSP_bh6_ch2_0_d1(30); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w77_2 <= DSP_bh6_ch2_0_d1(29); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w76_2 <= DSP_bh6_ch2_0_d1(28); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w75_2 <= DSP_bh6_ch2_0_d1(27); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w74_2 <= DSP_bh6_ch2_0_d1(26); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w73_2 <= DSP_bh6_ch2_0_d1(25); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w72_2 <= DSP_bh6_ch2_0_d1(24); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w71_2 <= DSP_bh6_ch2_0_d1(23); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w70_2 <= DSP_bh6_ch2_0_d1(22); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w69_2 <= DSP_bh6_ch2_0_d1(21); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w68_2 <= DSP_bh6_ch2_0_d1(20); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w67_2 <= DSP_bh6_ch2_0_d1(19); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w66_2 <= DSP_bh6_ch2_0_d1(18); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w65_2 <= DSP_bh6_ch2_0_d1(17); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w64_1 <= DSP_bh6_ch2_0_d1(16); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w63_1 <= DSP_bh6_ch2_0_d1(15); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w62_1 <= DSP_bh6_ch2_0_d1(14); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w61_1 <= DSP_bh6_ch2_0_d1(13); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w60_1 <= DSP_bh6_ch2_0_d1(12); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w59_1 <= DSP_bh6_ch2_0_d1(11); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w58_1 <= DSP_bh6_ch2_0_d1(10); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w57_2 <= DSP_bh6_ch2_0_d1(9); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w56_2 <= DSP_bh6_ch2_0_d1(8); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w55_2 <= DSP_bh6_ch2_0_d1(7); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w54_5 <= DSP_bh6_ch2_0_d1(6); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w53_5 <= DSP_bh6_ch2_0_d1(5); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w52_5 <= DSP_bh6_ch2_0_d1(4); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w51_7 <= DSP_bh6_ch2_0_d1(3); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w50_7 <= DSP_bh6_ch2_0_d1(2); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w49_5 <= DSP_bh6_ch2_0_d1(1); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w48_7 <= DSP_bh6_ch2_0_d1(0); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch3_0 <= std_logic_vector(unsigned("" & XX_m5(28 downto 5) & "") * unsigned("" & YY_m5(35 downto 19) & ""));
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh6_w64_2 <= DSP_bh6_ch3_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w63_2 <= DSP_bh6_ch3_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w62_2 <= DSP_bh6_ch3_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w61_2 <= DSP_bh6_ch3_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w60_2 <= DSP_bh6_ch3_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w59_2 <= DSP_bh6_ch3_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w58_2 <= DSP_bh6_ch3_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w57_3 <= DSP_bh6_ch3_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w56_3 <= DSP_bh6_ch3_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w55_3 <= DSP_bh6_ch3_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w54_6 <= DSP_bh6_ch3_0_d1(30); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w53_6 <= DSP_bh6_ch3_0_d1(29); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w52_6 <= DSP_bh6_ch3_0_d1(28); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w51_8 <= DSP_bh6_ch3_0_d1(27); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w50_8 <= DSP_bh6_ch3_0_d1(26); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w49_6 <= DSP_bh6_ch3_0_d1(25); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w48_8 <= DSP_bh6_ch3_0_d1(24); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w47_7 <= DSP_bh6_ch3_0_d1(23); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w46_5 <= DSP_bh6_ch3_0_d1(22); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w45_7 <= DSP_bh6_ch3_0_d1(21); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w44_7 <= DSP_bh6_ch3_0_d1(20); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w43_5 <= DSP_bh6_ch3_0_d1(19); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w42_7 <= DSP_bh6_ch3_0_d1(18); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w41_7 <= DSP_bh6_ch3_0_d1(17); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w40_5 <= DSP_bh6_ch3_0_d1(16); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w39_6 <= DSP_bh6_ch3_0_d1(15); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w38_6 <= DSP_bh6_ch3_0_d1(14); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w37_5 <= DSP_bh6_ch3_0_d1(13); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w36_6 <= DSP_bh6_ch3_0_d1(12); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w35_5 <= DSP_bh6_ch3_0_d1(11); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w34_5 <= DSP_bh6_ch3_0_d1(10); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w33_6 <= DSP_bh6_ch3_0_d1(9); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w32_5 <= DSP_bh6_ch3_0_d1(8); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w31_5 <= DSP_bh6_ch3_0_d1(7); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w30_6 <= DSP_bh6_ch3_0_d1(6); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w29_5 <= DSP_bh6_ch3_0_d1(5); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w28_5 <= DSP_bh6_ch3_0_d1(4); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w27_6 <= DSP_bh6_ch3_0_d1(3); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w26_5 <= DSP_bh6_ch3_0_d1(2); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w25_5 <= DSP_bh6_ch3_0_d1(1); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w24_6 <= DSP_bh6_ch3_0_d1(0); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch4_0 <= std_logic_vector(unsigned("" & XX_m5(52 downto 29) & "") * unsigned("" & YY_m5(18 downto 2) & ""));
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh6_w71_3 <= DSP_bh6_ch4_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w70_3 <= DSP_bh6_ch4_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w69_3 <= DSP_bh6_ch4_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w68_3 <= DSP_bh6_ch4_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w67_3 <= DSP_bh6_ch4_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w66_3 <= DSP_bh6_ch4_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w65_3 <= DSP_bh6_ch4_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w64_3 <= DSP_bh6_ch4_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w63_3 <= DSP_bh6_ch4_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w62_3 <= DSP_bh6_ch4_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w61_3 <= DSP_bh6_ch4_0_d1(30); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w60_3 <= DSP_bh6_ch4_0_d1(29); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w59_3 <= DSP_bh6_ch4_0_d1(28); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w58_3 <= DSP_bh6_ch4_0_d1(27); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w57_4 <= DSP_bh6_ch4_0_d1(26); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w56_4 <= DSP_bh6_ch4_0_d1(25); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w55_4 <= DSP_bh6_ch4_0_d1(24); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w54_7 <= DSP_bh6_ch4_0_d1(23); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w53_7 <= DSP_bh6_ch4_0_d1(22); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w52_7 <= DSP_bh6_ch4_0_d1(21); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w51_9 <= DSP_bh6_ch4_0_d1(20); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w50_9 <= DSP_bh6_ch4_0_d1(19); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w49_7 <= DSP_bh6_ch4_0_d1(18); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w48_9 <= DSP_bh6_ch4_0_d1(17); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w47_8 <= DSP_bh6_ch4_0_d1(16); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w46_6 <= DSP_bh6_ch4_0_d1(15); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w45_8 <= DSP_bh6_ch4_0_d1(14); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w44_8 <= DSP_bh6_ch4_0_d1(13); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w43_6 <= DSP_bh6_ch4_0_d1(12); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w42_8 <= DSP_bh6_ch4_0_d1(11); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w41_8 <= DSP_bh6_ch4_0_d1(10); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w40_6 <= DSP_bh6_ch4_0_d1(9); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w39_7 <= DSP_bh6_ch4_0_d1(8); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w38_7 <= DSP_bh6_ch4_0_d1(7); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w37_6 <= DSP_bh6_ch4_0_d1(6); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w36_7 <= DSP_bh6_ch4_0_d1(5); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w35_6 <= DSP_bh6_ch4_0_d1(4); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w34_6 <= DSP_bh6_ch4_0_d1(3); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w33_7 <= DSP_bh6_ch4_0_d1(2); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w32_6 <= DSP_bh6_ch4_0_d1(1); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w31_6 <= DSP_bh6_ch4_0_d1(0); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch5_0 <= std_logic_vector(unsigned("" & XX_m5(28 downto 5) & "") * unsigned("" & YY_m5(18 downto 2) & ""));
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh6_w47_9 <= DSP_bh6_ch5_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w46_7 <= DSP_bh6_ch5_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w45_9 <= DSP_bh6_ch5_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w44_9 <= DSP_bh6_ch5_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w43_7 <= DSP_bh6_ch5_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w42_9 <= DSP_bh6_ch5_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w41_9 <= DSP_bh6_ch5_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w40_7 <= DSP_bh6_ch5_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w39_8 <= DSP_bh6_ch5_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w38_8 <= DSP_bh6_ch5_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w37_7 <= DSP_bh6_ch5_0_d1(30); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w36_8 <= DSP_bh6_ch5_0_d1(29); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w35_7 <= DSP_bh6_ch5_0_d1(28); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w34_7 <= DSP_bh6_ch5_0_d1(27); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w33_8 <= DSP_bh6_ch5_0_d1(26); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w32_7 <= DSP_bh6_ch5_0_d1(25); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w31_7 <= DSP_bh6_ch5_0_d1(24); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w30_7 <= DSP_bh6_ch5_0_d1(23); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w29_6 <= DSP_bh6_ch5_0_d1(22); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w28_6 <= DSP_bh6_ch5_0_d1(21); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w27_7 <= DSP_bh6_ch5_0_d1(20); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w26_6 <= DSP_bh6_ch5_0_d1(19); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w25_6 <= DSP_bh6_ch5_0_d1(18); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w24_7 <= DSP_bh6_ch5_0_d1(17); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w23_6 <= DSP_bh6_ch5_0_d1(16); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w22_5 <= DSP_bh6_ch5_0_d1(15); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w21_6 <= DSP_bh6_ch5_0_d1(14); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w20_6 <= DSP_bh6_ch5_0_d1(13); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w19_5 <= DSP_bh6_ch5_0_d1(12); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w18_5 <= DSP_bh6_ch5_0_d1(11); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w17_6 <= DSP_bh6_ch5_0_d1(10); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w16_5 <= DSP_bh6_ch5_0_d1(9); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w15_5 <= DSP_bh6_ch5_0_d1(8); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w14_6 <= DSP_bh6_ch5_0_d1(7); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w13_5 <= DSP_bh6_ch5_0_d1(6); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w12_5 <= DSP_bh6_ch5_0_d1(5); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w11_6 <= DSP_bh6_ch5_0_d1(4); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w10_5 <= DSP_bh6_ch5_0_d1(3); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w9_5 <= DSP_bh6_ch5_0_d1(2); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w8_6 <= DSP_bh6_ch5_0_d1(1); -- cycle= 1 cp= 2.09429e-10
   heap_bh6_w7_5 <= DSP_bh6_ch5_0_d1(0); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
      -- All the constant bits are zero, nothing to add

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh6_0 <= heap_bh6_w1_0 & heap_bh6_w0_0; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_0_0 <= heap_bh6_w8_3 & heap_bh6_w8_2 & heap_bh6_w8_1 & heap_bh6_w8_0 & heap_bh6_w8_5 & heap_bh6_w8_4;
   Compressor_bh6_0: Compressor_6_3
      port map ( R => CompressorOut_bh6_0_0   ,
                 X0 => CompressorIn_bh6_0_0);
   heap_bh6_w8_7 <= CompressorOut_bh6_0_0(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w9_6 <= CompressorOut_bh6_0_0(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w10_6 <= CompressorOut_bh6_0_0(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_1_1 <= heap_bh6_w11_3 & heap_bh6_w11_2 & heap_bh6_w11_1 & heap_bh6_w11_0 & heap_bh6_w11_5 & heap_bh6_w11_4;
   Compressor_bh6_1: Compressor_6_3
      port map ( R => CompressorOut_bh6_1_1   ,
                 X0 => CompressorIn_bh6_1_1);
   heap_bh6_w11_7 <= CompressorOut_bh6_1_1(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w12_6 <= CompressorOut_bh6_1_1(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w13_6 <= CompressorOut_bh6_1_1(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_2_2 <= heap_bh6_w14_3 & heap_bh6_w14_2 & heap_bh6_w14_1 & heap_bh6_w14_0 & heap_bh6_w14_5 & heap_bh6_w14_4;
   Compressor_bh6_2: Compressor_6_3
      port map ( R => CompressorOut_bh6_2_2   ,
                 X0 => CompressorIn_bh6_2_2);
   heap_bh6_w14_7 <= CompressorOut_bh6_2_2(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w15_6 <= CompressorOut_bh6_2_2(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w16_6 <= CompressorOut_bh6_2_2(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_3_3 <= heap_bh6_w17_3 & heap_bh6_w17_2 & heap_bh6_w17_1 & heap_bh6_w17_0 & heap_bh6_w17_5 & heap_bh6_w17_4;
   Compressor_bh6_3: Compressor_6_3
      port map ( R => CompressorOut_bh6_3_3   ,
                 X0 => CompressorIn_bh6_3_3);
   heap_bh6_w17_7 <= CompressorOut_bh6_3_3(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w18_6 <= CompressorOut_bh6_3_3(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w19_6 <= CompressorOut_bh6_3_3(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_4_4 <= heap_bh6_w20_3 & heap_bh6_w20_2 & heap_bh6_w20_1 & heap_bh6_w20_0 & heap_bh6_w20_5 & heap_bh6_w20_4;
   Compressor_bh6_4: Compressor_6_3
      port map ( R => CompressorOut_bh6_4_4   ,
                 X0 => CompressorIn_bh6_4_4);
   heap_bh6_w20_7 <= CompressorOut_bh6_4_4(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w21_7 <= CompressorOut_bh6_4_4(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w22_6 <= CompressorOut_bh6_4_4(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_5_5 <= heap_bh6_w21_3 & heap_bh6_w21_2 & heap_bh6_w21_1 & heap_bh6_w21_0 & heap_bh6_w21_5 & heap_bh6_w21_4;
   Compressor_bh6_5: Compressor_6_3
      port map ( R => CompressorOut_bh6_5_5   ,
                 X0 => CompressorIn_bh6_5_5);
   heap_bh6_w21_8 <= CompressorOut_bh6_5_5(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w22_7 <= CompressorOut_bh6_5_5(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w23_7 <= CompressorOut_bh6_5_5(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_6_6 <= heap_bh6_w23_3 & heap_bh6_w23_2 & heap_bh6_w23_1 & heap_bh6_w23_0 & heap_bh6_w23_5 & heap_bh6_w23_4;
   Compressor_bh6_6: Compressor_6_3
      port map ( R => CompressorOut_bh6_6_6   ,
                 X0 => CompressorIn_bh6_6_6);
   heap_bh6_w23_8 <= CompressorOut_bh6_6_6(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w24_8 <= CompressorOut_bh6_6_6(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w25_7 <= CompressorOut_bh6_6_6(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_7_7 <= heap_bh6_w24_3 & heap_bh6_w24_2 & heap_bh6_w24_1 & heap_bh6_w24_0 & heap_bh6_w24_5 & heap_bh6_w24_4;
   Compressor_bh6_7: Compressor_6_3
      port map ( R => CompressorOut_bh6_7_7   ,
                 X0 => CompressorIn_bh6_7_7);
   heap_bh6_w24_9 <= CompressorOut_bh6_7_7(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w25_8 <= CompressorOut_bh6_7_7(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w26_7 <= CompressorOut_bh6_7_7(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_8_8 <= heap_bh6_w27_3 & heap_bh6_w27_2 & heap_bh6_w27_1 & heap_bh6_w27_0 & heap_bh6_w27_5 & heap_bh6_w27_4;
   Compressor_bh6_8: Compressor_6_3
      port map ( R => CompressorOut_bh6_8_8   ,
                 X0 => CompressorIn_bh6_8_8);
   heap_bh6_w27_8 <= CompressorOut_bh6_8_8(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w28_7 <= CompressorOut_bh6_8_8(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w29_7 <= CompressorOut_bh6_8_8(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_9_9 <= heap_bh6_w30_3 & heap_bh6_w30_2 & heap_bh6_w30_1 & heap_bh6_w30_0 & heap_bh6_w30_5 & heap_bh6_w30_4;
   Compressor_bh6_9: Compressor_6_3
      port map ( R => CompressorOut_bh6_9_9   ,
                 X0 => CompressorIn_bh6_9_9);
   heap_bh6_w30_8 <= CompressorOut_bh6_9_9(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w31_8 <= CompressorOut_bh6_9_9(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w32_8 <= CompressorOut_bh6_9_9(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_10_10 <= heap_bh6_w33_3 & heap_bh6_w33_2 & heap_bh6_w33_1 & heap_bh6_w33_0 & heap_bh6_w33_5 & heap_bh6_w33_4;
   Compressor_bh6_10: Compressor_6_3
      port map ( R => CompressorOut_bh6_10_10   ,
                 X0 => CompressorIn_bh6_10_10);
   heap_bh6_w33_9 <= CompressorOut_bh6_10_10(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w34_8 <= CompressorOut_bh6_10_10(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w35_8 <= CompressorOut_bh6_10_10(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_11_11 <= heap_bh6_w36_3 & heap_bh6_w36_2 & heap_bh6_w36_1 & heap_bh6_w36_0 & heap_bh6_w36_5 & heap_bh6_w36_4;
   Compressor_bh6_11: Compressor_6_3
      port map ( R => CompressorOut_bh6_11_11   ,
                 X0 => CompressorIn_bh6_11_11);
   heap_bh6_w36_9 <= CompressorOut_bh6_11_11(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w37_8 <= CompressorOut_bh6_11_11(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w38_9 <= CompressorOut_bh6_11_11(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_12_12 <= heap_bh6_w38_3 & heap_bh6_w38_2 & heap_bh6_w38_1 & heap_bh6_w38_0 & heap_bh6_w38_5 & heap_bh6_w38_4;
   Compressor_bh6_12: Compressor_6_3
      port map ( R => CompressorOut_bh6_12_12   ,
                 X0 => CompressorIn_bh6_12_12);
   heap_bh6_w38_10 <= CompressorOut_bh6_12_12(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w39_9 <= CompressorOut_bh6_12_12(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w40_8 <= CompressorOut_bh6_12_12(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_13_13 <= heap_bh6_w39_3 & heap_bh6_w39_2 & heap_bh6_w39_1 & heap_bh6_w39_0 & heap_bh6_w39_5 & heap_bh6_w39_4;
   Compressor_bh6_13: Compressor_6_3
      port map ( R => CompressorOut_bh6_13_13   ,
                 X0 => CompressorIn_bh6_13_13);
   heap_bh6_w39_10 <= CompressorOut_bh6_13_13(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w40_9 <= CompressorOut_bh6_13_13(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w41_10 <= CompressorOut_bh6_13_13(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_14_14 <= heap_bh6_w41_3 & heap_bh6_w41_2 & heap_bh6_w41_1 & heap_bh6_w41_0 & heap_bh6_w41_5 & heap_bh6_w41_4;
   Compressor_bh6_14: Compressor_6_3
      port map ( R => CompressorOut_bh6_14_14   ,
                 X0 => CompressorIn_bh6_14_14);
   heap_bh6_w41_11 <= CompressorOut_bh6_14_14(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w42_10 <= CompressorOut_bh6_14_14(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w43_8 <= CompressorOut_bh6_14_14(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_15_15 <= heap_bh6_w42_3 & heap_bh6_w42_2 & heap_bh6_w42_1 & heap_bh6_w42_0 & heap_bh6_w42_5 & heap_bh6_w42_4;
   Compressor_bh6_15: Compressor_6_3
      port map ( R => CompressorOut_bh6_15_15   ,
                 X0 => CompressorIn_bh6_15_15);
   heap_bh6_w42_11 <= CompressorOut_bh6_15_15(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w43_9 <= CompressorOut_bh6_15_15(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w44_10 <= CompressorOut_bh6_15_15(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_16_16 <= heap_bh6_w44_3 & heap_bh6_w44_2 & heap_bh6_w44_1 & heap_bh6_w44_0 & heap_bh6_w44_5 & heap_bh6_w44_4;
   Compressor_bh6_16: Compressor_6_3
      port map ( R => CompressorOut_bh6_16_16   ,
                 X0 => CompressorIn_bh6_16_16);
   heap_bh6_w44_11 <= CompressorOut_bh6_16_16(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w45_10 <= CompressorOut_bh6_16_16(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w46_8 <= CompressorOut_bh6_16_16(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_17_17 <= heap_bh6_w45_3 & heap_bh6_w45_2 & heap_bh6_w45_1 & heap_bh6_w45_0 & heap_bh6_w45_5 & heap_bh6_w45_4;
   Compressor_bh6_17: Compressor_6_3
      port map ( R => CompressorOut_bh6_17_17   ,
                 X0 => CompressorIn_bh6_17_17);
   heap_bh6_w45_11 <= CompressorOut_bh6_17_17(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w46_9 <= CompressorOut_bh6_17_17(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w47_10 <= CompressorOut_bh6_17_17(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_18_18 <= heap_bh6_w47_3 & heap_bh6_w47_2 & heap_bh6_w47_1 & heap_bh6_w47_0 & heap_bh6_w47_5 & heap_bh6_w47_4;
   Compressor_bh6_18: Compressor_6_3
      port map ( R => CompressorOut_bh6_18_18   ,
                 X0 => CompressorIn_bh6_18_18);
   heap_bh6_w47_11 <= CompressorOut_bh6_18_18(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w48_10 <= CompressorOut_bh6_18_18(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w49_8 <= CompressorOut_bh6_18_18(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_19_19 <= heap_bh6_w48_3 & heap_bh6_w48_2 & heap_bh6_w48_1 & heap_bh6_w48_0 & heap_bh6_w48_5 & heap_bh6_w48_4;
   Compressor_bh6_19: Compressor_6_3
      port map ( R => CompressorOut_bh6_19_19   ,
                 X0 => CompressorIn_bh6_19_19);
   heap_bh6_w48_11 <= CompressorOut_bh6_19_19(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w49_9 <= CompressorOut_bh6_19_19(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w50_10 <= CompressorOut_bh6_19_19(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_20_20 <= heap_bh6_w50_3 & heap_bh6_w50_2 & heap_bh6_w50_1 & heap_bh6_w50_0 & heap_bh6_w50_5 & heap_bh6_w50_4;
   Compressor_bh6_20: Compressor_6_3
      port map ( R => CompressorOut_bh6_20_20   ,
                 X0 => CompressorIn_bh6_20_20);
   heap_bh6_w50_11 <= CompressorOut_bh6_20_20(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w51_10 <= CompressorOut_bh6_20_20(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w52_8 <= CompressorOut_bh6_20_20(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_21_21 <= heap_bh6_w51_3 & heap_bh6_w51_2 & heap_bh6_w51_1 & heap_bh6_w51_0 & heap_bh6_w51_5 & heap_bh6_w51_4;
   Compressor_bh6_21: Compressor_6_3
      port map ( R => CompressorOut_bh6_21_21   ,
                 X0 => CompressorIn_bh6_21_21);
   heap_bh6_w51_11 <= CompressorOut_bh6_21_21(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w52_9 <= CompressorOut_bh6_21_21(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w53_8 <= CompressorOut_bh6_21_21(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_22_22 <= heap_bh6_w4_3 & heap_bh6_w4_2 & heap_bh6_w4_1 & heap_bh6_w4_0;
   CompressorIn_bh6_22_23(0) <= heap_bh6_w5_4;
   Compressor_bh6_22: Compressor_14_3
      port map ( R => CompressorOut_bh6_22_22   ,
                 X0 => CompressorIn_bh6_22_22,
                 X1 => CompressorIn_bh6_22_23);
   heap_bh6_w4_4 <= CompressorOut_bh6_22_22(0); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w5_5 <= CompressorOut_bh6_22_22(1); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w6_5 <= CompressorOut_bh6_22_22(2); -- cycle= 0 cp= 7.5078e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_23_24 <= heap_bh6_w5_2 & heap_bh6_w5_1 & heap_bh6_w5_0 & heap_bh6_w5_3;
   CompressorIn_bh6_23_25(0) <= heap_bh6_w6_4;
   Compressor_bh6_23: Compressor_14_3
      port map ( R => CompressorOut_bh6_23_23   ,
                 X0 => CompressorIn_bh6_23_24,
                 X1 => CompressorIn_bh6_23_25);
   heap_bh6_w5_6 <= CompressorOut_bh6_23_23(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w6_6 <= CompressorOut_bh6_23_23(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w7_6 <= CompressorOut_bh6_23_23(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_24_26 <= heap_bh6_w6_2 & heap_bh6_w6_1 & heap_bh6_w6_0 & heap_bh6_w6_3;
   CompressorIn_bh6_24_27(0) <= heap_bh6_w7_3;
   Compressor_bh6_24: Compressor_14_3
      port map ( R => CompressorOut_bh6_24_24   ,
                 X0 => CompressorIn_bh6_24_26,
                 X1 => CompressorIn_bh6_24_27);
   heap_bh6_w6_7 <= CompressorOut_bh6_24_24(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w7_7 <= CompressorOut_bh6_24_24(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w8_8 <= CompressorOut_bh6_24_24(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_25_28 <= heap_bh6_w9_2 & heap_bh6_w9_1 & heap_bh6_w9_0 & heap_bh6_w9_4;
   CompressorIn_bh6_25_29(0) <= heap_bh6_w10_3;
   Compressor_bh6_25: Compressor_14_3
      port map ( R => CompressorOut_bh6_25_25   ,
                 X0 => CompressorIn_bh6_25_28,
                 X1 => CompressorIn_bh6_25_29);
   heap_bh6_w9_7 <= CompressorOut_bh6_25_25(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w10_7 <= CompressorOut_bh6_25_25(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w11_8 <= CompressorOut_bh6_25_25(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_26_30 <= heap_bh6_w12_2 & heap_bh6_w12_1 & heap_bh6_w12_0 & heap_bh6_w12_4;
   CompressorIn_bh6_26_31(0) <= heap_bh6_w13_3;
   Compressor_bh6_26: Compressor_14_3
      port map ( R => CompressorOut_bh6_26_26   ,
                 X0 => CompressorIn_bh6_26_30,
                 X1 => CompressorIn_bh6_26_31);
   heap_bh6_w12_7 <= CompressorOut_bh6_26_26(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w13_7 <= CompressorOut_bh6_26_26(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w14_8 <= CompressorOut_bh6_26_26(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_27_32 <= heap_bh6_w15_2 & heap_bh6_w15_1 & heap_bh6_w15_0 & heap_bh6_w15_4;
   CompressorIn_bh6_27_33(0) <= heap_bh6_w16_3;
   Compressor_bh6_27: Compressor_14_3
      port map ( R => CompressorOut_bh6_27_27   ,
                 X0 => CompressorIn_bh6_27_32,
                 X1 => CompressorIn_bh6_27_33);
   heap_bh6_w15_7 <= CompressorOut_bh6_27_27(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w16_7 <= CompressorOut_bh6_27_27(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w17_8 <= CompressorOut_bh6_27_27(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_28_34 <= heap_bh6_w18_2 & heap_bh6_w18_1 & heap_bh6_w18_0 & heap_bh6_w18_4;
   CompressorIn_bh6_28_35(0) <= heap_bh6_w19_3;
   Compressor_bh6_28: Compressor_14_3
      port map ( R => CompressorOut_bh6_28_28   ,
                 X0 => CompressorIn_bh6_28_34,
                 X1 => CompressorIn_bh6_28_35);
   heap_bh6_w18_7 <= CompressorOut_bh6_28_28(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w19_7 <= CompressorOut_bh6_28_28(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w20_8 <= CompressorOut_bh6_28_28(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_29_36 <= heap_bh6_w25_3 & heap_bh6_w25_2 & heap_bh6_w25_1 & heap_bh6_w25_0;
   CompressorIn_bh6_29_37(0) <= heap_bh6_w26_2;
   Compressor_bh6_29: Compressor_14_3
      port map ( R => CompressorOut_bh6_29_29   ,
                 X0 => CompressorIn_bh6_29_36,
                 X1 => CompressorIn_bh6_29_37);
   heap_bh6_w25_9 <= CompressorOut_bh6_29_29(0); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w26_8 <= CompressorOut_bh6_29_29(1); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w27_9 <= CompressorOut_bh6_29_29(2); -- cycle= 0 cp= 7.5078e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_30_38 <= heap_bh6_w28_3 & heap_bh6_w28_2 & heap_bh6_w28_1 & heap_bh6_w28_0;
   CompressorIn_bh6_30_39(0) <= heap_bh6_w29_2;
   Compressor_bh6_30: Compressor_14_3
      port map ( R => CompressorOut_bh6_30_30   ,
                 X0 => CompressorIn_bh6_30_38,
                 X1 => CompressorIn_bh6_30_39);
   heap_bh6_w28_8 <= CompressorOut_bh6_30_30(0); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w29_8 <= CompressorOut_bh6_30_30(1); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w30_9 <= CompressorOut_bh6_30_30(2); -- cycle= 0 cp= 7.5078e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_31_40 <= heap_bh6_w31_3 & heap_bh6_w31_2 & heap_bh6_w31_1 & heap_bh6_w31_0;
   CompressorIn_bh6_31_41(0) <= heap_bh6_w32_2;
   Compressor_bh6_31: Compressor_14_3
      port map ( R => CompressorOut_bh6_31_31   ,
                 X0 => CompressorIn_bh6_31_40,
                 X1 => CompressorIn_bh6_31_41);
   heap_bh6_w31_9 <= CompressorOut_bh6_31_31(0); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w32_9 <= CompressorOut_bh6_31_31(1); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w33_10 <= CompressorOut_bh6_31_31(2); -- cycle= 0 cp= 7.5078e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_32_42 <= heap_bh6_w34_3 & heap_bh6_w34_2 & heap_bh6_w34_1 & heap_bh6_w34_0;
   CompressorIn_bh6_32_43(0) <= heap_bh6_w35_2;
   Compressor_bh6_32: Compressor_14_3
      port map ( R => CompressorOut_bh6_32_32   ,
                 X0 => CompressorIn_bh6_32_42,
                 X1 => CompressorIn_bh6_32_43);
   heap_bh6_w34_9 <= CompressorOut_bh6_32_32(0); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w35_9 <= CompressorOut_bh6_32_32(1); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w36_10 <= CompressorOut_bh6_32_32(2); -- cycle= 0 cp= 7.5078e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_33_44 <= heap_bh6_w52_2 & heap_bh6_w52_1 & heap_bh6_w52_0 & heap_bh6_w52_3;
   CompressorIn_bh6_33_45(0) <= heap_bh6_w53_2;
   Compressor_bh6_33: Compressor_14_3
      port map ( R => CompressorOut_bh6_33_33   ,
                 X0 => CompressorIn_bh6_33_44,
                 X1 => CompressorIn_bh6_33_45);
   heap_bh6_w52_10 <= CompressorOut_bh6_33_33(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w53_9 <= CompressorOut_bh6_33_33(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w54_8 <= CompressorOut_bh6_33_33(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_34_46 <= heap_bh6_w54_2 & heap_bh6_w54_1 & heap_bh6_w54_0 & heap_bh6_w54_3;
   CompressorIn_bh6_34_47(0) <= heap_bh6_w55_0;
   Compressor_bh6_34: Compressor_14_3
      port map ( R => CompressorOut_bh6_34_34   ,
                 X0 => CompressorIn_bh6_34_46,
                 X1 => CompressorIn_bh6_34_47);
   heap_bh6_w54_9 <= CompressorOut_bh6_34_34(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w55_5 <= CompressorOut_bh6_34_34(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w56_5 <= CompressorOut_bh6_34_34(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_35_48 <= heap_bh6_w22_3 & heap_bh6_w22_2 & heap_bh6_w22_1 & heap_bh6_w22_0 & heap_bh6_w22_4;
   Compressor_bh6_35: Compressor_5_3
      port map ( R => CompressorOut_bh6_35_35   ,
                 X0 => CompressorIn_bh6_35_48);
   heap_bh6_w22_8 <= CompressorOut_bh6_35_35(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w23_9 <= CompressorOut_bh6_35_35(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w24_10 <= CompressorOut_bh6_35_35(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_36_49 <= heap_bh6_w37_3 & heap_bh6_w37_2 & heap_bh6_w37_1 & heap_bh6_w37_0 & heap_bh6_w37_4;
   Compressor_bh6_36: Compressor_5_3
      port map ( R => CompressorOut_bh6_36_36   ,
                 X0 => CompressorIn_bh6_36_49);
   heap_bh6_w37_9 <= CompressorOut_bh6_36_36(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w38_11 <= CompressorOut_bh6_36_36(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w39_11 <= CompressorOut_bh6_36_36(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_37_50 <= heap_bh6_w40_3 & heap_bh6_w40_2 & heap_bh6_w40_1 & heap_bh6_w40_0 & heap_bh6_w40_4;
   Compressor_bh6_37: Compressor_5_3
      port map ( R => CompressorOut_bh6_37_37   ,
                 X0 => CompressorIn_bh6_37_50);
   heap_bh6_w40_10 <= CompressorOut_bh6_37_37(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w41_12 <= CompressorOut_bh6_37_37(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w42_12 <= CompressorOut_bh6_37_37(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_38_51 <= heap_bh6_w7_2 & heap_bh6_w7_1 & heap_bh6_w7_0 & heap_bh6_w7_4;
   Compressor_bh6_38: Compressor_4_3
      port map ( R => CompressorOut_bh6_38_38   ,
                 X0 => CompressorIn_bh6_38_51);
   heap_bh6_w7_8 <= CompressorOut_bh6_38_38(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w8_9 <= CompressorOut_bh6_38_38(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w9_8 <= CompressorOut_bh6_38_38(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_39_52 <= heap_bh6_w10_2 & heap_bh6_w10_1 & heap_bh6_w10_0 & heap_bh6_w10_4;
   Compressor_bh6_39: Compressor_4_3
      port map ( R => CompressorOut_bh6_39_39   ,
                 X0 => CompressorIn_bh6_39_52);
   heap_bh6_w10_8 <= CompressorOut_bh6_39_39(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w11_9 <= CompressorOut_bh6_39_39(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w12_8 <= CompressorOut_bh6_39_39(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_40_53 <= heap_bh6_w13_2 & heap_bh6_w13_1 & heap_bh6_w13_0 & heap_bh6_w13_4;
   Compressor_bh6_40: Compressor_4_3
      port map ( R => CompressorOut_bh6_40_40   ,
                 X0 => CompressorIn_bh6_40_53);
   heap_bh6_w13_8 <= CompressorOut_bh6_40_40(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w14_9 <= CompressorOut_bh6_40_40(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w15_8 <= CompressorOut_bh6_40_40(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_41_54 <= heap_bh6_w16_2 & heap_bh6_w16_1 & heap_bh6_w16_0 & heap_bh6_w16_4;
   Compressor_bh6_41: Compressor_4_3
      port map ( R => CompressorOut_bh6_41_41   ,
                 X0 => CompressorIn_bh6_41_54);
   heap_bh6_w16_8 <= CompressorOut_bh6_41_41(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w17_9 <= CompressorOut_bh6_41_41(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w18_8 <= CompressorOut_bh6_41_41(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_42_55 <= heap_bh6_w19_2 & heap_bh6_w19_1 & heap_bh6_w19_0 & heap_bh6_w19_4;
   Compressor_bh6_42: Compressor_4_3
      port map ( R => CompressorOut_bh6_42_42   ,
                 X0 => CompressorIn_bh6_42_55);
   heap_bh6_w19_8 <= CompressorOut_bh6_42_42(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w20_9 <= CompressorOut_bh6_42_42(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w21_9 <= CompressorOut_bh6_42_42(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_43_56 <= heap_bh6_w26_1 & heap_bh6_w26_0 & heap_bh6_w26_4 & heap_bh6_w26_3;
   Compressor_bh6_43: Compressor_4_3
      port map ( R => CompressorOut_bh6_43_43   ,
                 X0 => CompressorIn_bh6_43_56);
   heap_bh6_w26_9 <= CompressorOut_bh6_43_43(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w27_10 <= CompressorOut_bh6_43_43(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w28_9 <= CompressorOut_bh6_43_43(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_44_57 <= heap_bh6_w29_1 & heap_bh6_w29_0 & heap_bh6_w29_4 & heap_bh6_w29_3;
   Compressor_bh6_44: Compressor_4_3
      port map ( R => CompressorOut_bh6_44_44   ,
                 X0 => CompressorIn_bh6_44_57);
   heap_bh6_w29_9 <= CompressorOut_bh6_44_44(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w30_10 <= CompressorOut_bh6_44_44(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w31_10 <= CompressorOut_bh6_44_44(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_45_58 <= heap_bh6_w32_1 & heap_bh6_w32_0 & heap_bh6_w32_4 & heap_bh6_w32_3;
   Compressor_bh6_45: Compressor_4_3
      port map ( R => CompressorOut_bh6_45_45   ,
                 X0 => CompressorIn_bh6_45_58);
   heap_bh6_w32_10 <= CompressorOut_bh6_45_45(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w33_11 <= CompressorOut_bh6_45_45(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w34_10 <= CompressorOut_bh6_45_45(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_46_59 <= heap_bh6_w35_1 & heap_bh6_w35_0 & heap_bh6_w35_4 & heap_bh6_w35_3;
   Compressor_bh6_46: Compressor_4_3
      port map ( R => CompressorOut_bh6_46_46   ,
                 X0 => CompressorIn_bh6_46_59);
   heap_bh6_w35_10 <= CompressorOut_bh6_46_46(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w36_11 <= CompressorOut_bh6_46_46(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w37_10 <= CompressorOut_bh6_46_46(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_47_60 <= heap_bh6_w43_2 & heap_bh6_w43_1 & heap_bh6_w43_0 & heap_bh6_w43_3;
   Compressor_bh6_47: Compressor_4_3
      port map ( R => CompressorOut_bh6_47_47   ,
                 X0 => CompressorIn_bh6_47_60);
   heap_bh6_w43_10 <= CompressorOut_bh6_47_47(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w44_12 <= CompressorOut_bh6_47_47(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w45_12 <= CompressorOut_bh6_47_47(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_48_61 <= heap_bh6_w46_2 & heap_bh6_w46_1 & heap_bh6_w46_0 & heap_bh6_w46_3;
   Compressor_bh6_48: Compressor_4_3
      port map ( R => CompressorOut_bh6_48_48   ,
                 X0 => CompressorIn_bh6_48_61);
   heap_bh6_w46_10 <= CompressorOut_bh6_48_48(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w47_12 <= CompressorOut_bh6_48_48(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w48_12 <= CompressorOut_bh6_48_48(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_49_62 <= heap_bh6_w49_2 & heap_bh6_w49_1 & heap_bh6_w49_0 & heap_bh6_w49_3;
   Compressor_bh6_49: Compressor_4_3
      port map ( R => CompressorOut_bh6_49_49   ,
                 X0 => CompressorIn_bh6_49_62);
   heap_bh6_w49_10 <= CompressorOut_bh6_49_49(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w50_12 <= CompressorOut_bh6_49_49(1); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w51_12 <= CompressorOut_bh6_49_49(2); -- cycle= 0 cp= 7.8834e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_50_63 <= heap_bh6_w2_2 & heap_bh6_w2_1 & heap_bh6_w2_0;
   CompressorIn_bh6_50_64 <= heap_bh6_w3_2 & heap_bh6_w3_1;
   Compressor_bh6_50: Compressor_23_3
      port map ( R => CompressorOut_bh6_50_50   ,
                 X0 => CompressorIn_bh6_50_63,
                 X1 => CompressorIn_bh6_50_64);
   heap_bh6_w2_3 <= CompressorOut_bh6_50_50(0); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w3_3 <= CompressorOut_bh6_50_50(1); -- cycle= 0 cp= 7.5078e-10
   heap_bh6_w4_5 <= CompressorOut_bh6_50_50(2); -- cycle= 0 cp= 7.5078e-10

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_51_65 <= heap_bh6_w53_1 & heap_bh6_w53_0 & heap_bh6_w53_3;
   Compressor_bh6_51: Compressor_3_2
      port map ( R => CompressorOut_bh6_51_51   ,
                 X0 => CompressorIn_bh6_51_65);
   heap_bh6_w53_10 <= CompressorOut_bh6_51_51(0); -- cycle= 0 cp= 7.8834e-10
   heap_bh6_w54_10 <= CompressorOut_bh6_51_51(1); -- cycle= 0 cp= 7.8834e-10
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh6_1 <= heap_bh6_w2_3; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_52_66 <= heap_bh6_w9_3_d1 & heap_bh6_w9_8_d1 & heap_bh6_w9_7_d1 & heap_bh6_w9_6_d1;
   CompressorIn_bh6_52_67(0) <= heap_bh6_w10_8_d1;
   Compressor_bh6_52: Compressor_14_3
      port map ( R => CompressorOut_bh6_52_52   ,
                 X0 => CompressorIn_bh6_52_66,
                 X1 => CompressorIn_bh6_52_67);
   heap_bh6_w9_9 <= CompressorOut_bh6_52_52(0); -- cycle= 1 cp= 0
   heap_bh6_w10_9 <= CompressorOut_bh6_52_52(1); -- cycle= 1 cp= 0
   heap_bh6_w11_10 <= CompressorOut_bh6_52_52(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_53_68 <= heap_bh6_w12_3_d1 & heap_bh6_w12_8_d1 & heap_bh6_w12_7_d1 & heap_bh6_w12_6_d1;
   CompressorIn_bh6_53_69(0) <= heap_bh6_w13_8_d1;
   Compressor_bh6_53: Compressor_14_3
      port map ( R => CompressorOut_bh6_53_53   ,
                 X0 => CompressorIn_bh6_53_68,
                 X1 => CompressorIn_bh6_53_69);
   heap_bh6_w12_9 <= CompressorOut_bh6_53_53(0); -- cycle= 1 cp= 0
   heap_bh6_w13_9 <= CompressorOut_bh6_53_53(1); -- cycle= 1 cp= 0
   heap_bh6_w14_10 <= CompressorOut_bh6_53_53(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_54_70 <= heap_bh6_w15_3_d1 & heap_bh6_w15_8_d1 & heap_bh6_w15_7_d1 & heap_bh6_w15_6_d1;
   CompressorIn_bh6_54_71(0) <= heap_bh6_w16_8_d1;
   Compressor_bh6_54: Compressor_14_3
      port map ( R => CompressorOut_bh6_54_54   ,
                 X0 => CompressorIn_bh6_54_70,
                 X1 => CompressorIn_bh6_54_71);
   heap_bh6_w15_9 <= CompressorOut_bh6_54_54(0); -- cycle= 1 cp= 0
   heap_bh6_w16_9 <= CompressorOut_bh6_54_54(1); -- cycle= 1 cp= 0
   heap_bh6_w17_10 <= CompressorOut_bh6_54_54(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_55_72 <= heap_bh6_w18_3_d1 & heap_bh6_w18_8_d1 & heap_bh6_w18_7_d1 & heap_bh6_w18_6_d1;
   CompressorIn_bh6_55_73(0) <= heap_bh6_w19_8_d1;
   Compressor_bh6_55: Compressor_14_3
      port map ( R => CompressorOut_bh6_55_55   ,
                 X0 => CompressorIn_bh6_55_72,
                 X1 => CompressorIn_bh6_55_73);
   heap_bh6_w18_9 <= CompressorOut_bh6_55_55(0); -- cycle= 1 cp= 0
   heap_bh6_w19_9 <= CompressorOut_bh6_55_55(1); -- cycle= 1 cp= 0
   heap_bh6_w20_10 <= CompressorOut_bh6_55_55(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_56_74 <= heap_bh6_w25_4_d1 & heap_bh6_w25_9_d1 & heap_bh6_w25_8_d1 & heap_bh6_w25_7_d1;
   CompressorIn_bh6_56_75(0) <= heap_bh6_w26_8_d1;
   Compressor_bh6_56: Compressor_14_3
      port map ( R => CompressorOut_bh6_56_56   ,
                 X0 => CompressorIn_bh6_56_74,
                 X1 => CompressorIn_bh6_56_75);
   heap_bh6_w25_10 <= CompressorOut_bh6_56_56(0); -- cycle= 1 cp= 0
   heap_bh6_w26_10 <= CompressorOut_bh6_56_56(1); -- cycle= 1 cp= 0
   heap_bh6_w27_11 <= CompressorOut_bh6_56_56(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_57_76 <= heap_bh6_w28_4_d1 & heap_bh6_w28_8_d1 & heap_bh6_w28_9_d1 & heap_bh6_w28_7_d1;
   CompressorIn_bh6_57_77(0) <= heap_bh6_w29_8_d1;
   Compressor_bh6_57: Compressor_14_3
      port map ( R => CompressorOut_bh6_57_57   ,
                 X0 => CompressorIn_bh6_57_76,
                 X1 => CompressorIn_bh6_57_77);
   heap_bh6_w28_10 <= CompressorOut_bh6_57_57(0); -- cycle= 1 cp= 0
   heap_bh6_w29_10 <= CompressorOut_bh6_57_57(1); -- cycle= 1 cp= 0
   heap_bh6_w30_11 <= CompressorOut_bh6_57_57(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_58_78 <= heap_bh6_w31_4_d1 & heap_bh6_w31_9_d1 & heap_bh6_w31_10_d1 & heap_bh6_w31_8_d1;
   CompressorIn_bh6_58_79(0) <= heap_bh6_w32_9_d1;
   Compressor_bh6_58: Compressor_14_3
      port map ( R => CompressorOut_bh6_58_58   ,
                 X0 => CompressorIn_bh6_58_78,
                 X1 => CompressorIn_bh6_58_79);
   heap_bh6_w31_11 <= CompressorOut_bh6_58_58(0); -- cycle= 1 cp= 0
   heap_bh6_w32_11 <= CompressorOut_bh6_58_58(1); -- cycle= 1 cp= 0
   heap_bh6_w33_12 <= CompressorOut_bh6_58_58(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_59_80 <= heap_bh6_w34_4_d1 & heap_bh6_w34_9_d1 & heap_bh6_w34_10_d1 & heap_bh6_w34_8_d1;
   CompressorIn_bh6_59_81(0) <= heap_bh6_w35_9_d1;
   Compressor_bh6_59: Compressor_14_3
      port map ( R => CompressorOut_bh6_59_59   ,
                 X0 => CompressorIn_bh6_59_80,
                 X1 => CompressorIn_bh6_59_81);
   heap_bh6_w34_11 <= CompressorOut_bh6_59_59(0); -- cycle= 1 cp= 0
   heap_bh6_w35_11 <= CompressorOut_bh6_59_59(1); -- cycle= 1 cp= 0
   heap_bh6_w36_12 <= CompressorOut_bh6_59_59(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_60_82 <= heap_bh6_w6_5_d1 & heap_bh6_w6_7_d1 & heap_bh6_w6_6_d1;
   CompressorIn_bh6_60_83 <= heap_bh6_w7_8_d1 & heap_bh6_w7_7_d1;
   Compressor_bh6_60: Compressor_23_3
      port map ( R => CompressorOut_bh6_60_60   ,
                 X0 => CompressorIn_bh6_60_82,
                 X1 => CompressorIn_bh6_60_83);
   heap_bh6_w6_8 <= CompressorOut_bh6_60_60(0); -- cycle= 1 cp= 0
   heap_bh6_w7_9 <= CompressorOut_bh6_60_60(1); -- cycle= 1 cp= 0
   heap_bh6_w8_10 <= CompressorOut_bh6_60_60(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_61_84 <= heap_bh6_w20_9_d1 & heap_bh6_w20_8_d1 & heap_bh6_w20_7_d1;
   CompressorIn_bh6_61_85 <= heap_bh6_w21_9_d1 & heap_bh6_w21_8_d1;
   Compressor_bh6_61: Compressor_23_3
      port map ( R => CompressorOut_bh6_61_61   ,
                 X0 => CompressorIn_bh6_61_84,
                 X1 => CompressorIn_bh6_61_85);
   heap_bh6_w20_11 <= CompressorOut_bh6_61_61(0); -- cycle= 1 cp= 0
   heap_bh6_w21_10 <= CompressorOut_bh6_61_61(1); -- cycle= 1 cp= 0
   heap_bh6_w22_9 <= CompressorOut_bh6_61_61(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_62_86 <= heap_bh6_w22_8_d1 & heap_bh6_w22_7_d1 & heap_bh6_w22_6_d1;
   CompressorIn_bh6_62_87 <= heap_bh6_w23_9_d1 & heap_bh6_w23_8_d1;
   Compressor_bh6_62: Compressor_23_3
      port map ( R => CompressorOut_bh6_62_62   ,
                 X0 => CompressorIn_bh6_62_86,
                 X1 => CompressorIn_bh6_62_87);
   heap_bh6_w22_10 <= CompressorOut_bh6_62_62(0); -- cycle= 1 cp= 0
   heap_bh6_w23_10 <= CompressorOut_bh6_62_62(1); -- cycle= 1 cp= 0
   heap_bh6_w24_11 <= CompressorOut_bh6_62_62(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_63_88 <= heap_bh6_w36_10_d1 & heap_bh6_w36_11_d1 & heap_bh6_w36_9_d1;
   CompressorIn_bh6_63_89 <= heap_bh6_w37_10_d1 & heap_bh6_w37_9_d1;
   Compressor_bh6_63: Compressor_23_3
      port map ( R => CompressorOut_bh6_63_63   ,
                 X0 => CompressorIn_bh6_63_88,
                 X1 => CompressorIn_bh6_63_89);
   heap_bh6_w36_13 <= CompressorOut_bh6_63_63(0); -- cycle= 1 cp= 0
   heap_bh6_w37_11 <= CompressorOut_bh6_63_63(1); -- cycle= 1 cp= 0
   heap_bh6_w38_12 <= CompressorOut_bh6_63_63(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_64_90 <= heap_bh6_w38_11_d1 & heap_bh6_w38_10_d1 & heap_bh6_w38_9_d1;
   CompressorIn_bh6_64_91 <= heap_bh6_w39_11_d1 & heap_bh6_w39_10_d1;
   Compressor_bh6_64: Compressor_23_3
      port map ( R => CompressorOut_bh6_64_64   ,
                 X0 => CompressorIn_bh6_64_90,
                 X1 => CompressorIn_bh6_64_91);
   heap_bh6_w38_13 <= CompressorOut_bh6_64_64(0); -- cycle= 1 cp= 0
   heap_bh6_w39_12 <= CompressorOut_bh6_64_64(1); -- cycle= 1 cp= 0
   heap_bh6_w40_11 <= CompressorOut_bh6_64_64(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_65_92 <= heap_bh6_w40_10_d1 & heap_bh6_w40_9_d1 & heap_bh6_w40_8_d1;
   CompressorIn_bh6_65_93 <= heap_bh6_w41_12_d1 & heap_bh6_w41_11_d1;
   Compressor_bh6_65: Compressor_23_3
      port map ( R => CompressorOut_bh6_65_65   ,
                 X0 => CompressorIn_bh6_65_92,
                 X1 => CompressorIn_bh6_65_93);
   heap_bh6_w40_12 <= CompressorOut_bh6_65_65(0); -- cycle= 1 cp= 0
   heap_bh6_w41_13 <= CompressorOut_bh6_65_65(1); -- cycle= 1 cp= 0
   heap_bh6_w42_13 <= CompressorOut_bh6_65_65(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_66_94 <= heap_bh6_w42_12_d1 & heap_bh6_w42_11_d1 & heap_bh6_w42_10_d1;
   CompressorIn_bh6_66_95 <= heap_bh6_w43_10_d1 & heap_bh6_w43_9_d1;
   Compressor_bh6_66: Compressor_23_3
      port map ( R => CompressorOut_bh6_66_66   ,
                 X0 => CompressorIn_bh6_66_94,
                 X1 => CompressorIn_bh6_66_95);
   heap_bh6_w42_14 <= CompressorOut_bh6_66_66(0); -- cycle= 1 cp= 0
   heap_bh6_w43_11 <= CompressorOut_bh6_66_66(1); -- cycle= 1 cp= 0
   heap_bh6_w44_13 <= CompressorOut_bh6_66_66(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_67_96 <= heap_bh6_w44_12_d1 & heap_bh6_w44_11_d1 & heap_bh6_w44_10_d1;
   CompressorIn_bh6_67_97 <= heap_bh6_w45_12_d1 & heap_bh6_w45_11_d1;
   Compressor_bh6_67: Compressor_23_3
      port map ( R => CompressorOut_bh6_67_67   ,
                 X0 => CompressorIn_bh6_67_96,
                 X1 => CompressorIn_bh6_67_97);
   heap_bh6_w44_14 <= CompressorOut_bh6_67_67(0); -- cycle= 1 cp= 0
   heap_bh6_w45_13 <= CompressorOut_bh6_67_67(1); -- cycle= 1 cp= 0
   heap_bh6_w46_11 <= CompressorOut_bh6_67_67(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_68_98 <= heap_bh6_w46_10_d1 & heap_bh6_w46_9_d1 & heap_bh6_w46_8_d1;
   CompressorIn_bh6_68_99 <= heap_bh6_w47_12_d1 & heap_bh6_w47_11_d1;
   Compressor_bh6_68: Compressor_23_3
      port map ( R => CompressorOut_bh6_68_68   ,
                 X0 => CompressorIn_bh6_68_98,
                 X1 => CompressorIn_bh6_68_99);
   heap_bh6_w46_12 <= CompressorOut_bh6_68_68(0); -- cycle= 1 cp= 0
   heap_bh6_w47_13 <= CompressorOut_bh6_68_68(1); -- cycle= 1 cp= 0
   heap_bh6_w48_13 <= CompressorOut_bh6_68_68(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_69_100 <= heap_bh6_w48_12_d1 & heap_bh6_w48_11_d1 & heap_bh6_w48_10_d1;
   CompressorIn_bh6_69_101 <= heap_bh6_w49_10_d1 & heap_bh6_w49_9_d1;
   Compressor_bh6_69: Compressor_23_3
      port map ( R => CompressorOut_bh6_69_69   ,
                 X0 => CompressorIn_bh6_69_100,
                 X1 => CompressorIn_bh6_69_101);
   heap_bh6_w48_14 <= CompressorOut_bh6_69_69(0); -- cycle= 1 cp= 0
   heap_bh6_w49_11 <= CompressorOut_bh6_69_69(1); -- cycle= 1 cp= 0
   heap_bh6_w50_13 <= CompressorOut_bh6_69_69(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_70_102 <= heap_bh6_w50_12_d1 & heap_bh6_w50_11_d1 & heap_bh6_w50_10_d1;
   CompressorIn_bh6_70_103 <= heap_bh6_w51_12_d1 & heap_bh6_w51_11_d1;
   Compressor_bh6_70: Compressor_23_3
      port map ( R => CompressorOut_bh6_70_70   ,
                 X0 => CompressorIn_bh6_70_102,
                 X1 => CompressorIn_bh6_70_103);
   heap_bh6_w50_14 <= CompressorOut_bh6_70_70(0); -- cycle= 1 cp= 0
   heap_bh6_w51_13 <= CompressorOut_bh6_70_70(1); -- cycle= 1 cp= 0
   heap_bh6_w52_11 <= CompressorOut_bh6_70_70(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_71_104 <= heap_bh6_w52_10_d1 & heap_bh6_w52_9_d1 & heap_bh6_w52_8_d1;
   CompressorIn_bh6_71_105 <= heap_bh6_w53_10_d1 & heap_bh6_w53_9_d1;
   Compressor_bh6_71: Compressor_23_3
      port map ( R => CompressorOut_bh6_71_71   ,
                 X0 => CompressorIn_bh6_71_104,
                 X1 => CompressorIn_bh6_71_105);
   heap_bh6_w52_12 <= CompressorOut_bh6_71_71(0); -- cycle= 1 cp= 0
   heap_bh6_w53_11 <= CompressorOut_bh6_71_71(1); -- cycle= 1 cp= 0
   heap_bh6_w54_11 <= CompressorOut_bh6_71_71(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_72_106 <= heap_bh6_w54_10_d1 & heap_bh6_w54_9_d1 & heap_bh6_w54_8_d1;
   CompressorIn_bh6_72_107(0) <= heap_bh6_w55_5_d1;
   Compressor_bh6_72: Compressor_13_3
      port map ( R => CompressorOut_bh6_72_72   ,
                 X0 => CompressorIn_bh6_72_106,
                 X1 => CompressorIn_bh6_72_107);
   heap_bh6_w54_12 <= CompressorOut_bh6_72_72(0); -- cycle= 1 cp= 0
   heap_bh6_w55_6 <= CompressorOut_bh6_72_72(1); -- cycle= 1 cp= 0
   heap_bh6_w56_6 <= CompressorOut_bh6_72_72(2); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_73_108 <= heap_bh6_w8_9_d1 & heap_bh6_w8_8_d1 & heap_bh6_w8_7_d1;
   Compressor_bh6_73: Compressor_3_2
      port map ( R => CompressorOut_bh6_73_73   ,
                 X0 => CompressorIn_bh6_73_108);
   heap_bh6_w8_11 <= CompressorOut_bh6_73_73(0); -- cycle= 1 cp= 0
   heap_bh6_w9_10 <= CompressorOut_bh6_73_73(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_74_109 <= heap_bh6_w11_9_d1 & heap_bh6_w11_8_d1 & heap_bh6_w11_7_d1;
   Compressor_bh6_74: Compressor_3_2
      port map ( R => CompressorOut_bh6_74_74   ,
                 X0 => CompressorIn_bh6_74_109);
   heap_bh6_w11_11 <= CompressorOut_bh6_74_74(0); -- cycle= 1 cp= 0
   heap_bh6_w12_10 <= CompressorOut_bh6_74_74(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_75_110 <= heap_bh6_w14_9_d1 & heap_bh6_w14_8_d1 & heap_bh6_w14_7_d1;
   Compressor_bh6_75: Compressor_3_2
      port map ( R => CompressorOut_bh6_75_75   ,
                 X0 => CompressorIn_bh6_75_110);
   heap_bh6_w14_11 <= CompressorOut_bh6_75_75(0); -- cycle= 1 cp= 0
   heap_bh6_w15_10 <= CompressorOut_bh6_75_75(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_76_111 <= heap_bh6_w17_9_d1 & heap_bh6_w17_8_d1 & heap_bh6_w17_7_d1;
   Compressor_bh6_76: Compressor_3_2
      port map ( R => CompressorOut_bh6_76_76   ,
                 X0 => CompressorIn_bh6_76_111);
   heap_bh6_w17_11 <= CompressorOut_bh6_76_76(0); -- cycle= 1 cp= 0
   heap_bh6_w18_10 <= CompressorOut_bh6_76_76(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_77_112 <= heap_bh6_w24_10_d1 & heap_bh6_w24_9_d1 & heap_bh6_w24_8_d1;
   Compressor_bh6_77: Compressor_3_2
      port map ( R => CompressorOut_bh6_77_77   ,
                 X0 => CompressorIn_bh6_77_112);
   heap_bh6_w24_12 <= CompressorOut_bh6_77_77(0); -- cycle= 1 cp= 0
   heap_bh6_w25_11 <= CompressorOut_bh6_77_77(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_78_113 <= heap_bh6_w27_9_d1 & heap_bh6_w27_10_d1 & heap_bh6_w27_8_d1;
   Compressor_bh6_78: Compressor_3_2
      port map ( R => CompressorOut_bh6_78_78   ,
                 X0 => CompressorIn_bh6_78_113);
   heap_bh6_w27_12 <= CompressorOut_bh6_78_78(0); -- cycle= 1 cp= 0
   heap_bh6_w28_11 <= CompressorOut_bh6_78_78(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_79_114 <= heap_bh6_w30_9_d1 & heap_bh6_w30_10_d1 & heap_bh6_w30_8_d1;
   Compressor_bh6_79: Compressor_3_2
      port map ( R => CompressorOut_bh6_79_79   ,
                 X0 => CompressorIn_bh6_79_114);
   heap_bh6_w30_12 <= CompressorOut_bh6_79_79(0); -- cycle= 1 cp= 0
   heap_bh6_w31_12 <= CompressorOut_bh6_79_79(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_80_115 <= heap_bh6_w33_10_d1 & heap_bh6_w33_11_d1 & heap_bh6_w33_9_d1;
   Compressor_bh6_80: Compressor_3_2
      port map ( R => CompressorOut_bh6_80_80   ,
                 X0 => CompressorIn_bh6_80_115);
   heap_bh6_w33_13 <= CompressorOut_bh6_80_80(0); -- cycle= 1 cp= 0
   heap_bh6_w34_12 <= CompressorOut_bh6_80_80(1); -- cycle= 1 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_81_116 <= heap_bh6_w32_10_d1 & heap_bh6_w32_8_d1 & heap_bh6_w32_11 & heap_bh6_w32_7 & heap_bh6_w32_6 & heap_bh6_w32_5;
   Compressor_bh6_81: Compressor_6_3
      port map ( R => CompressorOut_bh6_81_81   ,
                 X0 => CompressorIn_bh6_81_116);
   heap_bh6_w32_12 <= CompressorOut_bh6_81_81(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w33_14 <= CompressorOut_bh6_81_81(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w34_13 <= CompressorOut_bh6_81_81(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_82_117 <= heap_bh6_w35_10_d1 & heap_bh6_w35_8_d1 & heap_bh6_w35_11 & heap_bh6_w35_7 & heap_bh6_w35_6 & heap_bh6_w35_5;
   Compressor_bh6_82: Compressor_6_3
      port map ( R => CompressorOut_bh6_82_82   ,
                 X0 => CompressorIn_bh6_82_117);
   heap_bh6_w35_12 <= CompressorOut_bh6_82_82(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w36_14 <= CompressorOut_bh6_82_82(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w37_12 <= CompressorOut_bh6_82_82(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_83_118 <= heap_bh6_w41_10_d1 & heap_bh6_w41_13 & heap_bh6_w41_9 & heap_bh6_w41_8 & heap_bh6_w41_7 & heap_bh6_w41_6;
   Compressor_bh6_83: Compressor_6_3
      port map ( R => CompressorOut_bh6_83_83   ,
                 X0 => CompressorIn_bh6_83_118);
   heap_bh6_w41_14 <= CompressorOut_bh6_83_83(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w42_15 <= CompressorOut_bh6_83_83(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w43_12 <= CompressorOut_bh6_83_83(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_84_119 <= heap_bh6_w42_14 & heap_bh6_w42_13 & heap_bh6_w42_9 & heap_bh6_w42_8 & heap_bh6_w42_7 & heap_bh6_w42_6;
   Compressor_bh6_84: Compressor_6_3
      port map ( R => CompressorOut_bh6_84_84   ,
                 X0 => CompressorIn_bh6_84_119);
   heap_bh6_w42_16 <= CompressorOut_bh6_84_84(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w43_13 <= CompressorOut_bh6_84_84(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w44_15 <= CompressorOut_bh6_84_84(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_85_120 <= heap_bh6_w43_8_d1 & heap_bh6_w43_11 & heap_bh6_w43_7 & heap_bh6_w43_6 & heap_bh6_w43_5 & heap_bh6_w43_4;
   Compressor_bh6_85: Compressor_6_3
      port map ( R => CompressorOut_bh6_85_85   ,
                 X0 => CompressorIn_bh6_85_120);
   heap_bh6_w43_14 <= CompressorOut_bh6_85_85(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w44_16 <= CompressorOut_bh6_85_85(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w45_14 <= CompressorOut_bh6_85_85(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_86_121 <= heap_bh6_w44_14 & heap_bh6_w44_13 & heap_bh6_w44_9 & heap_bh6_w44_8 & heap_bh6_w44_7 & heap_bh6_w44_6;
   Compressor_bh6_86: Compressor_6_3
      port map ( R => CompressorOut_bh6_86_86   ,
                 X0 => CompressorIn_bh6_86_121);
   heap_bh6_w44_17 <= CompressorOut_bh6_86_86(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w45_15 <= CompressorOut_bh6_86_86(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w46_13 <= CompressorOut_bh6_86_86(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_87_122 <= heap_bh6_w45_10_d1 & heap_bh6_w45_13 & heap_bh6_w45_9 & heap_bh6_w45_8 & heap_bh6_w45_7 & heap_bh6_w45_6;
   Compressor_bh6_87: Compressor_6_3
      port map ( R => CompressorOut_bh6_87_87   ,
                 X0 => CompressorIn_bh6_87_122);
   heap_bh6_w45_16 <= CompressorOut_bh6_87_87(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w46_14 <= CompressorOut_bh6_87_87(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w47_14 <= CompressorOut_bh6_87_87(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_88_123 <= heap_bh6_w46_12 & heap_bh6_w46_11 & heap_bh6_w46_7 & heap_bh6_w46_6 & heap_bh6_w46_5 & heap_bh6_w46_4;
   Compressor_bh6_88: Compressor_6_3
      port map ( R => CompressorOut_bh6_88_88   ,
                 X0 => CompressorIn_bh6_88_123);
   heap_bh6_w46_15 <= CompressorOut_bh6_88_88(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w47_15 <= CompressorOut_bh6_88_88(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w48_15 <= CompressorOut_bh6_88_88(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_89_124 <= heap_bh6_w47_10_d1 & heap_bh6_w47_13 & heap_bh6_w47_9 & heap_bh6_w47_8 & heap_bh6_w47_7 & heap_bh6_w47_6;
   Compressor_bh6_89: Compressor_6_3
      port map ( R => CompressorOut_bh6_89_89   ,
                 X0 => CompressorIn_bh6_89_124);
   heap_bh6_w47_16 <= CompressorOut_bh6_89_89(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w48_16 <= CompressorOut_bh6_89_89(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w49_12 <= CompressorOut_bh6_89_89(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_90_125 <= heap_bh6_w48_14 & heap_bh6_w48_13 & heap_bh6_w48_9 & heap_bh6_w48_8 & heap_bh6_w48_7 & heap_bh6_w48_6;
   Compressor_bh6_90: Compressor_6_3
      port map ( R => CompressorOut_bh6_90_90   ,
                 X0 => CompressorIn_bh6_90_125);
   heap_bh6_w48_17 <= CompressorOut_bh6_90_90(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w49_13 <= CompressorOut_bh6_90_90(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w50_15 <= CompressorOut_bh6_90_90(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_91_126 <= heap_bh6_w49_8_d1 & heap_bh6_w49_11 & heap_bh6_w49_7 & heap_bh6_w49_6 & heap_bh6_w49_5 & heap_bh6_w49_4;
   Compressor_bh6_91: Compressor_6_3
      port map ( R => CompressorOut_bh6_91_91   ,
                 X0 => CompressorIn_bh6_91_126);
   heap_bh6_w49_14 <= CompressorOut_bh6_91_91(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w50_16 <= CompressorOut_bh6_91_91(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w51_14 <= CompressorOut_bh6_91_91(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_92_127 <= heap_bh6_w50_14 & heap_bh6_w50_13 & heap_bh6_w50_9 & heap_bh6_w50_8 & heap_bh6_w50_7 & heap_bh6_w50_6;
   Compressor_bh6_92: Compressor_6_3
      port map ( R => CompressorOut_bh6_92_92   ,
                 X0 => CompressorIn_bh6_92_127);
   heap_bh6_w50_17 <= CompressorOut_bh6_92_92(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w51_15 <= CompressorOut_bh6_92_92(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w52_13 <= CompressorOut_bh6_92_92(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_93_128 <= heap_bh6_w51_10_d1 & heap_bh6_w51_13 & heap_bh6_w51_9 & heap_bh6_w51_8 & heap_bh6_w51_7 & heap_bh6_w51_6;
   Compressor_bh6_93: Compressor_6_3
      port map ( R => CompressorOut_bh6_93_93   ,
                 X0 => CompressorIn_bh6_93_128);
   heap_bh6_w51_16 <= CompressorOut_bh6_93_93(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w52_14 <= CompressorOut_bh6_93_93(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w53_12 <= CompressorOut_bh6_93_93(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_94_129 <= heap_bh6_w52_12 & heap_bh6_w52_11 & heap_bh6_w52_7 & heap_bh6_w52_6 & heap_bh6_w52_5 & heap_bh6_w52_4;
   Compressor_bh6_94: Compressor_6_3
      port map ( R => CompressorOut_bh6_94_94   ,
                 X0 => CompressorIn_bh6_94_129);
   heap_bh6_w52_15 <= CompressorOut_bh6_94_94(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w53_13 <= CompressorOut_bh6_94_94(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w54_13 <= CompressorOut_bh6_94_94(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_95_130 <= heap_bh6_w53_8_d1 & heap_bh6_w53_11 & heap_bh6_w53_7 & heap_bh6_w53_6 & heap_bh6_w53_5 & heap_bh6_w53_4;
   Compressor_bh6_95: Compressor_6_3
      port map ( R => CompressorOut_bh6_95_95   ,
                 X0 => CompressorIn_bh6_95_130);
   heap_bh6_w53_14 <= CompressorOut_bh6_95_95(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w54_14 <= CompressorOut_bh6_95_95(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w55_7 <= CompressorOut_bh6_95_95(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_96_131 <= heap_bh6_w54_12 & heap_bh6_w54_11 & heap_bh6_w54_7 & heap_bh6_w54_6 & heap_bh6_w54_5 & heap_bh6_w54_4;
   Compressor_bh6_96: Compressor_6_3
      port map ( R => CompressorOut_bh6_96_96   ,
                 X0 => CompressorIn_bh6_96_131);
   heap_bh6_w54_15 <= CompressorOut_bh6_96_96(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w55_8 <= CompressorOut_bh6_96_96(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w56_7 <= CompressorOut_bh6_96_96(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_97_132 <= heap_bh6_w56_0_d1 & heap_bh6_w56_5_d1 & heap_bh6_w56_6 & heap_bh6_w56_4 & heap_bh6_w56_3 & heap_bh6_w56_2;
   Compressor_bh6_97: Compressor_6_3
      port map ( R => CompressorOut_bh6_97_97   ,
                 X0 => CompressorIn_bh6_97_132);
   heap_bh6_w56_8 <= CompressorOut_bh6_97_97(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w57_5 <= CompressorOut_bh6_97_97(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w58_4 <= CompressorOut_bh6_97_97(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_98_133 <= heap_bh6_w10_7_d1 & heap_bh6_w10_6_d1 & heap_bh6_w10_9 & heap_bh6_w10_5;
   CompressorIn_bh6_98_134(0) <= heap_bh6_w11_11;
   Compressor_bh6_98: Compressor_14_3
      port map ( R => CompressorOut_bh6_98_98   ,
                 X0 => CompressorIn_bh6_98_133,
                 X1 => CompressorIn_bh6_98_134);
   heap_bh6_w10_10 <= CompressorOut_bh6_98_98(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w11_12 <= CompressorOut_bh6_98_98(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w12_11 <= CompressorOut_bh6_98_98(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_99_135 <= heap_bh6_w13_7_d1 & heap_bh6_w13_6_d1 & heap_bh6_w13_9 & heap_bh6_w13_5;
   CompressorIn_bh6_99_136(0) <= heap_bh6_w14_11;
   Compressor_bh6_99: Compressor_14_3
      port map ( R => CompressorOut_bh6_99_99   ,
                 X0 => CompressorIn_bh6_99_135,
                 X1 => CompressorIn_bh6_99_136);
   heap_bh6_w13_10 <= CompressorOut_bh6_99_99(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w14_12 <= CompressorOut_bh6_99_99(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w15_11 <= CompressorOut_bh6_99_99(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_100_137 <= heap_bh6_w16_7_d1 & heap_bh6_w16_6_d1 & heap_bh6_w16_9 & heap_bh6_w16_5;
   CompressorIn_bh6_100_138(0) <= heap_bh6_w17_11;
   Compressor_bh6_100: Compressor_14_3
      port map ( R => CompressorOut_bh6_100_100   ,
                 X0 => CompressorIn_bh6_100_137,
                 X1 => CompressorIn_bh6_100_138);
   heap_bh6_w16_10 <= CompressorOut_bh6_100_100(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w17_12 <= CompressorOut_bh6_100_100(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w18_11 <= CompressorOut_bh6_100_100(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_101_139 <= heap_bh6_w19_7_d1 & heap_bh6_w19_6_d1 & heap_bh6_w19_9 & heap_bh6_w19_5;
   CompressorIn_bh6_101_140(0) <= heap_bh6_w20_11;
   Compressor_bh6_101: Compressor_14_3
      port map ( R => CompressorOut_bh6_101_101   ,
                 X0 => CompressorIn_bh6_101_139,
                 X1 => CompressorIn_bh6_101_140);
   heap_bh6_w19_10 <= CompressorOut_bh6_101_101(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w20_12 <= CompressorOut_bh6_101_101(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w21_11 <= CompressorOut_bh6_101_101(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_102_141 <= heap_bh6_w24_12 & heap_bh6_w24_11 & heap_bh6_w24_7 & heap_bh6_w24_6;
   CompressorIn_bh6_102_142(0) <= heap_bh6_w25_11;
   Compressor_bh6_102: Compressor_14_3
      port map ( R => CompressorOut_bh6_102_102   ,
                 X0 => CompressorIn_bh6_102_141,
                 X1 => CompressorIn_bh6_102_142);
   heap_bh6_w24_13 <= CompressorOut_bh6_102_102(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w25_12 <= CompressorOut_bh6_102_102(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w26_11 <= CompressorOut_bh6_102_102(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_103_143 <= heap_bh6_w26_9_d1 & heap_bh6_w26_7_d1 & heap_bh6_w26_10 & heap_bh6_w26_6;
   CompressorIn_bh6_103_144(0) <= heap_bh6_w27_12;
   Compressor_bh6_103: Compressor_14_3
      port map ( R => CompressorOut_bh6_103_103   ,
                 X0 => CompressorIn_bh6_103_143,
                 X1 => CompressorIn_bh6_103_144);
   heap_bh6_w26_12 <= CompressorOut_bh6_103_103(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w27_13 <= CompressorOut_bh6_103_103(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w28_12 <= CompressorOut_bh6_103_103(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_104_145 <= heap_bh6_w28_11 & heap_bh6_w28_10 & heap_bh6_w28_6 & heap_bh6_w28_5;
   CompressorIn_bh6_104_146(0) <= heap_bh6_w29_9_d1;
   Compressor_bh6_104: Compressor_14_3
      port map ( R => CompressorOut_bh6_104_104   ,
                 X0 => CompressorIn_bh6_104_145,
                 X1 => CompressorIn_bh6_104_146);
   heap_bh6_w28_13 <= CompressorOut_bh6_104_104(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w29_11 <= CompressorOut_bh6_104_104(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w30_13 <= CompressorOut_bh6_104_104(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_105_147 <= heap_bh6_w29_7_d1 & heap_bh6_w29_10 & heap_bh6_w29_6 & heap_bh6_w29_5;
   CompressorIn_bh6_105_148(0) <= heap_bh6_w30_12;
   Compressor_bh6_105: Compressor_14_3
      port map ( R => CompressorOut_bh6_105_105   ,
                 X0 => CompressorIn_bh6_105_147,
                 X1 => CompressorIn_bh6_105_148);
   heap_bh6_w29_12 <= CompressorOut_bh6_105_105(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w30_14 <= CompressorOut_bh6_105_105(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w31_13 <= CompressorOut_bh6_105_105(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_106_149 <= heap_bh6_w33_13 & heap_bh6_w33_12 & heap_bh6_w33_8 & heap_bh6_w33_7;
   CompressorIn_bh6_106_150(0) <= heap_bh6_w34_12;
   Compressor_bh6_106: Compressor_14_3
      port map ( R => CompressorOut_bh6_106_106   ,
                 X0 => CompressorIn_bh6_106_149,
                 X1 => CompressorIn_bh6_106_150);
   heap_bh6_w33_15 <= CompressorOut_bh6_106_106(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w34_14 <= CompressorOut_bh6_106_106(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w35_13 <= CompressorOut_bh6_106_106(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_107_151 <= heap_bh6_w36_13 & heap_bh6_w36_12 & heap_bh6_w36_8 & heap_bh6_w36_7;
   CompressorIn_bh6_107_152(0) <= heap_bh6_w37_8_d1;
   Compressor_bh6_107: Compressor_14_3
      port map ( R => CompressorOut_bh6_107_107   ,
                 X0 => CompressorIn_bh6_107_151,
                 X1 => CompressorIn_bh6_107_152);
   heap_bh6_w36_15 <= CompressorOut_bh6_107_107(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w37_13 <= CompressorOut_bh6_107_107(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w38_14 <= CompressorOut_bh6_107_107(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_108_153 <= heap_bh6_w37_11 & heap_bh6_w37_7 & heap_bh6_w37_6 & heap_bh6_w37_5;
   CompressorIn_bh6_108_154(0) <= heap_bh6_w38_13;
   Compressor_bh6_108: Compressor_14_3
      port map ( R => CompressorOut_bh6_108_108   ,
                 X0 => CompressorIn_bh6_108_153,
                 X1 => CompressorIn_bh6_108_154);
   heap_bh6_w37_14 <= CompressorOut_bh6_108_108(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w38_15 <= CompressorOut_bh6_108_108(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w39_13 <= CompressorOut_bh6_108_108(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_109_155 <= heap_bh6_w38_12 & heap_bh6_w38_8 & heap_bh6_w38_7 & heap_bh6_w38_6;
   CompressorIn_bh6_109_156(0) <= heap_bh6_w39_9_d1;
   Compressor_bh6_109: Compressor_14_3
      port map ( R => CompressorOut_bh6_109_109   ,
                 X0 => CompressorIn_bh6_109_155,
                 X1 => CompressorIn_bh6_109_156);
   heap_bh6_w38_16 <= CompressorOut_bh6_109_109(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w39_14 <= CompressorOut_bh6_109_109(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w40_13 <= CompressorOut_bh6_109_109(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_110_157 <= heap_bh6_w39_12 & heap_bh6_w39_8 & heap_bh6_w39_7 & heap_bh6_w39_6;
   CompressorIn_bh6_110_158(0) <= heap_bh6_w40_12;
   Compressor_bh6_110: Compressor_14_3
      port map ( R => CompressorOut_bh6_110_110   ,
                 X0 => CompressorIn_bh6_110_157,
                 X1 => CompressorIn_bh6_110_158);
   heap_bh6_w39_15 <= CompressorOut_bh6_110_110(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w40_14 <= CompressorOut_bh6_110_110(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w41_15 <= CompressorOut_bh6_110_110(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_111_159 <= heap_bh6_w55_6 & heap_bh6_w55_4 & heap_bh6_w55_3 & heap_bh6_w55_2;
   CompressorIn_bh6_111_160(0) <= heap_bh6_w56_1;
   Compressor_bh6_111: Compressor_14_3
      port map ( R => CompressorOut_bh6_111_111   ,
                 X0 => CompressorIn_bh6_111_159,
                 X1 => CompressorIn_bh6_111_160);
   heap_bh6_w55_9 <= CompressorOut_bh6_111_111(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w56_9 <= CompressorOut_bh6_111_111(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w57_6 <= CompressorOut_bh6_111_111(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_112_161 <= heap_bh6_w57_0_d1 & heap_bh6_w57_4 & heap_bh6_w57_3 & heap_bh6_w57_2;
   CompressorIn_bh6_112_162(0) <= heap_bh6_w58_3;
   Compressor_bh6_112: Compressor_14_3
      port map ( R => CompressorOut_bh6_112_112   ,
                 X0 => CompressorIn_bh6_112_161,
                 X1 => CompressorIn_bh6_112_162);
   heap_bh6_w57_7 <= CompressorOut_bh6_112_112(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w58_5 <= CompressorOut_bh6_112_112(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w59_4 <= CompressorOut_bh6_112_112(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_113_163 <= heap_bh6_w59_3 & heap_bh6_w59_2 & heap_bh6_w59_1 & heap_bh6_w59_0;
   CompressorIn_bh6_113_164(0) <= heap_bh6_w60_3;
   Compressor_bh6_113: Compressor_14_3
      port map ( R => CompressorOut_bh6_113_113   ,
                 X0 => CompressorIn_bh6_113_163,
                 X1 => CompressorIn_bh6_113_164);
   heap_bh6_w59_5 <= CompressorOut_bh6_113_113(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w60_4 <= CompressorOut_bh6_113_113(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w61_4 <= CompressorOut_bh6_113_113(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_114_165 <= heap_bh6_w61_3 & heap_bh6_w61_2 & heap_bh6_w61_1 & heap_bh6_w61_0;
   CompressorIn_bh6_114_166(0) <= heap_bh6_w62_3;
   Compressor_bh6_114: Compressor_14_3
      port map ( R => CompressorOut_bh6_114_114   ,
                 X0 => CompressorIn_bh6_114_165,
                 X1 => CompressorIn_bh6_114_166);
   heap_bh6_w61_5 <= CompressorOut_bh6_114_114(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w62_4 <= CompressorOut_bh6_114_114(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w63_4 <= CompressorOut_bh6_114_114(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_115_167 <= heap_bh6_w63_3 & heap_bh6_w63_2 & heap_bh6_w63_1 & heap_bh6_w63_0;
   CompressorIn_bh6_115_168(0) <= heap_bh6_w64_3;
   Compressor_bh6_115: Compressor_14_3
      port map ( R => CompressorOut_bh6_115_115   ,
                 X0 => CompressorIn_bh6_115_167,
                 X1 => CompressorIn_bh6_115_168);
   heap_bh6_w63_5 <= CompressorOut_bh6_115_115(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w64_4 <= CompressorOut_bh6_115_115(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w65_4 <= CompressorOut_bh6_115_115(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_116_169 <= heap_bh6_w65_3 & heap_bh6_w65_2 & heap_bh6_w65_1 & heap_bh6_w65_0;
   CompressorIn_bh6_116_170(0) <= heap_bh6_w66_3;
   Compressor_bh6_116: Compressor_14_3
      port map ( R => CompressorOut_bh6_116_116   ,
                 X0 => CompressorIn_bh6_116_169,
                 X1 => CompressorIn_bh6_116_170);
   heap_bh6_w65_5 <= CompressorOut_bh6_116_116(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w66_4 <= CompressorOut_bh6_116_116(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w67_4 <= CompressorOut_bh6_116_116(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_117_171 <= heap_bh6_w67_3 & heap_bh6_w67_2 & heap_bh6_w67_1 & heap_bh6_w67_0;
   CompressorIn_bh6_117_172(0) <= heap_bh6_w68_3;
   Compressor_bh6_117: Compressor_14_3
      port map ( R => CompressorOut_bh6_117_117   ,
                 X0 => CompressorIn_bh6_117_171,
                 X1 => CompressorIn_bh6_117_172);
   heap_bh6_w67_5 <= CompressorOut_bh6_117_117(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w68_4 <= CompressorOut_bh6_117_117(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w69_4 <= CompressorOut_bh6_117_117(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_118_173 <= heap_bh6_w69_3 & heap_bh6_w69_2 & heap_bh6_w69_1 & heap_bh6_w69_0;
   CompressorIn_bh6_118_174(0) <= heap_bh6_w70_3;
   Compressor_bh6_118: Compressor_14_3
      port map ( R => CompressorOut_bh6_118_118   ,
                 X0 => CompressorIn_bh6_118_173,
                 X1 => CompressorIn_bh6_118_174);
   heap_bh6_w69_5 <= CompressorOut_bh6_118_118(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w70_4 <= CompressorOut_bh6_118_118(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w71_4 <= CompressorOut_bh6_118_118(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_119_175 <= heap_bh6_w71_3 & heap_bh6_w71_2 & heap_bh6_w71_1 & heap_bh6_w71_0;
   CompressorIn_bh6_119_176(0) <= heap_bh6_w72_2;
   Compressor_bh6_119: Compressor_14_3
      port map ( R => CompressorOut_bh6_119_119   ,
                 X0 => CompressorIn_bh6_119_175,
                 X1 => CompressorIn_bh6_119_176);
   heap_bh6_w71_5 <= CompressorOut_bh6_119_119(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w72_3 <= CompressorOut_bh6_119_119(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w73_3 <= CompressorOut_bh6_119_119(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_120_177 <= heap_bh6_w31_12 & heap_bh6_w31_11 & heap_bh6_w31_7 & heap_bh6_w31_6 & heap_bh6_w31_5;
   Compressor_bh6_120: Compressor_5_3
      port map ( R => CompressorOut_bh6_120_120   ,
                 X0 => CompressorIn_bh6_120_177);
   heap_bh6_w31_14 <= CompressorOut_bh6_120_120(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w32_13 <= CompressorOut_bh6_120_120(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w33_16 <= CompressorOut_bh6_120_120(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_121_178 <= heap_bh6_w34_11 & heap_bh6_w34_7 & heap_bh6_w34_6 & heap_bh6_w34_5;
   Compressor_bh6_121: Compressor_4_3
      port map ( R => CompressorOut_bh6_121_121   ,
                 X0 => CompressorIn_bh6_121_178);
   heap_bh6_w34_15 <= CompressorOut_bh6_121_121(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w35_14 <= CompressorOut_bh6_121_121(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w36_16 <= CompressorOut_bh6_121_121(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_122_179 <= heap_bh6_w40_11 & heap_bh6_w40_7 & heap_bh6_w40_6 & heap_bh6_w40_5;
   Compressor_bh6_122: Compressor_4_3
      port map ( R => CompressorOut_bh6_122_122   ,
                 X0 => CompressorIn_bh6_122_179);
   heap_bh6_w40_15 <= CompressorOut_bh6_122_122(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w41_16 <= CompressorOut_bh6_122_122(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w42_17 <= CompressorOut_bh6_122_122(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_123_180 <= heap_bh6_w7_6_d1 & heap_bh6_w7_9 & heap_bh6_w7_5;
   CompressorIn_bh6_123_181 <= heap_bh6_w8_11 & heap_bh6_w8_10;
   Compressor_bh6_123: Compressor_23_3
      port map ( R => CompressorOut_bh6_123_123   ,
                 X0 => CompressorIn_bh6_123_180,
                 X1 => CompressorIn_bh6_123_181);
   heap_bh6_w7_10 <= CompressorOut_bh6_123_123(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w8_12 <= CompressorOut_bh6_123_123(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w9_11 <= CompressorOut_bh6_123_123(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_124_182 <= heap_bh6_w21_7_d1 & heap_bh6_w21_10 & heap_bh6_w21_6;
   CompressorIn_bh6_124_183 <= heap_bh6_w22_10 & heap_bh6_w22_9;
   Compressor_bh6_124: Compressor_23_3
      port map ( R => CompressorOut_bh6_124_124   ,
                 X0 => CompressorIn_bh6_124_182,
                 X1 => CompressorIn_bh6_124_183);
   heap_bh6_w21_12 <= CompressorOut_bh6_124_124(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w22_11 <= CompressorOut_bh6_124_124(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w23_11 <= CompressorOut_bh6_124_124(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_125_184 <= heap_bh6_w73_2 & heap_bh6_w73_1 & heap_bh6_w73_0;
   CompressorIn_bh6_125_185 <= heap_bh6_w74_2 & heap_bh6_w74_1;
   Compressor_bh6_125: Compressor_23_3
      port map ( R => CompressorOut_bh6_125_125   ,
                 X0 => CompressorIn_bh6_125_184,
                 X1 => CompressorIn_bh6_125_185);
   heap_bh6_w73_4 <= CompressorOut_bh6_125_125(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w74_3 <= CompressorOut_bh6_125_125(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w75_3 <= CompressorOut_bh6_125_125(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_126_186 <= heap_bh6_w75_2 & heap_bh6_w75_1 & heap_bh6_w75_0;
   CompressorIn_bh6_126_187 <= heap_bh6_w76_2 & heap_bh6_w76_1;
   Compressor_bh6_126: Compressor_23_3
      port map ( R => CompressorOut_bh6_126_126   ,
                 X0 => CompressorIn_bh6_126_186,
                 X1 => CompressorIn_bh6_126_187);
   heap_bh6_w75_4 <= CompressorOut_bh6_126_126(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w76_3 <= CompressorOut_bh6_126_126(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w77_3 <= CompressorOut_bh6_126_126(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_127_188 <= heap_bh6_w77_2 & heap_bh6_w77_1 & heap_bh6_w77_0;
   CompressorIn_bh6_127_189 <= heap_bh6_w78_2 & heap_bh6_w78_1;
   Compressor_bh6_127: Compressor_23_3
      port map ( R => CompressorOut_bh6_127_127   ,
                 X0 => CompressorIn_bh6_127_188,
                 X1 => CompressorIn_bh6_127_189);
   heap_bh6_w77_4 <= CompressorOut_bh6_127_127(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w78_3 <= CompressorOut_bh6_127_127(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w79_3 <= CompressorOut_bh6_127_127(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_128_190 <= heap_bh6_w79_2 & heap_bh6_w79_1 & heap_bh6_w79_0;
   CompressorIn_bh6_128_191 <= heap_bh6_w80_2 & heap_bh6_w80_1;
   Compressor_bh6_128: Compressor_23_3
      port map ( R => CompressorOut_bh6_128_128   ,
                 X0 => CompressorIn_bh6_128_190,
                 X1 => CompressorIn_bh6_128_191);
   heap_bh6_w79_4 <= CompressorOut_bh6_128_128(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w80_3 <= CompressorOut_bh6_128_128(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w81_3 <= CompressorOut_bh6_128_128(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_129_192 <= heap_bh6_w81_2 & heap_bh6_w81_1 & heap_bh6_w81_0;
   CompressorIn_bh6_129_193 <= heap_bh6_w82_1 & heap_bh6_w82_0;
   Compressor_bh6_129: Compressor_23_3
      port map ( R => CompressorOut_bh6_129_129   ,
                 X0 => CompressorIn_bh6_129_192,
                 X1 => CompressorIn_bh6_129_193);
   heap_bh6_w81_4 <= CompressorOut_bh6_129_129(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w82_2 <= CompressorOut_bh6_129_129(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w83_2 <= CompressorOut_bh6_129_129(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_130_194 <= heap_bh6_w25_10 & heap_bh6_w25_6 & heap_bh6_w25_5;
   CompressorIn_bh6_130_195(0) <= heap_bh6_w26_5;
   Compressor_bh6_130: Compressor_13_3
      port map ( R => CompressorOut_bh6_130_130   ,
                 X0 => CompressorIn_bh6_130_194,
                 X1 => CompressorIn_bh6_130_195);
   heap_bh6_w25_13 <= CompressorOut_bh6_130_130(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w26_13 <= CompressorOut_bh6_130_130(1); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w27_14 <= CompressorOut_bh6_130_130(2); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_131_196 <= heap_bh6_w9_10 & heap_bh6_w9_9 & heap_bh6_w9_5;
   Compressor_bh6_131: Compressor_3_2
      port map ( R => CompressorOut_bh6_131_131   ,
                 X0 => CompressorIn_bh6_131_196);
   heap_bh6_w9_12 <= CompressorOut_bh6_131_131(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w10_11 <= CompressorOut_bh6_131_131(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_132_197 <= heap_bh6_w12_10 & heap_bh6_w12_9 & heap_bh6_w12_5;
   Compressor_bh6_132: Compressor_3_2
      port map ( R => CompressorOut_bh6_132_132   ,
                 X0 => CompressorIn_bh6_132_197);
   heap_bh6_w12_12 <= CompressorOut_bh6_132_132(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w13_11 <= CompressorOut_bh6_132_132(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_133_198 <= heap_bh6_w15_10 & heap_bh6_w15_9 & heap_bh6_w15_5;
   Compressor_bh6_133: Compressor_3_2
      port map ( R => CompressorOut_bh6_133_133   ,
                 X0 => CompressorIn_bh6_133_198);
   heap_bh6_w15_12 <= CompressorOut_bh6_133_133(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w16_11 <= CompressorOut_bh6_133_133(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_134_199 <= heap_bh6_w18_10 & heap_bh6_w18_9 & heap_bh6_w18_5;
   Compressor_bh6_134: Compressor_3_2
      port map ( R => CompressorOut_bh6_134_134   ,
                 X0 => CompressorIn_bh6_134_199);
   heap_bh6_w18_12 <= CompressorOut_bh6_134_134(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w19_11 <= CompressorOut_bh6_134_134(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_135_200 <= heap_bh6_w23_7_d1 & heap_bh6_w23_10 & heap_bh6_w23_6;
   Compressor_bh6_135: Compressor_3_2
      port map ( R => CompressorOut_bh6_135_135   ,
                 X0 => CompressorIn_bh6_135_200);
   heap_bh6_w23_12 <= CompressorOut_bh6_135_135(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w24_14 <= CompressorOut_bh6_135_135(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_136_201 <= heap_bh6_w27_11 & heap_bh6_w27_7 & heap_bh6_w27_6;
   Compressor_bh6_136: Compressor_3_2
      port map ( R => CompressorOut_bh6_136_136   ,
                 X0 => CompressorIn_bh6_136_201);
   heap_bh6_w27_15 <= CompressorOut_bh6_136_136(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w28_14 <= CompressorOut_bh6_136_136(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_137_202 <= heap_bh6_w30_11 & heap_bh6_w30_7 & heap_bh6_w30_6;
   Compressor_bh6_137: Compressor_3_2
      port map ( R => CompressorOut_bh6_137_137   ,
                 X0 => CompressorIn_bh6_137_202);
   heap_bh6_w30_15 <= CompressorOut_bh6_137_137(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w31_15 <= CompressorOut_bh6_137_137(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_138_203 <= heap_bh6_w58_2 & heap_bh6_w58_1 & heap_bh6_w58_0;
   Compressor_bh6_138: Compressor_3_2
      port map ( R => CompressorOut_bh6_138_138   ,
                 X0 => CompressorIn_bh6_138_203);
   heap_bh6_w58_6 <= CompressorOut_bh6_138_138(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w59_6 <= CompressorOut_bh6_138_138(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_139_204 <= heap_bh6_w60_2 & heap_bh6_w60_1 & heap_bh6_w60_0;
   Compressor_bh6_139: Compressor_3_2
      port map ( R => CompressorOut_bh6_139_139   ,
                 X0 => CompressorIn_bh6_139_204);
   heap_bh6_w60_5 <= CompressorOut_bh6_139_139(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w61_6 <= CompressorOut_bh6_139_139(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_140_205 <= heap_bh6_w62_2 & heap_bh6_w62_1 & heap_bh6_w62_0;
   Compressor_bh6_140: Compressor_3_2
      port map ( R => CompressorOut_bh6_140_140   ,
                 X0 => CompressorIn_bh6_140_205);
   heap_bh6_w62_5 <= CompressorOut_bh6_140_140(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w63_6 <= CompressorOut_bh6_140_140(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_141_206 <= heap_bh6_w64_2 & heap_bh6_w64_1 & heap_bh6_w64_0;
   Compressor_bh6_141: Compressor_3_2
      port map ( R => CompressorOut_bh6_141_141   ,
                 X0 => CompressorIn_bh6_141_206);
   heap_bh6_w64_5 <= CompressorOut_bh6_141_141(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w65_6 <= CompressorOut_bh6_141_141(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_142_207 <= heap_bh6_w66_2 & heap_bh6_w66_1 & heap_bh6_w66_0;
   Compressor_bh6_142: Compressor_3_2
      port map ( R => CompressorOut_bh6_142_142   ,
                 X0 => CompressorIn_bh6_142_207);
   heap_bh6_w66_5 <= CompressorOut_bh6_142_142(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w67_6 <= CompressorOut_bh6_142_142(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_143_208 <= heap_bh6_w68_2 & heap_bh6_w68_1 & heap_bh6_w68_0;
   Compressor_bh6_143: Compressor_3_2
      port map ( R => CompressorOut_bh6_143_143   ,
                 X0 => CompressorIn_bh6_143_208);
   heap_bh6_w68_5 <= CompressorOut_bh6_143_143(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w69_6 <= CompressorOut_bh6_143_143(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_144_209 <= heap_bh6_w70_2 & heap_bh6_w70_1 & heap_bh6_w70_0;
   Compressor_bh6_144: Compressor_3_2
      port map ( R => CompressorOut_bh6_144_144   ,
                 X0 => CompressorIn_bh6_144_209);
   heap_bh6_w70_5 <= CompressorOut_bh6_144_144(0); -- cycle= 1 cp= 5.81689e-10
   heap_bh6_w71_6 <= CompressorOut_bh6_144_144(1); -- cycle= 1 cp= 5.81689e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_145_210 <= heap_bh6_w33_6 & heap_bh6_w33_16 & heap_bh6_w33_15 & heap_bh6_w33_14;
   CompressorIn_bh6_145_211(0) <= heap_bh6_w34_15;
   Compressor_bh6_145: Compressor_14_3
      port map ( R => CompressorOut_bh6_145_145   ,
                 X0 => CompressorIn_bh6_145_210,
                 X1 => CompressorIn_bh6_145_211);
   heap_bh6_w33_17 <= CompressorOut_bh6_145_145(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w34_16 <= CompressorOut_bh6_145_145(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w35_15 <= CompressorOut_bh6_145_145(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_146_212 <= heap_bh6_w36_6 & heap_bh6_w36_16 & heap_bh6_w36_15 & heap_bh6_w36_14;
   CompressorIn_bh6_146_213(0) <= heap_bh6_w37_14;
   Compressor_bh6_146: Compressor_14_3
      port map ( R => CompressorOut_bh6_146_146   ,
                 X0 => CompressorIn_bh6_146_212,
                 X1 => CompressorIn_bh6_146_213);
   heap_bh6_w36_17 <= CompressorOut_bh6_146_146(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w37_15 <= CompressorOut_bh6_146_146(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w38_17 <= CompressorOut_bh6_146_146(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_147_214 <= heap_bh6_w55_1 & heap_bh6_w55_9 & heap_bh6_w55_8 & heap_bh6_w55_7;
   CompressorIn_bh6_147_215(0) <= heap_bh6_w56_9;
   Compressor_bh6_147: Compressor_14_3
      port map ( R => CompressorOut_bh6_147_147   ,
                 X0 => CompressorIn_bh6_147_214,
                 X1 => CompressorIn_bh6_147_215);
   heap_bh6_w55_10 <= CompressorOut_bh6_147_147(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w56_10 <= CompressorOut_bh6_147_147(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w57_8 <= CompressorOut_bh6_147_147(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_148_216 <= heap_bh6_w57_1 & heap_bh6_w57_7 & heap_bh6_w57_6 & heap_bh6_w57_5;
   CompressorIn_bh6_148_217(0) <= heap_bh6_w58_6;
   Compressor_bh6_148: Compressor_14_3
      port map ( R => CompressorOut_bh6_148_148   ,
                 X0 => CompressorIn_bh6_148_216,
                 X1 => CompressorIn_bh6_148_217);
   heap_bh6_w57_9 <= CompressorOut_bh6_148_148(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w58_7 <= CompressorOut_bh6_148_148(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w59_7 <= CompressorOut_bh6_148_148(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_149_218 <= heap_bh6_w11_10 & heap_bh6_w11_6 & heap_bh6_w11_12;
   CompressorIn_bh6_149_219 <= heap_bh6_w12_12 & heap_bh6_w12_11;
   Compressor_bh6_149: Compressor_23_3
      port map ( R => CompressorOut_bh6_149_149   ,
                 X0 => CompressorIn_bh6_149_218,
                 X1 => CompressorIn_bh6_149_219);
   heap_bh6_w11_13 <= CompressorOut_bh6_149_149(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w12_13 <= CompressorOut_bh6_149_149(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w13_12 <= CompressorOut_bh6_149_149(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_150_220 <= heap_bh6_w14_10 & heap_bh6_w14_6 & heap_bh6_w14_12;
   CompressorIn_bh6_150_221 <= heap_bh6_w15_12 & heap_bh6_w15_11;
   Compressor_bh6_150: Compressor_23_3
      port map ( R => CompressorOut_bh6_150_150   ,
                 X0 => CompressorIn_bh6_150_220,
                 X1 => CompressorIn_bh6_150_221);
   heap_bh6_w14_13 <= CompressorOut_bh6_150_150(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w15_13 <= CompressorOut_bh6_150_150(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w16_12 <= CompressorOut_bh6_150_150(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_151_222 <= heap_bh6_w17_10 & heap_bh6_w17_6 & heap_bh6_w17_12;
   CompressorIn_bh6_151_223 <= heap_bh6_w18_12 & heap_bh6_w18_11;
   Compressor_bh6_151: Compressor_23_3
      port map ( R => CompressorOut_bh6_151_151   ,
                 X0 => CompressorIn_bh6_151_222,
                 X1 => CompressorIn_bh6_151_223);
   heap_bh6_w17_13 <= CompressorOut_bh6_151_151(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w18_13 <= CompressorOut_bh6_151_151(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w19_12 <= CompressorOut_bh6_151_151(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_152_224 <= heap_bh6_w20_10 & heap_bh6_w20_6 & heap_bh6_w20_12;
   CompressorIn_bh6_152_225 <= heap_bh6_w21_12 & heap_bh6_w21_11;
   Compressor_bh6_152: Compressor_23_3
      port map ( R => CompressorOut_bh6_152_152   ,
                 X0 => CompressorIn_bh6_152_224,
                 X1 => CompressorIn_bh6_152_225);
   heap_bh6_w20_13 <= CompressorOut_bh6_152_152(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w21_13 <= CompressorOut_bh6_152_152(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w22_12 <= CompressorOut_bh6_152_152(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_153_226 <= heap_bh6_w26_13 & heap_bh6_w26_12 & heap_bh6_w26_11;
   CompressorIn_bh6_153_227 <= heap_bh6_w27_15 & heap_bh6_w27_14;
   Compressor_bh6_153: Compressor_23_3
      port map ( R => CompressorOut_bh6_153_153   ,
                 X0 => CompressorIn_bh6_153_226,
                 X1 => CompressorIn_bh6_153_227);
   heap_bh6_w26_14 <= CompressorOut_bh6_153_153(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w27_16 <= CompressorOut_bh6_153_153(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w28_15 <= CompressorOut_bh6_153_153(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_154_228 <= heap_bh6_w28_14 & heap_bh6_w28_13 & heap_bh6_w28_12;
   CompressorIn_bh6_154_229 <= heap_bh6_w29_12 & heap_bh6_w29_11;
   Compressor_bh6_154: Compressor_23_3
      port map ( R => CompressorOut_bh6_154_154   ,
                 X0 => CompressorIn_bh6_154_228,
                 X1 => CompressorIn_bh6_154_229);
   heap_bh6_w28_16 <= CompressorOut_bh6_154_154(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w29_13 <= CompressorOut_bh6_154_154(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w30_16 <= CompressorOut_bh6_154_154(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_155_230 <= heap_bh6_w30_15 & heap_bh6_w30_14 & heap_bh6_w30_13;
   CompressorIn_bh6_155_231 <= heap_bh6_w31_15 & heap_bh6_w31_14;
   Compressor_bh6_155: Compressor_23_3
      port map ( R => CompressorOut_bh6_155_155   ,
                 X0 => CompressorIn_bh6_155_230,
                 X1 => CompressorIn_bh6_155_231);
   heap_bh6_w30_17 <= CompressorOut_bh6_155_155(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w31_16 <= CompressorOut_bh6_155_155(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w32_14 <= CompressorOut_bh6_155_155(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_156_232 <= heap_bh6_w38_16 & heap_bh6_w38_15 & heap_bh6_w38_14;
   CompressorIn_bh6_156_233 <= heap_bh6_w39_15 & heap_bh6_w39_14;
   Compressor_bh6_156: Compressor_23_3
      port map ( R => CompressorOut_bh6_156_156   ,
                 X0 => CompressorIn_bh6_156_232,
                 X1 => CompressorIn_bh6_156_233);
   heap_bh6_w38_18 <= CompressorOut_bh6_156_156(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w39_16 <= CompressorOut_bh6_156_156(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w40_16 <= CompressorOut_bh6_156_156(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_157_234 <= heap_bh6_w40_15 & heap_bh6_w40_14 & heap_bh6_w40_13;
   CompressorIn_bh6_157_235 <= heap_bh6_w41_16 & heap_bh6_w41_15;
   Compressor_bh6_157: Compressor_23_3
      port map ( R => CompressorOut_bh6_157_157   ,
                 X0 => CompressorIn_bh6_157_234,
                 X1 => CompressorIn_bh6_157_235);
   heap_bh6_w40_17 <= CompressorOut_bh6_157_157(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w41_17 <= CompressorOut_bh6_157_157(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w42_18 <= CompressorOut_bh6_157_157(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_158_236 <= heap_bh6_w42_17 & heap_bh6_w42_16 & heap_bh6_w42_15;
   CompressorIn_bh6_158_237 <= heap_bh6_w43_14 & heap_bh6_w43_13;
   Compressor_bh6_158: Compressor_23_3
      port map ( R => CompressorOut_bh6_158_158   ,
                 X0 => CompressorIn_bh6_158_236,
                 X1 => CompressorIn_bh6_158_237);
   heap_bh6_w42_19 <= CompressorOut_bh6_158_158(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w43_15 <= CompressorOut_bh6_158_158(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w44_18 <= CompressorOut_bh6_158_158(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_159_238 <= heap_bh6_w44_17 & heap_bh6_w44_16 & heap_bh6_w44_15;
   CompressorIn_bh6_159_239 <= heap_bh6_w45_16 & heap_bh6_w45_15;
   Compressor_bh6_159: Compressor_23_3
      port map ( R => CompressorOut_bh6_159_159   ,
                 X0 => CompressorIn_bh6_159_238,
                 X1 => CompressorIn_bh6_159_239);
   heap_bh6_w44_19 <= CompressorOut_bh6_159_159(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w45_17 <= CompressorOut_bh6_159_159(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w46_16 <= CompressorOut_bh6_159_159(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_160_240 <= heap_bh6_w46_15 & heap_bh6_w46_14 & heap_bh6_w46_13;
   CompressorIn_bh6_160_241 <= heap_bh6_w47_16 & heap_bh6_w47_15;
   Compressor_bh6_160: Compressor_23_3
      port map ( R => CompressorOut_bh6_160_160   ,
                 X0 => CompressorIn_bh6_160_240,
                 X1 => CompressorIn_bh6_160_241);
   heap_bh6_w46_17 <= CompressorOut_bh6_160_160(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w47_17 <= CompressorOut_bh6_160_160(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w48_18 <= CompressorOut_bh6_160_160(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_161_242 <= heap_bh6_w48_17 & heap_bh6_w48_16 & heap_bh6_w48_15;
   CompressorIn_bh6_161_243 <= heap_bh6_w49_14 & heap_bh6_w49_13;
   Compressor_bh6_161: Compressor_23_3
      port map ( R => CompressorOut_bh6_161_161   ,
                 X0 => CompressorIn_bh6_161_242,
                 X1 => CompressorIn_bh6_161_243);
   heap_bh6_w48_19 <= CompressorOut_bh6_161_161(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w49_15 <= CompressorOut_bh6_161_161(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w50_18 <= CompressorOut_bh6_161_161(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_162_244 <= heap_bh6_w50_17 & heap_bh6_w50_16 & heap_bh6_w50_15;
   CompressorIn_bh6_162_245 <= heap_bh6_w51_16 & heap_bh6_w51_15;
   Compressor_bh6_162: Compressor_23_3
      port map ( R => CompressorOut_bh6_162_162   ,
                 X0 => CompressorIn_bh6_162_244,
                 X1 => CompressorIn_bh6_162_245);
   heap_bh6_w50_19 <= CompressorOut_bh6_162_162(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w51_17 <= CompressorOut_bh6_162_162(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w52_16 <= CompressorOut_bh6_162_162(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_163_246 <= heap_bh6_w52_15 & heap_bh6_w52_14 & heap_bh6_w52_13;
   CompressorIn_bh6_163_247 <= heap_bh6_w53_14 & heap_bh6_w53_13;
   Compressor_bh6_163: Compressor_23_3
      port map ( R => CompressorOut_bh6_163_163   ,
                 X0 => CompressorIn_bh6_163_246,
                 X1 => CompressorIn_bh6_163_247);
   heap_bh6_w52_17 <= CompressorOut_bh6_163_163(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w53_15 <= CompressorOut_bh6_163_163(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w54_16 <= CompressorOut_bh6_163_163(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_164_248 <= heap_bh6_w59_6 & heap_bh6_w59_5 & heap_bh6_w59_4;
   CompressorIn_bh6_164_249 <= heap_bh6_w60_5 & heap_bh6_w60_4;
   Compressor_bh6_164: Compressor_23_3
      port map ( R => CompressorOut_bh6_164_164   ,
                 X0 => CompressorIn_bh6_164_248,
                 X1 => CompressorIn_bh6_164_249);
   heap_bh6_w59_8 <= CompressorOut_bh6_164_164(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w60_6 <= CompressorOut_bh6_164_164(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w61_7 <= CompressorOut_bh6_164_164(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_165_250 <= heap_bh6_w61_6 & heap_bh6_w61_5 & heap_bh6_w61_4;
   CompressorIn_bh6_165_251 <= heap_bh6_w62_5 & heap_bh6_w62_4;
   Compressor_bh6_165: Compressor_23_3
      port map ( R => CompressorOut_bh6_165_165   ,
                 X0 => CompressorIn_bh6_165_250,
                 X1 => CompressorIn_bh6_165_251);
   heap_bh6_w61_8 <= CompressorOut_bh6_165_165(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w62_6 <= CompressorOut_bh6_165_165(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w63_7 <= CompressorOut_bh6_165_165(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_166_252 <= heap_bh6_w63_6 & heap_bh6_w63_5 & heap_bh6_w63_4;
   CompressorIn_bh6_166_253 <= heap_bh6_w64_5 & heap_bh6_w64_4;
   Compressor_bh6_166: Compressor_23_3
      port map ( R => CompressorOut_bh6_166_166   ,
                 X0 => CompressorIn_bh6_166_252,
                 X1 => CompressorIn_bh6_166_253);
   heap_bh6_w63_8 <= CompressorOut_bh6_166_166(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w64_6 <= CompressorOut_bh6_166_166(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w65_7 <= CompressorOut_bh6_166_166(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_167_254 <= heap_bh6_w65_6 & heap_bh6_w65_5 & heap_bh6_w65_4;
   CompressorIn_bh6_167_255 <= heap_bh6_w66_5 & heap_bh6_w66_4;
   Compressor_bh6_167: Compressor_23_3
      port map ( R => CompressorOut_bh6_167_167   ,
                 X0 => CompressorIn_bh6_167_254,
                 X1 => CompressorIn_bh6_167_255);
   heap_bh6_w65_8 <= CompressorOut_bh6_167_167(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w66_6 <= CompressorOut_bh6_167_167(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w67_7 <= CompressorOut_bh6_167_167(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_168_256 <= heap_bh6_w67_6 & heap_bh6_w67_5 & heap_bh6_w67_4;
   CompressorIn_bh6_168_257 <= heap_bh6_w68_5 & heap_bh6_w68_4;
   Compressor_bh6_168: Compressor_23_3
      port map ( R => CompressorOut_bh6_168_168   ,
                 X0 => CompressorIn_bh6_168_256,
                 X1 => CompressorIn_bh6_168_257);
   heap_bh6_w67_8 <= CompressorOut_bh6_168_168(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w68_6 <= CompressorOut_bh6_168_168(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w69_7 <= CompressorOut_bh6_168_168(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_169_258 <= heap_bh6_w69_6 & heap_bh6_w69_5 & heap_bh6_w69_4;
   CompressorIn_bh6_169_259 <= heap_bh6_w70_5 & heap_bh6_w70_4;
   Compressor_bh6_169: Compressor_23_3
      port map ( R => CompressorOut_bh6_169_169   ,
                 X0 => CompressorIn_bh6_169_258,
                 X1 => CompressorIn_bh6_169_259);
   heap_bh6_w69_8 <= CompressorOut_bh6_169_169(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w70_6 <= CompressorOut_bh6_169_169(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w71_7 <= CompressorOut_bh6_169_169(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_170_260 <= heap_bh6_w71_6 & heap_bh6_w71_5 & heap_bh6_w71_4;
   CompressorIn_bh6_170_261 <= heap_bh6_w72_1 & heap_bh6_w72_0;
   Compressor_bh6_170: Compressor_23_3
      port map ( R => CompressorOut_bh6_170_170   ,
                 X0 => CompressorIn_bh6_170_260,
                 X1 => CompressorIn_bh6_170_261);
   heap_bh6_w71_8 <= CompressorOut_bh6_170_170(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w72_4 <= CompressorOut_bh6_170_170(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w73_5 <= CompressorOut_bh6_170_170(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_171_262 <= heap_bh6_w83_1 & heap_bh6_w83_0 & heap_bh6_w83_2;
   CompressorIn_bh6_171_263 <= heap_bh6_w84_1 & heap_bh6_w84_0;
   Compressor_bh6_171: Compressor_23_3
      port map ( R => CompressorOut_bh6_171_171   ,
                 X0 => CompressorIn_bh6_171_262,
                 X1 => CompressorIn_bh6_171_263);
   heap_bh6_w83_3 <= CompressorOut_bh6_171_171(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w84_2 <= CompressorOut_bh6_171_171(1); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w85_2 <= CompressorOut_bh6_171_171(2); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_172_264 <= heap_bh6_w35_14 & heap_bh6_w35_13 & heap_bh6_w35_12;
   Compressor_bh6_172: Compressor_3_2
      port map ( R => CompressorOut_bh6_172_172   ,
                 X0 => CompressorIn_bh6_172_264);
   heap_bh6_w35_16 <= CompressorOut_bh6_172_172(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w36_18 <= CompressorOut_bh6_172_172(1); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh6_173_265 <= heap_bh6_w54_15 & heap_bh6_w54_14 & heap_bh6_w54_13;
   Compressor_bh6_173: Compressor_3_2
      port map ( R => CompressorOut_bh6_173_173   ,
                 X0 => CompressorIn_bh6_173_265);
   heap_bh6_w54_17 <= CompressorOut_bh6_173_173(0); -- cycle= 1 cp= 9.53949e-10
   heap_bh6_w55_11 <= CompressorOut_bh6_173_173(1); -- cycle= 1 cp= 9.53949e-10

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_174_266 <= heap_bh6_w22_5_d1 & heap_bh6_w22_11_d1 & heap_bh6_w22_12_d1;
   CompressorIn_bh6_174_267 <= heap_bh6_w23_12_d1 & heap_bh6_w23_11_d1;
   Compressor_bh6_174: Compressor_23_3
      port map ( R => CompressorOut_bh6_174_174   ,
                 X0 => CompressorIn_bh6_174_266,
                 X1 => CompressorIn_bh6_174_267);
   heap_bh6_w22_13 <= CompressorOut_bh6_174_174(0); -- cycle= 2 cp= 0
   heap_bh6_w23_13 <= CompressorOut_bh6_174_174(1); -- cycle= 2 cp= 0
   heap_bh6_w24_15 <= CompressorOut_bh6_174_174(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_175_268 <= heap_bh6_w34_14_d1 & heap_bh6_w34_13_d1 & heap_bh6_w34_16_d1;
   CompressorIn_bh6_175_269 <= heap_bh6_w35_16_d1 & heap_bh6_w35_15_d1;
   Compressor_bh6_175: Compressor_23_3
      port map ( R => CompressorOut_bh6_175_175   ,
                 X0 => CompressorIn_bh6_175_268,
                 X1 => CompressorIn_bh6_175_269);
   heap_bh6_w34_17 <= CompressorOut_bh6_175_175(0); -- cycle= 2 cp= 0
   heap_bh6_w35_17 <= CompressorOut_bh6_175_175(1); -- cycle= 2 cp= 0
   heap_bh6_w36_19 <= CompressorOut_bh6_175_175(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_176_270 <= heap_bh6_w37_13_d1 & heap_bh6_w37_12_d1 & heap_bh6_w37_15_d1;
   CompressorIn_bh6_176_271 <= heap_bh6_w38_18_d1 & heap_bh6_w38_17_d1;
   Compressor_bh6_176: Compressor_23_3
      port map ( R => CompressorOut_bh6_176_176   ,
                 X0 => CompressorIn_bh6_176_270,
                 X1 => CompressorIn_bh6_176_271);
   heap_bh6_w37_16 <= CompressorOut_bh6_176_176(0); -- cycle= 2 cp= 0
   heap_bh6_w38_19 <= CompressorOut_bh6_176_176(1); -- cycle= 2 cp= 0
   heap_bh6_w39_17 <= CompressorOut_bh6_176_176(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_177_272 <= heap_bh6_w56_8_d1 & heap_bh6_w56_7_d1 & heap_bh6_w56_10_d1;
   CompressorIn_bh6_177_273 <= heap_bh6_w57_9_d1 & heap_bh6_w57_8_d1;
   Compressor_bh6_177: Compressor_23_3
      port map ( R => CompressorOut_bh6_177_177   ,
                 X0 => CompressorIn_bh6_177_272,
                 X1 => CompressorIn_bh6_177_273);
   heap_bh6_w56_11 <= CompressorOut_bh6_177_177(0); -- cycle= 2 cp= 0
   heap_bh6_w57_10 <= CompressorOut_bh6_177_177(1); -- cycle= 2 cp= 0
   heap_bh6_w58_8 <= CompressorOut_bh6_177_177(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_178_274 <= heap_bh6_w58_5_d1 & heap_bh6_w58_4_d1 & heap_bh6_w58_7_d1;
   CompressorIn_bh6_178_275 <= heap_bh6_w59_8_d1 & heap_bh6_w59_7_d1;
   Compressor_bh6_178: Compressor_23_3
      port map ( R => CompressorOut_bh6_178_178   ,
                 X0 => CompressorIn_bh6_178_274,
                 X1 => CompressorIn_bh6_178_275);
   heap_bh6_w58_9 <= CompressorOut_bh6_178_178(0); -- cycle= 2 cp= 0
   heap_bh6_w59_9 <= CompressorOut_bh6_178_178(1); -- cycle= 2 cp= 0
   heap_bh6_w60_7 <= CompressorOut_bh6_178_178(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_179_276 <= heap_bh6_w73_4_d1 & heap_bh6_w73_3_d1 & heap_bh6_w73_5_d1;
   CompressorIn_bh6_179_277 <= heap_bh6_w74_0_d1 & heap_bh6_w74_3_d1;
   Compressor_bh6_179: Compressor_23_3
      port map ( R => CompressorOut_bh6_179_179   ,
                 X0 => CompressorIn_bh6_179_276,
                 X1 => CompressorIn_bh6_179_277);
   heap_bh6_w73_6 <= CompressorOut_bh6_179_179(0); -- cycle= 2 cp= 0
   heap_bh6_w74_4 <= CompressorOut_bh6_179_179(1); -- cycle= 2 cp= 0
   heap_bh6_w75_5 <= CompressorOut_bh6_179_179(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_180_278 <= heap_bh6_w85_1_d1 & heap_bh6_w85_0_d1 & heap_bh6_w85_2_d1;
   CompressorIn_bh6_180_279 <= heap_bh6_w86_1_d1 & heap_bh6_w86_0_d1;
   Compressor_bh6_180: Compressor_23_3
      port map ( R => CompressorOut_bh6_180_180   ,
                 X0 => CompressorIn_bh6_180_278,
                 X1 => CompressorIn_bh6_180_279);
   heap_bh6_w85_3 <= CompressorOut_bh6_180_180(0); -- cycle= 2 cp= 0
   heap_bh6_w86_2 <= CompressorOut_bh6_180_180(1); -- cycle= 2 cp= 0
   heap_bh6_w87_2 <= CompressorOut_bh6_180_180(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_181_280 <= heap_bh6_w13_11_d1 & heap_bh6_w13_10_d1 & heap_bh6_w13_12_d1;
   CompressorIn_bh6_181_281(0) <= heap_bh6_w14_13_d1;
   Compressor_bh6_181: Compressor_13_3
      port map ( R => CompressorOut_bh6_181_181   ,
                 X0 => CompressorIn_bh6_181_280,
                 X1 => CompressorIn_bh6_181_281);
   heap_bh6_w13_13 <= CompressorOut_bh6_181_181(0); -- cycle= 2 cp= 0
   heap_bh6_w14_14 <= CompressorOut_bh6_181_181(1); -- cycle= 2 cp= 0
   heap_bh6_w15_14 <= CompressorOut_bh6_181_181(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_182_282 <= heap_bh6_w16_11_d1 & heap_bh6_w16_10_d1 & heap_bh6_w16_12_d1;
   CompressorIn_bh6_182_283(0) <= heap_bh6_w17_13_d1;
   Compressor_bh6_182: Compressor_13_3
      port map ( R => CompressorOut_bh6_182_182   ,
                 X0 => CompressorIn_bh6_182_282,
                 X1 => CompressorIn_bh6_182_283);
   heap_bh6_w16_13 <= CompressorOut_bh6_182_182(0); -- cycle= 2 cp= 0
   heap_bh6_w17_14 <= CompressorOut_bh6_182_182(1); -- cycle= 2 cp= 0
   heap_bh6_w18_14 <= CompressorOut_bh6_182_182(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_183_284 <= heap_bh6_w19_11_d1 & heap_bh6_w19_10_d1 & heap_bh6_w19_12_d1;
   CompressorIn_bh6_183_285(0) <= heap_bh6_w20_13_d1;
   Compressor_bh6_183: Compressor_13_3
      port map ( R => CompressorOut_bh6_183_183   ,
                 X0 => CompressorIn_bh6_183_284,
                 X1 => CompressorIn_bh6_183_285);
   heap_bh6_w19_13 <= CompressorOut_bh6_183_183(0); -- cycle= 2 cp= 0
   heap_bh6_w20_14 <= CompressorOut_bh6_183_183(1); -- cycle= 2 cp= 0
   heap_bh6_w21_14 <= CompressorOut_bh6_183_183(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_184_286 <= heap_bh6_w32_13_d1 & heap_bh6_w32_12_d1 & heap_bh6_w32_14_d1;
   CompressorIn_bh6_184_287(0) <= heap_bh6_w33_17_d1;
   Compressor_bh6_184: Compressor_13_3
      port map ( R => CompressorOut_bh6_184_184   ,
                 X0 => CompressorIn_bh6_184_286,
                 X1 => CompressorIn_bh6_184_287);
   heap_bh6_w32_15 <= CompressorOut_bh6_184_184(0); -- cycle= 2 cp= 0
   heap_bh6_w33_18 <= CompressorOut_bh6_184_184(1); -- cycle= 2 cp= 0
   heap_bh6_w34_18 <= CompressorOut_bh6_184_184(2); -- cycle= 2 cp= 0

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_185_288 <= heap_bh6_w24_14_d1 & heap_bh6_w24_13_d1 & heap_bh6_w24_15;
   CompressorIn_bh6_185_289 <= heap_bh6_w25_13_d1 & heap_bh6_w25_12_d1;
   Compressor_bh6_185: Compressor_23_3
      port map ( R => CompressorOut_bh6_185_185   ,
                 X0 => CompressorIn_bh6_185_288,
                 X1 => CompressorIn_bh6_185_289);
   heap_bh6_w24_16 <= CompressorOut_bh6_185_185(0); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w25_14 <= CompressorOut_bh6_185_185(1); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w26_15 <= CompressorOut_bh6_185_185(2); -- cycle= 2 cp= 3.7226e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_186_290 <= heap_bh6_w39_13_d1 & heap_bh6_w39_16_d1 & heap_bh6_w39_17;
   CompressorIn_bh6_186_291 <= heap_bh6_w40_17_d1 & heap_bh6_w40_16_d1;
   Compressor_bh6_186: Compressor_23_3
      port map ( R => CompressorOut_bh6_186_186   ,
                 X0 => CompressorIn_bh6_186_290,
                 X1 => CompressorIn_bh6_186_291);
   heap_bh6_w39_18 <= CompressorOut_bh6_186_186(0); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w40_18 <= CompressorOut_bh6_186_186(1); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w41_18 <= CompressorOut_bh6_186_186(2); -- cycle= 2 cp= 3.7226e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_187_292 <= heap_bh6_w75_4_d1 & heap_bh6_w75_3_d1 & heap_bh6_w75_5;
   CompressorIn_bh6_187_293 <= heap_bh6_w76_0_d1 & heap_bh6_w76_3_d1;
   Compressor_bh6_187: Compressor_23_3
      port map ( R => CompressorOut_bh6_187_187   ,
                 X0 => CompressorIn_bh6_187_292,
                 X1 => CompressorIn_bh6_187_293);
   heap_bh6_w75_6 <= CompressorOut_bh6_187_187(0); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w76_4 <= CompressorOut_bh6_187_187(1); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w77_5 <= CompressorOut_bh6_187_187(2); -- cycle= 2 cp= 3.7226e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_188_294 <= heap_bh6_w87_1_d1 & heap_bh6_w87_0_d1 & heap_bh6_w87_2;
   CompressorIn_bh6_188_295 <= heap_bh6_w88_1_d1 & heap_bh6_w88_0_d1;
   Compressor_bh6_188: Compressor_23_3
      port map ( R => CompressorOut_bh6_188_188   ,
                 X0 => CompressorIn_bh6_188_294,
                 X1 => CompressorIn_bh6_188_295);
   heap_bh6_w87_3 <= CompressorOut_bh6_188_188(0); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w88_2 <= CompressorOut_bh6_188_188(1); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w89_1 <= CompressorOut_bh6_188_188(2); -- cycle= 2 cp= 3.7226e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_189_296 <= heap_bh6_w36_18_d1 & heap_bh6_w36_17_d1 & heap_bh6_w36_19;
   CompressorIn_bh6_189_297(0) <= heap_bh6_w37_16;
   Compressor_bh6_189: Compressor_13_3
      port map ( R => CompressorOut_bh6_189_189   ,
                 X0 => CompressorIn_bh6_189_296,
                 X1 => CompressorIn_bh6_189_297);
   heap_bh6_w36_20 <= CompressorOut_bh6_189_189(0); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w37_17 <= CompressorOut_bh6_189_189(1); -- cycle= 2 cp= 3.7226e-10
   heap_bh6_w38_20 <= CompressorOut_bh6_189_189(2); -- cycle= 2 cp= 3.7226e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_190_298 <= heap_bh6_w41_14_d1 & heap_bh6_w41_17_d1 & heap_bh6_w41_18;
   CompressorIn_bh6_190_299 <= heap_bh6_w42_19_d1 & heap_bh6_w42_18_d1;
   Compressor_bh6_190: Compressor_23_3
      port map ( R => CompressorOut_bh6_190_190   ,
                 X0 => CompressorIn_bh6_190_298,
                 X1 => CompressorIn_bh6_190_299);
   heap_bh6_w41_19 <= CompressorOut_bh6_190_190(0); -- cycle= 2 cp= 7.4452e-10
   heap_bh6_w42_20 <= CompressorOut_bh6_190_190(1); -- cycle= 2 cp= 7.4452e-10
   heap_bh6_w43_16 <= CompressorOut_bh6_190_190(2); -- cycle= 2 cp= 7.4452e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_191_300 <= heap_bh6_w77_4_d1 & heap_bh6_w77_3_d1 & heap_bh6_w77_5;
   CompressorIn_bh6_191_301 <= heap_bh6_w78_0_d1 & heap_bh6_w78_3_d1;
   Compressor_bh6_191: Compressor_23_3
      port map ( R => CompressorOut_bh6_191_191   ,
                 X0 => CompressorIn_bh6_191_300,
                 X1 => CompressorIn_bh6_191_301);
   heap_bh6_w77_6 <= CompressorOut_bh6_191_191(0); -- cycle= 2 cp= 7.4452e-10
   heap_bh6_w78_4 <= CompressorOut_bh6_191_191(1); -- cycle= 2 cp= 7.4452e-10
   heap_bh6_w79_5 <= CompressorOut_bh6_191_191(2); -- cycle= 2 cp= 7.4452e-10

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_192_302 <= heap_bh6_w43_12_d1 & heap_bh6_w43_15_d1 & heap_bh6_w43_16;
   CompressorIn_bh6_192_303 <= heap_bh6_w44_19_d1 & heap_bh6_w44_18_d1;
   Compressor_bh6_192: Compressor_23_3
      port map ( R => CompressorOut_bh6_192_192   ,
                 X0 => CompressorIn_bh6_192_302,
                 X1 => CompressorIn_bh6_192_303);
   heap_bh6_w43_17 <= CompressorOut_bh6_192_192(0); -- cycle= 2 cp= 1.11678e-09
   heap_bh6_w44_20 <= CompressorOut_bh6_192_192(1); -- cycle= 2 cp= 1.11678e-09
   heap_bh6_w45_18 <= CompressorOut_bh6_192_192(2); -- cycle= 2 cp= 1.11678e-09

   ----------------Synchro barrier, entering cycle 2----------------
   CompressorIn_bh6_193_304 <= heap_bh6_w79_4_d1 & heap_bh6_w79_3_d1 & heap_bh6_w79_5;
   CompressorIn_bh6_193_305 <= heap_bh6_w80_0_d1 & heap_bh6_w80_3_d1;
   Compressor_bh6_193: Compressor_23_3
      port map ( R => CompressorOut_bh6_193_193   ,
                 X0 => CompressorIn_bh6_193_304,
                 X1 => CompressorIn_bh6_193_305);
   heap_bh6_w79_6 <= CompressorOut_bh6_193_193(0); -- cycle= 2 cp= 1.11678e-09
   heap_bh6_w80_4 <= CompressorOut_bh6_193_193(1); -- cycle= 2 cp= 1.11678e-09
   heap_bh6_w81_5 <= CompressorOut_bh6_193_193(2); -- cycle= 2 cp= 1.11678e-09

   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   CompressorIn_bh6_194_306 <= heap_bh6_w45_14_d2 & heap_bh6_w45_17_d2 & heap_bh6_w45_18_d1;
   CompressorIn_bh6_194_307 <= heap_bh6_w46_17_d2 & heap_bh6_w46_16_d2;
   Compressor_bh6_194: Compressor_23_3
      port map ( R => CompressorOut_bh6_194_194   ,
                 X0 => CompressorIn_bh6_194_306,
                 X1 => CompressorIn_bh6_194_307);
   heap_bh6_w45_19 <= CompressorOut_bh6_194_194(0); -- cycle= 3 cp= 0
   heap_bh6_w46_18 <= CompressorOut_bh6_194_194(1); -- cycle= 3 cp= 0
   heap_bh6_w47_18 <= CompressorOut_bh6_194_194(2); -- cycle= 3 cp= 0

   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   CompressorIn_bh6_195_308 <= heap_bh6_w81_4_d2 & heap_bh6_w81_3_d2 & heap_bh6_w81_5_d1;
   CompressorIn_bh6_195_309(0) <= heap_bh6_w82_2_d2;
   Compressor_bh6_195: Compressor_13_3
      port map ( R => CompressorOut_bh6_195_195   ,
                 X0 => CompressorIn_bh6_195_308,
                 X1 => CompressorIn_bh6_195_309);
   heap_bh6_w81_6 <= CompressorOut_bh6_195_195(0); -- cycle= 3 cp= 0
   heap_bh6_w82_3 <= CompressorOut_bh6_195_195(1); -- cycle= 3 cp= 0
   heap_bh6_w83_4 <= CompressorOut_bh6_195_195(2); -- cycle= 3 cp= 0

   ----------------Synchro barrier, entering cycle 3----------------
   CompressorIn_bh6_196_310 <= heap_bh6_w47_14_d2 & heap_bh6_w47_17_d2 & heap_bh6_w47_18;
   CompressorIn_bh6_196_311 <= heap_bh6_w48_19_d2 & heap_bh6_w48_18_d2;
   Compressor_bh6_196: Compressor_23_3
      port map ( R => CompressorOut_bh6_196_196   ,
                 X0 => CompressorIn_bh6_196_310,
                 X1 => CompressorIn_bh6_196_311);
   heap_bh6_w47_19 <= CompressorOut_bh6_196_196(0); -- cycle= 3 cp= 3.7226e-10
   heap_bh6_w48_20 <= CompressorOut_bh6_196_196(1); -- cycle= 3 cp= 3.7226e-10
   heap_bh6_w49_16 <= CompressorOut_bh6_196_196(2); -- cycle= 3 cp= 3.7226e-10

   ----------------Synchro barrier, entering cycle 3----------------
   CompressorIn_bh6_197_312 <= heap_bh6_w49_12_d2 & heap_bh6_w49_15_d2 & heap_bh6_w49_16;
   CompressorIn_bh6_197_313 <= heap_bh6_w50_19_d2 & heap_bh6_w50_18_d2;
   Compressor_bh6_197: Compressor_23_3
      port map ( R => CompressorOut_bh6_197_197   ,
                 X0 => CompressorIn_bh6_197_312,
                 X1 => CompressorIn_bh6_197_313);
   heap_bh6_w49_17 <= CompressorOut_bh6_197_197(0); -- cycle= 3 cp= 7.4452e-10
   heap_bh6_w50_20 <= CompressorOut_bh6_197_197(1); -- cycle= 3 cp= 7.4452e-10
   heap_bh6_w51_18 <= CompressorOut_bh6_197_197(2); -- cycle= 3 cp= 7.4452e-10

   ----------------Synchro barrier, entering cycle 3----------------
   CompressorIn_bh6_198_314 <= heap_bh6_w51_14_d2 & heap_bh6_w51_17_d2 & heap_bh6_w51_18;
   CompressorIn_bh6_198_315 <= heap_bh6_w52_17_d2 & heap_bh6_w52_16_d2;
   Compressor_bh6_198: Compressor_23_3
      port map ( R => CompressorOut_bh6_198_198   ,
                 X0 => CompressorIn_bh6_198_314,
                 X1 => CompressorIn_bh6_198_315);
   heap_bh6_w51_19 <= CompressorOut_bh6_198_198(0); -- cycle= 3 cp= 1.11678e-09
   heap_bh6_w52_18 <= CompressorOut_bh6_198_198(1); -- cycle= 3 cp= 1.11678e-09
   heap_bh6_w53_16 <= CompressorOut_bh6_198_198(2); -- cycle= 3 cp= 1.11678e-09

   ----------------Synchro barrier, entering cycle 3----------------
   ----------------Synchro barrier, entering cycle 4----------------
   CompressorIn_bh6_199_316 <= heap_bh6_w53_12_d3 & heap_bh6_w53_15_d3 & heap_bh6_w53_16_d1;
   CompressorIn_bh6_199_317 <= heap_bh6_w54_17_d3 & heap_bh6_w54_16_d3;
   Compressor_bh6_199: Compressor_23_3
      port map ( R => CompressorOut_bh6_199_199   ,
                 X0 => CompressorIn_bh6_199_316,
                 X1 => CompressorIn_bh6_199_317);
   heap_bh6_w53_17 <= CompressorOut_bh6_199_199(0); -- cycle= 4 cp= 0
   heap_bh6_w54_18 <= CompressorOut_bh6_199_199(1); -- cycle= 4 cp= 0
   heap_bh6_w55_12 <= CompressorOut_bh6_199_199(2); -- cycle= 4 cp= 0

   ----------------Synchro barrier, entering cycle 4----------------
   CompressorIn_bh6_200_318 <= heap_bh6_w55_11_d3 & heap_bh6_w55_10_d3 & heap_bh6_w55_12;
   CompressorIn_bh6_200_319(0) <= heap_bh6_w56_11_d2;
   Compressor_bh6_200: Compressor_13_3
      port map ( R => CompressorOut_bh6_200_200   ,
                 X0 => CompressorIn_bh6_200_318,
                 X1 => CompressorIn_bh6_200_319);
   heap_bh6_w55_13 <= CompressorOut_bh6_200_200(0); -- cycle= 4 cp= 3.7226e-10
   heap_bh6_w56_12 <= CompressorOut_bh6_200_200(1); -- cycle= 4 cp= 3.7226e-10
   heap_bh6_w57_11 <= CompressorOut_bh6_200_200(2); -- cycle= 4 cp= 3.7226e-10
   ----------------Synchro barrier, entering cycle 4----------------
   ----------------Synchro barrier, entering cycle 5----------------
   finalAdderIn0_bh6 <= "0" & heap_bh6_w105_0_d4 & heap_bh6_w104_0_d4 & heap_bh6_w103_0_d4 & heap_bh6_w102_0_d4 & heap_bh6_w101_0_d4 & heap_bh6_w100_0_d4 & heap_bh6_w99_0_d4 & heap_bh6_w98_0_d4 & heap_bh6_w97_0_d4 & heap_bh6_w96_0_d4 & heap_bh6_w95_0_d4 & heap_bh6_w94_0_d4 & heap_bh6_w93_0_d4 & heap_bh6_w92_0_d4 & heap_bh6_w91_0_d4 & heap_bh6_w90_0_d4 & heap_bh6_w89_0_d4 & heap_bh6_w88_2_d3 & heap_bh6_w87_3_d3 & heap_bh6_w86_2_d3 & heap_bh6_w85_3_d3 & heap_bh6_w84_2_d4 & heap_bh6_w83_3_d4 & heap_bh6_w82_3_d2 & heap_bh6_w81_6_d2 & heap_bh6_w80_4_d3 & heap_bh6_w79_6_d3 & heap_bh6_w78_4_d3 & heap_bh6_w77_6_d3 & heap_bh6_w76_4_d3 & heap_bh6_w75_6_d3 & heap_bh6_w74_4_d3 & heap_bh6_w73_6_d3 & heap_bh6_w72_3_d4 & heap_bh6_w71_8_d4 & heap_bh6_w70_6_d4 & heap_bh6_w69_8_d4 & heap_bh6_w68_6_d4 & heap_bh6_w67_8_d4 & heap_bh6_w66_6_d4 & heap_bh6_w65_8_d4 & heap_bh6_w64_6_d4 & heap_bh6_w63_8_d4 & heap_bh6_w62_6_d4 & heap_bh6_w61_8_d4 & heap_bh6_w60_6_d4 & heap_bh6_w59_9_d3 & heap_bh6_w58_9_d3 & heap_bh6_w57_10_d3 & heap_bh6_w56_12_d1 & heap_bh6_w55_13_d1 & heap_bh6_w54_18_d1 & heap_bh6_w53_17_d1 & heap_bh6_w52_18_d2 & heap_bh6_w51_19_d2 & heap_bh6_w50_20_d2 & heap_bh6_w49_17_d2 & heap_bh6_w48_20_d2 & heap_bh6_w47_19_d2 & heap_bh6_w46_18_d2 & heap_bh6_w45_19_d2 & heap_bh6_w44_20_d3 & heap_bh6_w43_17_d3 & heap_bh6_w42_20_d3 & heap_bh6_w41_19_d3 & heap_bh6_w40_18_d3 & heap_bh6_w39_18_d3 & heap_bh6_w38_19_d3 & heap_bh6_w37_17_d3 & heap_bh6_w36_20_d3 & heap_bh6_w35_17_d3 & heap_bh6_w34_18_d3 & heap_bh6_w33_18_d3 & heap_bh6_w32_15_d3 & heap_bh6_w31_13_d4 & heap_bh6_w30_17_d4 & heap_bh6_w29_13_d4 & heap_bh6_w28_16_d4 & heap_bh6_w27_13_d4 & heap_bh6_w26_14_d4 & heap_bh6_w25_14_d3 & heap_bh6_w24_16_d3 & heap_bh6_w23_13_d3 & heap_bh6_w22_13_d3 & heap_bh6_w21_13_d4 & heap_bh6_w20_14_d3 & heap_bh6_w19_13_d3 & heap_bh6_w18_13_d4 & heap_bh6_w17_14_d3 & heap_bh6_w16_13_d3 & heap_bh6_w15_13_d4 & heap_bh6_w14_14_d3 & heap_bh6_w13_13_d3 & heap_bh6_w12_13_d4 & heap_bh6_w11_13_d4 & heap_bh6_w10_11_d4 & heap_bh6_w9_12_d4 & heap_bh6_w8_6_d4 & heap_bh6_w7_10_d4 & heap_bh6_w6_8_d4 & heap_bh6_w5_5_d5 & heap_bh6_w4_5_d5 & heap_bh6_w3_0_d5;
   finalAdderIn1_bh6 <= "0" & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh6_w89_1_d3 & '0' & '0' & '0' & '0' & '0' & heap_bh6_w83_4_d2 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh6_w72_4_d4 & heap_bh6_w71_7_d4 & '0' & heap_bh6_w69_7_d4 & '0' & heap_bh6_w67_7_d4 & '0' & heap_bh6_w65_7_d4 & '0' & heap_bh6_w63_7_d4 & '0' & heap_bh6_w61_7_d4 & heap_bh6_w60_7_d3 & '0' & heap_bh6_w58_8_d3 & heap_bh6_w57_11_d1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh6_w38_20_d3 & '0' & '0' & '0' & heap_bh6_w34_17_d3 & '0' & '0' & heap_bh6_w31_16_d4 & heap_bh6_w30_16_d4 & '0' & heap_bh6_w28_15_d4 & heap_bh6_w27_16_d4 & heap_bh6_w26_15_d3 & '0' & '0' & '0' & '0' & heap_bh6_w21_14_d3 & '0' & '0' & heap_bh6_w18_14_d3 & '0' & '0' & heap_bh6_w15_14_d3 & '0' & '0' & '0' & '0' & heap_bh6_w10_10_d4 & heap_bh6_w9_11_d4 & heap_bh6_w8_12_d4 & '0' & '0' & heap_bh6_w5_6_d5 & heap_bh6_w4_4_d5 & heap_bh6_w3_3_d5;
   finalAdderCin_bh6 <= '0';
   Adder_final6_0: IntAdder_104_f700_uid543  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh6,
                 R => finalAdderOut_bh6   ,
                 X => finalAdderIn0_bh6,
                 Y => finalAdderIn1_bh6);
   ----------------Synchro barrier, entering cycle 8----------------
   -- concatenate all the compressed chunks
   CompressionResult6 <= finalAdderOut_bh6 & tempR_bh6_1_d8 & tempR_bh6_0_d8;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult6(105 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_65_f700_uid553
--                    (IntAdderAlternative_65_F700_uid557)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_65_f700_uid553 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(64 downto 0);
          Y : in  std_logic_vector(64 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(64 downto 0)   );
end entity;

architecture arch of IntAdder_65_f700_uid553 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(13 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(12 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(13 downto 0);
signal sum_l2_idx2 :  std_logic_vector(12 downto 0);
signal c_l2_idx2 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            c_l1_idx1_d1 <=  c_l1_idx1;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(64 downto 52)) + ( "0" & Y(64 downto 52));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(12 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(13 downto 13);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(12 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(13 downto 13);
   R <= sum_l2_idx2(12 downto 0) & sum_l1_idx1_d1(25 downto 0) & sum_l0_idx0_d2(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                                    mult
--                    (FPMult_11_52_11_52_11_52_F700_uid2)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2011
--------------------------------------------------------------------------------
-- Pipeline depth: 11 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity mult is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          Y : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of mult is
   component IntMultiplier_UsingDSP_53_53_106_unsigned_F700_uid4 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(52 downto 0);
             Y : in  std_logic_vector(52 downto 0);
             R : out  std_logic_vector(105 downto 0)   );
   end component;

   component IntAdder_65_f700_uid553 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(64 downto 0);
             Y : in  std_logic_vector(64 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(64 downto 0)   );
   end component;

signal sign, sign_d1, sign_d2, sign_d3, sign_d4, sign_d5, sign_d6, sign_d7, sign_d8, sign_d9, sign_d10, sign_d11 :  std_logic;
signal expX :  std_logic_vector(10 downto 0);
signal expY :  std_logic_vector(10 downto 0);
signal expSumPreSub, expSumPreSub_d1 :  std_logic_vector(12 downto 0);
signal bias, bias_d1 :  std_logic_vector(12 downto 0);
signal expSum, expSum_d1, expSum_d2, expSum_d3, expSum_d4, expSum_d5, expSum_d6, expSum_d7 :  std_logic_vector(12 downto 0);
signal sigX :  std_logic_vector(52 downto 0);
signal sigY :  std_logic_vector(52 downto 0);
signal sigProd :  std_logic_vector(105 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1, exc_d2, exc_d3, exc_d4, exc_d5, exc_d6, exc_d7, exc_d8, exc_d9, exc_d10, exc_d11 :  std_logic_vector(1 downto 0);
signal norm :  std_logic;
signal expPostNorm :  std_logic_vector(12 downto 0);
signal sigProdExt, sigProdExt_d1 :  std_logic_vector(105 downto 0);
signal expSig, expSig_d1 :  std_logic_vector(64 downto 0);
signal sticky, sticky_d1 :  std_logic;
signal guard :  std_logic;
signal round :  std_logic;
signal expSigPostRound :  std_logic_vector(64 downto 0);
signal excPostNorm :  std_logic_vector(1 downto 0);
signal finalExc :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sign_d1 <=  sign;
            sign_d2 <=  sign_d1;
            sign_d3 <=  sign_d2;
            sign_d4 <=  sign_d3;
            sign_d5 <=  sign_d4;
            sign_d6 <=  sign_d5;
            sign_d7 <=  sign_d6;
            sign_d8 <=  sign_d7;
            sign_d9 <=  sign_d8;
            sign_d10 <=  sign_d9;
            sign_d11 <=  sign_d10;
            expSumPreSub_d1 <=  expSumPreSub;
            bias_d1 <=  bias;
            expSum_d1 <=  expSum;
            expSum_d2 <=  expSum_d1;
            expSum_d3 <=  expSum_d2;
            expSum_d4 <=  expSum_d3;
            expSum_d5 <=  expSum_d4;
            expSum_d6 <=  expSum_d5;
            expSum_d7 <=  expSum_d6;
            exc_d1 <=  exc;
            exc_d2 <=  exc_d1;
            exc_d3 <=  exc_d2;
            exc_d4 <=  exc_d3;
            exc_d5 <=  exc_d4;
            exc_d6 <=  exc_d5;
            exc_d7 <=  exc_d6;
            exc_d8 <=  exc_d7;
            exc_d9 <=  exc_d8;
            exc_d10 <=  exc_d9;
            exc_d11 <=  exc_d10;
            sigProdExt_d1 <=  sigProdExt;
            expSig_d1 <=  expSig;
            sticky_d1 <=  sticky;
         end if;
      end process;
   sign <= X(63) xor Y(63);
   expX <= X(62 downto 52);
   expY <= Y(62 downto 52);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(1023,13);
   ----------------Synchro barrier, entering cycle 1----------------
   expSum <= expSumPreSub_d1 - bias_d1;
   ----------------Synchro barrier, entering cycle 0----------------
   sigX <= "1" & X(51 downto 0);
   sigY <= "1" & Y(51 downto 0);
   SignificandMultiplication: IntMultiplier_UsingDSP_53_53_106_unsigned_F700_uid4  -- pipelineDepth=8 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => sigProd,
                 X => sigX,
                 Y => sigY);
   ----------------Synchro barrier, entering cycle 8----------------
   ----------------Synchro barrier, entering cycle 0----------------
   excSel <= X(65 downto 64) & Y(65 downto 64);
   with excSel select 
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   ----------------Synchro barrier, entering cycle 8----------------
   norm <= sigProd(105);
   -- exponent update
   expPostNorm <= expSum_d7 + ("000000000000" & norm);
   ----------------Synchro barrier, entering cycle 8----------------
   -- significand normalization shift
   sigProdExt <= sigProd(104 downto 0) & "0" when norm='1' else
                         sigProd(103 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(105 downto 54);
   sticky <= sigProdExt(53);
   ----------------Synchro barrier, entering cycle 9----------------
   guard <= '0' when sigProdExt_d1(52 downto 0)="00000000000000000000000000000000000000000000000000000" else '1';
   round <= sticky_d1 and ( (guard and not(sigProdExt_d1(54))) or (sigProdExt_d1(54) ))  ;
   RoundingAdder: IntAdder_65_f700_uid553  -- pipelineDepth=2 maxInDelay=3.7226e-10
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => round,
                 R => expSigPostRound   ,
                 X => expSig_d1,
                 Y => "00000000000000000000000000000000000000000000000000000000000000000");
   ----------------Synchro barrier, entering cycle 11----------------
   with expSigPostRound(64 downto 63) select
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d11 select 
   finalExc <= exc_d11 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d11 & expSigPostRound(62 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_66_f700_uid563
--                    (IntAdderAlternative_66_F700_uid567)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_66_f700_uid563 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(65 downto 0);
          Y : in  std_logic_vector(65 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(65 downto 0)   );
end entity;

architecture arch of IntAdder_66_f700_uid563 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(14 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(13 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(14 downto 0);
signal sum_l2_idx2 :  std_logic_vector(13 downto 0);
signal c_l2_idx2 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            c_l1_idx1_d1 <=  c_l1_idx1;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(65 downto 52)) + ( "0" & Y(65 downto 52));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(13 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(14 downto 14);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(13 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(14 downto 14);
   R <= sum_l2_idx2(13 downto 0) & sum_l1_idx1_d1(25 downto 0) & sum_l0_idx0_d2(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                   RightShifter_53_by_max_55_F700_uid571
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter_53_by_max_55_F700_uid571 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(52 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(107 downto 0)   );
end entity;

architecture arch of RightShifter_53_by_max_55_F700_uid571 is
signal level0 :  std_logic_vector(52 downto 0);
signal ps, ps_d1, ps_d2, ps_d3 :  std_logic_vector(5 downto 0);
signal level1, level1_d1 :  std_logic_vector(53 downto 0);
signal level2 :  std_logic_vector(55 downto 0);
signal level3, level3_d1 :  std_logic_vector(59 downto 0);
signal level4 :  std_logic_vector(67 downto 0);
signal level5, level5_d1 :  std_logic_vector(83 downto 0);
signal level6 :  std_logic_vector(115 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            ps_d1 <=  ps;
            ps_d2 <=  ps_d1;
            ps_d3 <=  ps_d2;
            level1_d1 <=  level1;
            level3_d1 <=  level3;
            level5_d1 <=  level5;
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 1----------------
   level2<=  (1 downto 0 => '0') & level1_d1 when ps_d1(1) = '1' else    level1_d1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps_d1(2) = '1' else    level2 & (3 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 2----------------
   level4<=  (7 downto 0 => '0') & level3_d1 when ps_d2(3) = '1' else    level3_d1 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps_d2(4) = '1' else    level4 & (15 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 3----------------
   level6<=  (31 downto 0 => '0') & level5_d1 when ps_d3(5) = '1' else    level5_d1 & (31 downto 0 => '0');
   R <= level6(115 downto 8);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_56_f700_uid575
--                    (IntAdderAlternative_56_F700_uid579)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_56_f700_uid575 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(55 downto 0);
          Y : in  std_logic_vector(55 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(55 downto 0)   );
end entity;

architecture arch of IntAdder_56_f700_uid575 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(4 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(3 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(4 downto 0);
signal sum_l2_idx2 :  std_logic_vector(3 downto 0);
signal c_l2_idx2 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            c_l1_idx1_d1 <=  c_l1_idx1;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(55 downto 52)) + ( "0" & Y(55 downto 52));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(3 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(4 downto 4);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(3 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(4 downto 4);
   R <= sum_l2_idx2(3 downto 0) & sum_l1_idx1_d1(25 downto 0) & sum_l0_idx0_d2(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                LZCShifter_57_to_57_counting_64_F700_uid583
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 4 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_57_to_57_counting_64_F700_uid583 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(56 downto 0);
          Count : out  std_logic_vector(5 downto 0);
          O : out  std_logic_vector(56 downto 0)   );
end entity;

architecture arch of LZCShifter_57_to_57_counting_64_F700_uid583 is
signal level6 :  std_logic_vector(56 downto 0);
signal count5, count5_d1, count5_d2, count5_d3, count5_d4 :  std_logic;
signal level5, level5_d1 :  std_logic_vector(56 downto 0);
signal count4, count4_d1, count4_d2, count4_d3 :  std_logic;
signal level4, level4_d1 :  std_logic_vector(56 downto 0);
signal count3, count3_d1, count3_d2, count3_d3 :  std_logic;
signal level3 :  std_logic_vector(56 downto 0);
signal count2, count2_d1, count2_d2 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(56 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1, level1_d1 :  std_logic_vector(56 downto 0);
signal count0, count0_d1 :  std_logic;
signal level0 :  std_logic_vector(56 downto 0);
signal sCount :  std_logic_vector(5 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            count5_d1 <=  count5;
            count5_d2 <=  count5_d1;
            count5_d3 <=  count5_d2;
            count5_d4 <=  count5_d3;
            level5_d1 <=  level5;
            count4_d1 <=  count4;
            count4_d2 <=  count4_d1;
            count4_d3 <=  count4_d2;
            level4_d1 <=  level4;
            count3_d1 <=  count3;
            count3_d2 <=  count3_d1;
            count3_d3 <=  count3_d2;
            count2_d1 <=  count2;
            count2_d2 <=  count2_d1;
            level2_d1 <=  level2;
            count1_d1 <=  count1;
            level1_d1 <=  level1;
            count0_d1 <=  count0;
         end if;
      end process;
   level6 <= I ;
   count5<= '1' when level6(56 downto 25) = (56 downto 25=>'0') else '0';
   level5<= level6(56 downto 0) when count5='0' else level6(24 downto 0) & (31 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 1----------------
   count4<= '1' when level5_d1(56 downto 41) = (56 downto 41=>'0') else '0';
   level4<= level5_d1(56 downto 0) when count4='0' else level5_d1(40 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(56 downto 49) = (56 downto 49=>'0') else '0';
   ----------------Synchro barrier, entering cycle 2----------------
   level3<= level4_d1(56 downto 0) when count3_d1='0' else level4_d1(48 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(56 downto 53) = (56 downto 53=>'0') else '0';
   level2<= level3(56 downto 0) when count2='0' else level3(52 downto 0) & (3 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 3----------------
   count1<= '1' when level2_d1(56 downto 55) = (56 downto 55=>'0') else '0';
   level1<= level2_d1(56 downto 0) when count1='0' else level2_d1(54 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(56 downto 56) = (56 downto 56=>'0') else '0';
   ----------------Synchro barrier, entering cycle 4----------------
   level0<= level1_d1(56 downto 0) when count0_d1='0' else level1_d1(55 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count5_d4 & count4_d3 & count3_d3 & count2_d2 & count1_d1 & count0_d1;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_66_f700_uid587
--                    (IntAdderAlternative_66_F700_uid591)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_66_f700_uid587 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(65 downto 0);
          Y : in  std_logic_vector(65 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(65 downto 0)   );
end entity;

architecture arch of IntAdder_66_f700_uid587 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(14 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(13 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(14 downto 0);
signal sum_l2_idx2 :  std_logic_vector(13 downto 0);
signal c_l2_idx2 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            c_l1_idx1_d1 <=  c_l1_idx1;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(65 downto 52)) + ( "0" & Y(65 downto 52));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(13 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(14 downto 14);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(13 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(14 downto 14);
   R <= sum_l2_idx2(13 downto 0) & sum_l1_idx1_d1(25 downto 0) & sum_l0_idx0_d2(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                                    add
--                         (FPAdd_11_52_F700_uid561)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 16 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity add is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          Y : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of add is
   component IntAdder_66_f700_uid563 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(65 downto 0);
             Y : in  std_logic_vector(65 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(65 downto 0)   );
   end component;

   component RightShifter_53_by_max_55_F700_uid571 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(52 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(107 downto 0)   );
   end component;

   component IntAdder_56_f700_uid575 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(55 downto 0);
             Y : in  std_logic_vector(55 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(55 downto 0)   );
   end component;

   component LZCShifter_57_to_57_counting_64_F700_uid583 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(56 downto 0);
             Count : out  std_logic_vector(5 downto 0);
             O : out  std_logic_vector(56 downto 0)   );
   end component;

   component IntAdder_66_f700_uid587 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(65 downto 0);
             Y : in  std_logic_vector(65 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(65 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(64 downto 0);
signal excExpFracY :  std_logic_vector(64 downto 0);
signal eXmeY, eXmeY_d1, eXmeY_d2 :  std_logic_vector(11 downto 0);
signal eYmeX, eYmeX_d1, eYmeX_d2 :  std_logic_vector(11 downto 0);
signal addCmpOp1 :  std_logic_vector(65 downto 0);
signal addCmpOp2 :  std_logic_vector(65 downto 0);
signal cmpRes :  std_logic_vector(65 downto 0);
signal swap :  std_logic;
signal newX, newX_d1, newX_d2, newX_d3, newX_d4, newX_d5 :  std_logic_vector(65 downto 0);
signal newY, newY_d1 :  std_logic_vector(65 downto 0);
signal expX, expX_d1, expX_d2, expX_d3, expX_d4, expX_d5, expX_d6, expX_d7 :  std_logic_vector(10 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY, excY_d1 :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6, EffSub_d7, EffSub_d8, EffSub_d9, EffSub_d10, EffSub_d11, EffSub_d12, EffSub_d13, EffSub_d14 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(52 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6, excRt_d7, excRt_d8, excRt_d9, excRt_d10, excRt_d11, excRt_d12, excRt_d13 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5, signR_d6, signR_d7, signR_d8, signR_d9, signR_d10, signR_d11, signR_d12, signR_d13 :  std_logic;
signal expDiff, expDiff_d1 :  std_logic_vector(11 downto 0);
signal shiftedOut, shiftedOut_d1 :  std_logic;
signal shiftVal :  std_logic_vector(5 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(107 downto 0);
signal sticky, sticky_d1, sticky_d2 :  std_logic;
signal fracYfar :  std_logic_vector(55 downto 0);
signal EffSubVector :  std_logic_vector(55 downto 0);
signal fracYfarXorOp :  std_logic_vector(55 downto 0);
signal fracXfar :  std_logic_vector(55 downto 0);
signal cInAddFar :  std_logic;
signal fracAddResult :  std_logic_vector(55 downto 0);
signal fracGRS :  std_logic_vector(56 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3, extendedExpInc_d4 :  std_logic_vector(12 downto 0);
signal nZerosNew :  std_logic_vector(5 downto 0);
signal shiftedFrac :  std_logic_vector(56 downto 0);
signal updatedExp :  std_logic_vector(12 downto 0);
signal eqdiffsign, eqdiffsign_d1, eqdiffsign_d2, eqdiffsign_d3 :  std_logic;
signal expFrac :  std_logic_vector(65 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal grd :  std_logic;
signal lsb :  std_logic;
signal addToRoundBit :  std_logic;
signal RoundedExpFrac :  std_logic_vector(65 downto 0);
signal upExc :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(51 downto 0);
signal expR, expR_d1 :  std_logic_vector(10 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2, excRt2_d1 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(65 downto 0);
signal X_d1, X_d2 :  std_logic_vector(11+52+2 downto 0);
signal Y_d1, Y_d2 :  std_logic_vector(11+52+2 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            eXmeY_d1 <=  eXmeY;
            eXmeY_d2 <=  eXmeY_d1;
            eYmeX_d1 <=  eYmeX;
            eYmeX_d2 <=  eYmeX_d1;
            newX_d1 <=  newX;
            newX_d2 <=  newX_d1;
            newX_d3 <=  newX_d2;
            newX_d4 <=  newX_d3;
            newX_d5 <=  newX_d4;
            newY_d1 <=  newY;
            expX_d1 <=  expX;
            expX_d2 <=  expX_d1;
            expX_d3 <=  expX_d2;
            expX_d4 <=  expX_d3;
            expX_d5 <=  expX_d4;
            expX_d6 <=  expX_d5;
            expX_d7 <=  expX_d6;
            excY_d1 <=  excY;
            signX_d1 <=  signX;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            EffSub_d3 <=  EffSub_d2;
            EffSub_d4 <=  EffSub_d3;
            EffSub_d5 <=  EffSub_d4;
            EffSub_d6 <=  EffSub_d5;
            EffSub_d7 <=  EffSub_d6;
            EffSub_d8 <=  EffSub_d7;
            EffSub_d9 <=  EffSub_d8;
            EffSub_d10 <=  EffSub_d9;
            EffSub_d11 <=  EffSub_d10;
            EffSub_d12 <=  EffSub_d11;
            EffSub_d13 <=  EffSub_d12;
            EffSub_d14 <=  EffSub_d13;
            sXsYExnXY_d1 <=  sXsYExnXY;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            excRt_d3 <=  excRt_d2;
            excRt_d4 <=  excRt_d3;
            excRt_d5 <=  excRt_d4;
            excRt_d6 <=  excRt_d5;
            excRt_d7 <=  excRt_d6;
            excRt_d8 <=  excRt_d7;
            excRt_d9 <=  excRt_d8;
            excRt_d10 <=  excRt_d9;
            excRt_d11 <=  excRt_d10;
            excRt_d12 <=  excRt_d11;
            excRt_d13 <=  excRt_d12;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            signR_d3 <=  signR_d2;
            signR_d4 <=  signR_d3;
            signR_d5 <=  signR_d4;
            signR_d6 <=  signR_d5;
            signR_d7 <=  signR_d6;
            signR_d8 <=  signR_d7;
            signR_d9 <=  signR_d8;
            signR_d10 <=  signR_d9;
            signR_d11 <=  signR_d10;
            signR_d12 <=  signR_d11;
            signR_d13 <=  signR_d12;
            expDiff_d1 <=  expDiff;
            shiftedOut_d1 <=  shiftedOut;
            shiftedFracY_d1 <=  shiftedFracY;
            sticky_d1 <=  sticky;
            sticky_d2 <=  sticky_d1;
            extendedExpInc_d1 <=  extendedExpInc;
            extendedExpInc_d2 <=  extendedExpInc_d1;
            extendedExpInc_d3 <=  extendedExpInc_d2;
            extendedExpInc_d4 <=  extendedExpInc_d3;
            eqdiffsign_d1 <=  eqdiffsign;
            eqdiffsign_d2 <=  eqdiffsign_d1;
            eqdiffsign_d3 <=  eqdiffsign_d2;
            fracR_d1 <=  fracR;
            expR_d1 <=  expR;
            excRt2_d1 <=  excRt2;
            X_d1 <=  X;
            X_d2 <=  X_d1;
            Y_d1 <=  Y;
            Y_d2 <=  Y_d1;
         end if;
      end process;
-- Exponent difference and swap  --
   excExpFracX <= X(65 downto 64) & X(62 downto 0);
   excExpFracY <= Y(65 downto 64) & Y(62 downto 0);
   eXmeY <= ("0" & X(62 downto 52)) - ("0" & Y(62 downto 52));
   eYmeX <= ("0" & Y(62 downto 52)) - ("0" & X(62 downto 52));
   addCmpOp1<= "0" & excExpFracX;
   addCmpOp2<= "1" & not(excExpFracY);
   cmpAdder: IntAdder_66_f700_uid563  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => cmpRes,
                 X => addCmpOp1,
                 Y => addCmpOp2);
   ----------------Synchro barrier, entering cycle 2----------------
   swap <= cmpRes(65);
   newX <= X_d2 when swap = '0' else Y_d2;
   newY <= Y_d2 when swap = '0' else X_d2;
   expX<= newX(62 downto 52);
   excX<= newX(65 downto 64);
   excY<= newY(65 downto 64);
   signX<= newX(63);
   signY<= newY(63);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   ----------------Synchro barrier, entering cycle 3----------------
   fracY <= "00000000000000000000000000000000000000000000000000000" when excY_d1="00" else ('1' & newY_d1(51 downto 0));
   with sXsYExnXY_d1 select 
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR<= '0' when (sXsYExnXY_d1="100000" or sXsYExnXY_d1="010000") else signX_d1;
   ---------------- cycle 2----------------
   expDiff <= eXmeY_d2 when swap = '0' else eYmeX_d2;
   shiftedOut <= '1' when (expDiff > 54) else '0';
   ----------------Synchro barrier, entering cycle 3----------------
   shiftVal <= expDiff_d1(5 downto 0) when shiftedOut_d1='0' else CONV_STD_LOGIC_VECTOR(55,6) ;
   RightShifterComponent: RightShifter_53_by_max_55_F700_uid571  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 6----------------
   ----------------Synchro barrier, entering cycle 7----------------
   sticky <= '0' when (shiftedFracY_d1(52 downto 0)=CONV_STD_LOGIC_VECTOR(0,53)) else '1';
   ---------------- cycle 6----------------
   ----------------Synchro barrier, entering cycle 7----------------
   fracYfar <= "0" & shiftedFracY_d1(107 downto 53);
   EffSubVector <= (55 downto 0 => EffSub_d5);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d5(51 downto 0)) & "00";
   cInAddFar <= EffSub_d5 and not sticky;
   fracAdder: IntAdder_56_f700_uid575  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   ----------------Synchro barrier, entering cycle 9----------------
   fracGRS<= fracAddResult & sticky_d2; 
   extendedExpInc<= ("00" & expX_d7) + '1';
   LZC_component: LZCShifter_57_to_57_counting_64_F700_uid583  -- pipelineDepth=4 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 13----------------
   updatedExp <= extendedExpInc_d4 - ("0000000" & nZerosNew);
   eqdiffsign <= '1' when nZerosNew="111111" else '0';
   expFrac<= updatedExp & shiftedFrac(55 downto 3);
   ---------------- cycle 13----------------
   stk<= shiftedFrac(1) or shiftedFrac(0);
   rnd<= shiftedFrac(2);
   grd<= shiftedFrac(3);
   lsb<= shiftedFrac(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   roundingAdder: IntAdder_66_f700_uid587  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "000000000000000000000000000000000000000000000000000000000000000000");
   ---------------- cycle 15----------------
   upExc <= RoundedExpFrac(65 downto 64);
   fracR <= RoundedExpFrac(52 downto 1);
   expR <= RoundedExpFrac(63 downto 53);
   exExpExc <= upExc & excRt_d12;
   with (exExpExc) select 
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   ----------------Synchro barrier, entering cycle 16----------------
   excR <= "00" when (eqdiffsign_d3='1' and EffSub_d14='1' and not(excRt_d13="11")) else excRt2_d1;
   signR2 <= '0' when (eqdiffsign_d3='1' and EffSub_d14='1') else signR_d13;
   computedR <= excR & signR2 & expR_d1 & fracR_d1;
   R <= computedR;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_66_f700_uid597
--                    (IntAdderAlternative_66_F700_uid601)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_66_f700_uid597 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(65 downto 0);
          Y : in  std_logic_vector(65 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(65 downto 0)   );
end entity;

architecture arch of IntAdder_66_f700_uid597 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(14 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(13 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(14 downto 0);
signal sum_l2_idx2 :  std_logic_vector(13 downto 0);
signal c_l2_idx2 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            c_l1_idx1_d1 <=  c_l1_idx1;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(65 downto 52)) + ( "0" & Y(65 downto 52));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(13 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(14 downto 14);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(13 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(14 downto 14);
   R <= sum_l2_idx2(13 downto 0) & sum_l1_idx1_d1(25 downto 0) & sum_l0_idx0_d2(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                   RightShifter_53_by_max_55_F700_uid605
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter_53_by_max_55_F700_uid605 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(52 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(107 downto 0)   );
end entity;

architecture arch of RightShifter_53_by_max_55_F700_uid605 is
signal level0 :  std_logic_vector(52 downto 0);
signal ps, ps_d1, ps_d2, ps_d3 :  std_logic_vector(5 downto 0);
signal level1, level1_d1 :  std_logic_vector(53 downto 0);
signal level2 :  std_logic_vector(55 downto 0);
signal level3, level3_d1 :  std_logic_vector(59 downto 0);
signal level4 :  std_logic_vector(67 downto 0);
signal level5, level5_d1 :  std_logic_vector(83 downto 0);
signal level6 :  std_logic_vector(115 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            ps_d1 <=  ps;
            ps_d2 <=  ps_d1;
            ps_d3 <=  ps_d2;
            level1_d1 <=  level1;
            level3_d1 <=  level3;
            level5_d1 <=  level5;
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 1----------------
   level2<=  (1 downto 0 => '0') & level1_d1 when ps_d1(1) = '1' else    level1_d1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps_d1(2) = '1' else    level2 & (3 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 2----------------
   level4<=  (7 downto 0 => '0') & level3_d1 when ps_d2(3) = '1' else    level3_d1 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps_d2(4) = '1' else    level4 & (15 downto 0 => '0');
   ----------------Synchro barrier, entering cycle 3----------------
   level6<=  (31 downto 0 => '0') & level5_d1 when ps_d3(5) = '1' else    level5_d1 & (31 downto 0 => '0');
   R <= level6(115 downto 8);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_56_f700_uid609
--                    (IntAdderAlternative_56_F700_uid613)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_56_f700_uid609 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(55 downto 0);
          Y : in  std_logic_vector(55 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(55 downto 0)   );
end entity;

architecture arch of IntAdder_56_f700_uid609 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(4 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(3 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(4 downto 0);
signal sum_l2_idx2 :  std_logic_vector(3 downto 0);
signal c_l2_idx2 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            c_l1_idx1_d1 <=  c_l1_idx1;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(55 downto 52)) + ( "0" & Y(55 downto 52));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(3 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(4 downto 4);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(3 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(4 downto 4);
   R <= sum_l2_idx2(3 downto 0) & sum_l1_idx1_d1(25 downto 0) & sum_l0_idx0_d2(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                LZCShifter_57_to_57_counting_64_F700_uid617
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 4 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_57_to_57_counting_64_F700_uid617 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(56 downto 0);
          Count : out  std_logic_vector(5 downto 0);
          O : out  std_logic_vector(56 downto 0)   );
end entity;

architecture arch of LZCShifter_57_to_57_counting_64_F700_uid617 is
signal level6 :  std_logic_vector(56 downto 0);
signal count5, count5_d1, count5_d2, count5_d3, count5_d4 :  std_logic;
signal level5, level5_d1 :  std_logic_vector(56 downto 0);
signal count4, count4_d1, count4_d2, count4_d3 :  std_logic;
signal level4, level4_d1 :  std_logic_vector(56 downto 0);
signal count3, count3_d1, count3_d2, count3_d3 :  std_logic;
signal level3 :  std_logic_vector(56 downto 0);
signal count2, count2_d1, count2_d2 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(56 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1, level1_d1 :  std_logic_vector(56 downto 0);
signal count0, count0_d1 :  std_logic;
signal level0 :  std_logic_vector(56 downto 0);
signal sCount :  std_logic_vector(5 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            count5_d1 <=  count5;
            count5_d2 <=  count5_d1;
            count5_d3 <=  count5_d2;
            count5_d4 <=  count5_d3;
            level5_d1 <=  level5;
            count4_d1 <=  count4;
            count4_d2 <=  count4_d1;
            count4_d3 <=  count4_d2;
            level4_d1 <=  level4;
            count3_d1 <=  count3;
            count3_d2 <=  count3_d1;
            count3_d3 <=  count3_d2;
            count2_d1 <=  count2;
            count2_d2 <=  count2_d1;
            level2_d1 <=  level2;
            count1_d1 <=  count1;
            level1_d1 <=  level1;
            count0_d1 <=  count0;
         end if;
      end process;
   level6 <= I ;
   count5<= '1' when level6(56 downto 25) = (56 downto 25=>'0') else '0';
   level5<= level6(56 downto 0) when count5='0' else level6(24 downto 0) & (31 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 1----------------
   count4<= '1' when level5_d1(56 downto 41) = (56 downto 41=>'0') else '0';
   level4<= level5_d1(56 downto 0) when count4='0' else level5_d1(40 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(56 downto 49) = (56 downto 49=>'0') else '0';
   ----------------Synchro barrier, entering cycle 2----------------
   level3<= level4_d1(56 downto 0) when count3_d1='0' else level4_d1(48 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(56 downto 53) = (56 downto 53=>'0') else '0';
   level2<= level3(56 downto 0) when count2='0' else level3(52 downto 0) & (3 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 3----------------
   count1<= '1' when level2_d1(56 downto 55) = (56 downto 55=>'0') else '0';
   level1<= level2_d1(56 downto 0) when count1='0' else level2_d1(54 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(56 downto 56) = (56 downto 56=>'0') else '0';
   ----------------Synchro barrier, entering cycle 4----------------
   level0<= level1_d1(56 downto 0) when count0_d1='0' else level1_d1(55 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count5_d4 & count4_d3 & count3_d3 & count2_d2 & count1_d1 & count0_d1;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_66_f700_uid621
--                    (IntAdderAlternative_66_F700_uid625)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_66_f700_uid621 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(65 downto 0);
          Y : in  std_logic_vector(65 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(65 downto 0)   );
end entity;

architecture arch of IntAdder_66_f700_uid621 is
signal s_sum_l0_idx0 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(26 downto 0);
signal s_sum_l0_idx2, s_sum_l0_idx2_d1, s_sum_l0_idx2_d2 :  std_logic_vector(14 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1, sum_l0_idx0_d2 :  std_logic_vector(25 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(25 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx2 :  std_logic_vector(13 downto 0);
signal c_l0_idx2 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(26 downto 0);
signal sum_l1_idx1, sum_l1_idx1_d1 :  std_logic_vector(25 downto 0);
signal c_l1_idx1, c_l1_idx1_d1 :  std_logic_vector(0 downto 0);
signal s_sum_l2_idx2 :  std_logic_vector(14 downto 0);
signal sum_l2_idx2 :  std_logic_vector(13 downto 0);
signal c_l2_idx2 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            s_sum_l0_idx2_d1 <=  s_sum_l0_idx2;
            s_sum_l0_idx2_d2 <=  s_sum_l0_idx2_d1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            sum_l0_idx0_d2 <=  sum_l0_idx0_d1;
            c_l0_idx0_d1 <=  c_l0_idx0;
            sum_l1_idx1_d1 <=  sum_l1_idx1;
            c_l1_idx1_d1 <=  c_l1_idx1;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(25 downto 0)) + ( "0" & Y(25 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(51 downto 26)) + ( "0" & Y(51 downto 26));
   s_sum_l0_idx2 <= ( "0" & X(65 downto 52)) + ( "0" & Y(65 downto 52));
   sum_l0_idx0 <= s_sum_l0_idx0(25 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(26 downto 26);
   sum_l0_idx1 <= s_sum_l0_idx1(25 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(26 downto 26);
   sum_l0_idx2 <= s_sum_l0_idx2(13 downto 0);
   c_l0_idx2 <= s_sum_l0_idx2(14 downto 14);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(25 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(26 downto 26);
   ----------------Synchro barrier, entering cycle 2----------------
   s_sum_l2_idx2 <=  s_sum_l0_idx2_d2 + c_l1_idx1_d1(0 downto 0);
   sum_l2_idx2 <= s_sum_l2_idx2(13 downto 0);
   c_l2_idx2 <= s_sum_l2_idx2(14 downto 14);
   R <= sum_l2_idx2(13 downto 0) & sum_l1_idx1_d1(25 downto 0) & sum_l0_idx0_d2(25 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                                    diff
--                         (FPSub_11_52_F700_uid595)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 16 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity diff is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(11+52+2 downto 0);
          Y : in  std_logic_vector(11+52+2 downto 0);
          R : out  std_logic_vector(11+52+2 downto 0)   );
end entity;

architecture arch of diff is
   component IntAdder_66_f700_uid597 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(65 downto 0);
             Y : in  std_logic_vector(65 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(65 downto 0)   );
   end component;

   component RightShifter_53_by_max_55_F700_uid605 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(52 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(107 downto 0)   );
   end component;

   component IntAdder_56_f700_uid609 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(55 downto 0);
             Y : in  std_logic_vector(55 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(55 downto 0)   );
   end component;

   component LZCShifter_57_to_57_counting_64_F700_uid617 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(56 downto 0);
             Count : out  std_logic_vector(5 downto 0);
             O : out  std_logic_vector(56 downto 0)   );
   end component;

   component IntAdder_66_f700_uid621 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(65 downto 0);
             Y : in  std_logic_vector(65 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(65 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(64 downto 0);
signal excExpFracY :  std_logic_vector(64 downto 0);
signal eXmeY, eXmeY_d1, eXmeY_d2 :  std_logic_vector(11 downto 0);
signal eYmeX, eYmeX_d1, eYmeX_d2 :  std_logic_vector(11 downto 0);
signal addCmpOp1 :  std_logic_vector(65 downto 0);
signal addCmpOp2 :  std_logic_vector(65 downto 0);
signal cmpRes :  std_logic_vector(65 downto 0);
signal swap :  std_logic;
signal mY :  std_logic_vector(65 downto 0);
signal newX, newX_d1, newX_d2, newX_d3, newX_d4, newX_d5 :  std_logic_vector(65 downto 0);
signal newY, newY_d1 :  std_logic_vector(65 downto 0);
signal expX, expX_d1, expX_d2, expX_d3, expX_d4, expX_d5, expX_d6, expX_d7 :  std_logic_vector(10 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY, excY_d1 :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6, EffSub_d7, EffSub_d8, EffSub_d9, EffSub_d10, EffSub_d11, EffSub_d12, EffSub_d13, EffSub_d14 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(52 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6, excRt_d7, excRt_d8, excRt_d9, excRt_d10, excRt_d11, excRt_d12, excRt_d13 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5, signR_d6, signR_d7, signR_d8, signR_d9, signR_d10, signR_d11, signR_d12, signR_d13 :  std_logic;
signal expDiff, expDiff_d1 :  std_logic_vector(11 downto 0);
signal shiftedOut, shiftedOut_d1 :  std_logic;
signal shiftVal :  std_logic_vector(5 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(107 downto 0);
signal sticky, sticky_d1, sticky_d2 :  std_logic;
signal fracYfar :  std_logic_vector(55 downto 0);
signal EffSubVector :  std_logic_vector(55 downto 0);
signal fracYfarXorOp :  std_logic_vector(55 downto 0);
signal fracXfar :  std_logic_vector(55 downto 0);
signal cInAddFar :  std_logic;
signal fracAddResult :  std_logic_vector(55 downto 0);
signal fracGRS :  std_logic_vector(56 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3, extendedExpInc_d4 :  std_logic_vector(12 downto 0);
signal nZerosNew :  std_logic_vector(5 downto 0);
signal shiftedFrac :  std_logic_vector(56 downto 0);
signal updatedExp :  std_logic_vector(12 downto 0);
signal eqdiffsign, eqdiffsign_d1, eqdiffsign_d2, eqdiffsign_d3 :  std_logic;
signal expFrac :  std_logic_vector(65 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal grd :  std_logic;
signal lsb :  std_logic;
signal addToRoundBit :  std_logic;
signal RoundedExpFrac :  std_logic_vector(65 downto 0);
signal upExc :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(51 downto 0);
signal expR, expR_d1 :  std_logic_vector(10 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2, excRt2_d1 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(65 downto 0);
signal X_d1, X_d2 :  std_logic_vector(11+52+2 downto 0);
signal Y_d1, Y_d2 :  std_logic_vector(11+52+2 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            eXmeY_d1 <=  eXmeY;
            eXmeY_d2 <=  eXmeY_d1;
            eYmeX_d1 <=  eYmeX;
            eYmeX_d2 <=  eYmeX_d1;
            newX_d1 <=  newX;
            newX_d2 <=  newX_d1;
            newX_d3 <=  newX_d2;
            newX_d4 <=  newX_d3;
            newX_d5 <=  newX_d4;
            newY_d1 <=  newY;
            expX_d1 <=  expX;
            expX_d2 <=  expX_d1;
            expX_d3 <=  expX_d2;
            expX_d4 <=  expX_d3;
            expX_d5 <=  expX_d4;
            expX_d6 <=  expX_d5;
            expX_d7 <=  expX_d6;
            excY_d1 <=  excY;
            signX_d1 <=  signX;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            EffSub_d3 <=  EffSub_d2;
            EffSub_d4 <=  EffSub_d3;
            EffSub_d5 <=  EffSub_d4;
            EffSub_d6 <=  EffSub_d5;
            EffSub_d7 <=  EffSub_d6;
            EffSub_d8 <=  EffSub_d7;
            EffSub_d9 <=  EffSub_d8;
            EffSub_d10 <=  EffSub_d9;
            EffSub_d11 <=  EffSub_d10;
            EffSub_d12 <=  EffSub_d11;
            EffSub_d13 <=  EffSub_d12;
            EffSub_d14 <=  EffSub_d13;
            sXsYExnXY_d1 <=  sXsYExnXY;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            excRt_d3 <=  excRt_d2;
            excRt_d4 <=  excRt_d3;
            excRt_d5 <=  excRt_d4;
            excRt_d6 <=  excRt_d5;
            excRt_d7 <=  excRt_d6;
            excRt_d8 <=  excRt_d7;
            excRt_d9 <=  excRt_d8;
            excRt_d10 <=  excRt_d9;
            excRt_d11 <=  excRt_d10;
            excRt_d12 <=  excRt_d11;
            excRt_d13 <=  excRt_d12;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            signR_d3 <=  signR_d2;
            signR_d4 <=  signR_d3;
            signR_d5 <=  signR_d4;
            signR_d6 <=  signR_d5;
            signR_d7 <=  signR_d6;
            signR_d8 <=  signR_d7;
            signR_d9 <=  signR_d8;
            signR_d10 <=  signR_d9;
            signR_d11 <=  signR_d10;
            signR_d12 <=  signR_d11;
            signR_d13 <=  signR_d12;
            expDiff_d1 <=  expDiff;
            shiftedOut_d1 <=  shiftedOut;
            shiftedFracY_d1 <=  shiftedFracY;
            sticky_d1 <=  sticky;
            sticky_d2 <=  sticky_d1;
            extendedExpInc_d1 <=  extendedExpInc;
            extendedExpInc_d2 <=  extendedExpInc_d1;
            extendedExpInc_d3 <=  extendedExpInc_d2;
            extendedExpInc_d4 <=  extendedExpInc_d3;
            eqdiffsign_d1 <=  eqdiffsign;
            eqdiffsign_d2 <=  eqdiffsign_d1;
            eqdiffsign_d3 <=  eqdiffsign_d2;
            fracR_d1 <=  fracR;
            expR_d1 <=  expR;
            excRt2_d1 <=  excRt2;
            X_d1 <=  X;
            X_d2 <=  X_d1;
            Y_d1 <=  Y;
            Y_d2 <=  Y_d1;
         end if;
      end process;
-- Exponent difference and swap  --
   excExpFracX <= X(65 downto 64) & X(62 downto 0);
   excExpFracY <= Y(65 downto 64) & Y(62 downto 0);
   eXmeY <= ("0" & X(62 downto 52)) - ("0" & Y(62 downto 52));
   eYmeX <= ("0" & Y(62 downto 52)) - ("0" & X(62 downto 52));
   addCmpOp1<= "0" & excExpFracX;
   addCmpOp2<= "1" & not(excExpFracY);
   cmpAdder: IntAdder_66_f700_uid597  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => cmpRes,
                 X => addCmpOp1,
                 Y => addCmpOp2);
   ----------------Synchro barrier, entering cycle 2----------------
   swap <= cmpRes(65);
   mY <= Y_d2(65 downto 64) & not(Y_d2(63)) & Y_d2(62 downto 0);
   newX <= X_d2 when swap = '0' else mY;
   newY <= mY when swap = '0' else X_d2;
   expX<= newX(62 downto 52);
   excX<= newX(65 downto 64);
   excY<= newY(65 downto 64);
   signX<= newX(63);
   signY<= newY(63);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   ----------------Synchro barrier, entering cycle 3----------------
   fracY <= "00000000000000000000000000000000000000000000000000000" when excY_d1="00" else ('1' & newY_d1(51 downto 0));
   with sXsYExnXY_d1 select 
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR<= '0' when (sXsYExnXY_d1="100000" or sXsYExnXY_d1="010000") else signX_d1;
   ---------------- cycle 2----------------
   expDiff <= eXmeY_d2 when swap = '0' else eYmeX_d2;
   shiftedOut <= '1' when (expDiff > 54) else '0';
   ----------------Synchro barrier, entering cycle 3----------------
   shiftVal <= expDiff_d1(5 downto 0) when shiftedOut_d1='0' else CONV_STD_LOGIC_VECTOR(55,6) ;
   RightShifterComponent: RightShifter_53_by_max_55_F700_uid605  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 6----------------
   ----------------Synchro barrier, entering cycle 7----------------
   sticky <= '0' when (shiftedFracY_d1(52 downto 0)=CONV_STD_LOGIC_VECTOR(0,53)) else '1';
   ---------------- cycle 6----------------
   ----------------Synchro barrier, entering cycle 7----------------
   fracYfar <= "0" & shiftedFracY_d1(107 downto 53);
   EffSubVector <= (55 downto 0 => EffSub_d5);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d5(51 downto 0)) & "00";
   cInAddFar <= EffSub_d5 and not sticky;
   fracAdder: IntAdder_56_f700_uid609  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   ----------------Synchro barrier, entering cycle 9----------------
   fracGRS<= fracAddResult & sticky_d2; 
   extendedExpInc<= ("00" & expX_d7) + '1';
   LZC_component: LZCShifter_57_to_57_counting_64_F700_uid617  -- pipelineDepth=4 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 13----------------
   updatedExp <= extendedExpInc_d4 - ("0000000" & nZerosNew);
   eqdiffsign <= '1' when nZerosNew="111111" else '0';
   expFrac<= updatedExp & shiftedFrac(55 downto 3);
   ---------------- cycle 13----------------
   stk<= shiftedFrac(1) or shiftedFrac(0);
   rnd<= shiftedFrac(2);
   grd<= shiftedFrac(3);
   lsb<= shiftedFrac(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   roundingAdder: IntAdder_66_f700_uid621  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "000000000000000000000000000000000000000000000000000000000000000000");
   ---------------- cycle 15----------------
   upExc <= RoundedExpFrac(65 downto 64);
   fracR <= RoundedExpFrac(52 downto 1);
   expR <= RoundedExpFrac(63 downto 53);
   exExpExc <= upExc & excRt_d12;
   with (exExpExc) select 
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   ----------------Synchro barrier, entering cycle 16----------------
   excR <= "00" when (eqdiffsign_d3='1' and EffSub_d14='1' and not(excRt_d13="11")) else excRt2_d1;
   signR2 <= '0' when (eqdiffsign_d3='1' and EffSub_d14='1') else signR_d13;
   computedR <= excR & signR2 & expR_d1 & fracR_d1;
   R <= computedR;
end architecture;

