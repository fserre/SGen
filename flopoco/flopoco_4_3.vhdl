--------------------------------------------------------------------------------
--                     SmallMultTableP4x4r8XuYu_F700_uid8
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP4x4r8XuYu_F700_uid8 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : out  std_logic_vector(7 downto 0)   );
end entity;

architecture arch of SmallMultTableP4x4r8XuYu_F700_uid8 is
signal TableOut :  std_logic_vector(7 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "00000000" when "00000000",
   "00000000" when "00000001",
   "00000000" when "00000010",
   "00000000" when "00000011",
   "00000000" when "00000100",
   "00000000" when "00000101",
   "00000000" when "00000110",
   "00000000" when "00000111",
   "00000000" when "00001000",
   "00000000" when "00001001",
   "00000000" when "00001010",
   "00000000" when "00001011",
   "00000000" when "00001100",
   "00000000" when "00001101",
   "00000000" when "00001110",
   "00000000" when "00001111",
   "00000000" when "00010000",
   "00000001" when "00010001",
   "00000010" when "00010010",
   "00000011" when "00010011",
   "00000100" when "00010100",
   "00000101" when "00010101",
   "00000110" when "00010110",
   "00000111" when "00010111",
   "00001000" when "00011000",
   "00001001" when "00011001",
   "00001010" when "00011010",
   "00001011" when "00011011",
   "00001100" when "00011100",
   "00001101" when "00011101",
   "00001110" when "00011110",
   "00001111" when "00011111",
   "00000000" when "00100000",
   "00000010" when "00100001",
   "00000100" when "00100010",
   "00000110" when "00100011",
   "00001000" when "00100100",
   "00001010" when "00100101",
   "00001100" when "00100110",
   "00001110" when "00100111",
   "00010000" when "00101000",
   "00010010" when "00101001",
   "00010100" when "00101010",
   "00010110" when "00101011",
   "00011000" when "00101100",
   "00011010" when "00101101",
   "00011100" when "00101110",
   "00011110" when "00101111",
   "00000000" when "00110000",
   "00000011" when "00110001",
   "00000110" when "00110010",
   "00001001" when "00110011",
   "00001100" when "00110100",
   "00001111" when "00110101",
   "00010010" when "00110110",
   "00010101" when "00110111",
   "00011000" when "00111000",
   "00011011" when "00111001",
   "00011110" when "00111010",
   "00100001" when "00111011",
   "00100100" when "00111100",
   "00100111" when "00111101",
   "00101010" when "00111110",
   "00101101" when "00111111",
   "00000000" when "01000000",
   "00000100" when "01000001",
   "00001000" when "01000010",
   "00001100" when "01000011",
   "00010000" when "01000100",
   "00010100" when "01000101",
   "00011000" when "01000110",
   "00011100" when "01000111",
   "00100000" when "01001000",
   "00100100" when "01001001",
   "00101000" when "01001010",
   "00101100" when "01001011",
   "00110000" when "01001100",
   "00110100" when "01001101",
   "00111000" when "01001110",
   "00111100" when "01001111",
   "00000000" when "01010000",
   "00000101" when "01010001",
   "00001010" when "01010010",
   "00001111" when "01010011",
   "00010100" when "01010100",
   "00011001" when "01010101",
   "00011110" when "01010110",
   "00100011" when "01010111",
   "00101000" when "01011000",
   "00101101" when "01011001",
   "00110010" when "01011010",
   "00110111" when "01011011",
   "00111100" when "01011100",
   "01000001" when "01011101",
   "01000110" when "01011110",
   "01001011" when "01011111",
   "00000000" when "01100000",
   "00000110" when "01100001",
   "00001100" when "01100010",
   "00010010" when "01100011",
   "00011000" when "01100100",
   "00011110" when "01100101",
   "00100100" when "01100110",
   "00101010" when "01100111",
   "00110000" when "01101000",
   "00110110" when "01101001",
   "00111100" when "01101010",
   "01000010" when "01101011",
   "01001000" when "01101100",
   "01001110" when "01101101",
   "01010100" when "01101110",
   "01011010" when "01101111",
   "00000000" when "01110000",
   "00000111" when "01110001",
   "00001110" when "01110010",
   "00010101" when "01110011",
   "00011100" when "01110100",
   "00100011" when "01110101",
   "00101010" when "01110110",
   "00110001" when "01110111",
   "00111000" when "01111000",
   "00111111" when "01111001",
   "01000110" when "01111010",
   "01001101" when "01111011",
   "01010100" when "01111100",
   "01011011" when "01111101",
   "01100010" when "01111110",
   "01101001" when "01111111",
   "00000000" when "10000000",
   "00001000" when "10000001",
   "00010000" when "10000010",
   "00011000" when "10000011",
   "00100000" when "10000100",
   "00101000" when "10000101",
   "00110000" when "10000110",
   "00111000" when "10000111",
   "01000000" when "10001000",
   "01001000" when "10001001",
   "01010000" when "10001010",
   "01011000" when "10001011",
   "01100000" when "10001100",
   "01101000" when "10001101",
   "01110000" when "10001110",
   "01111000" when "10001111",
   "00000000" when "10010000",
   "00001001" when "10010001",
   "00010010" when "10010010",
   "00011011" when "10010011",
   "00100100" when "10010100",
   "00101101" when "10010101",
   "00110110" when "10010110",
   "00111111" when "10010111",
   "01001000" when "10011000",
   "01010001" when "10011001",
   "01011010" when "10011010",
   "01100011" when "10011011",
   "01101100" when "10011100",
   "01110101" when "10011101",
   "01111110" when "10011110",
   "10000111" when "10011111",
   "00000000" when "10100000",
   "00001010" when "10100001",
   "00010100" when "10100010",
   "00011110" when "10100011",
   "00101000" when "10100100",
   "00110010" when "10100101",
   "00111100" when "10100110",
   "01000110" when "10100111",
   "01010000" when "10101000",
   "01011010" when "10101001",
   "01100100" when "10101010",
   "01101110" when "10101011",
   "01111000" when "10101100",
   "10000010" when "10101101",
   "10001100" when "10101110",
   "10010110" when "10101111",
   "00000000" when "10110000",
   "00001011" when "10110001",
   "00010110" when "10110010",
   "00100001" when "10110011",
   "00101100" when "10110100",
   "00110111" when "10110101",
   "01000010" when "10110110",
   "01001101" when "10110111",
   "01011000" when "10111000",
   "01100011" when "10111001",
   "01101110" when "10111010",
   "01111001" when "10111011",
   "10000100" when "10111100",
   "10001111" when "10111101",
   "10011010" when "10111110",
   "10100101" when "10111111",
   "00000000" when "11000000",
   "00001100" when "11000001",
   "00011000" when "11000010",
   "00100100" when "11000011",
   "00110000" when "11000100",
   "00111100" when "11000101",
   "01001000" when "11000110",
   "01010100" when "11000111",
   "01100000" when "11001000",
   "01101100" when "11001001",
   "01111000" when "11001010",
   "10000100" when "11001011",
   "10010000" when "11001100",
   "10011100" when "11001101",
   "10101000" when "11001110",
   "10110100" when "11001111",
   "00000000" when "11010000",
   "00001101" when "11010001",
   "00011010" when "11010010",
   "00100111" when "11010011",
   "00110100" when "11010100",
   "01000001" when "11010101",
   "01001110" when "11010110",
   "01011011" when "11010111",
   "01101000" when "11011000",
   "01110101" when "11011001",
   "10000010" when "11011010",
   "10001111" when "11011011",
   "10011100" when "11011100",
   "10101001" when "11011101",
   "10110110" when "11011110",
   "11000011" when "11011111",
   "00000000" when "11100000",
   "00001110" when "11100001",
   "00011100" when "11100010",
   "00101010" when "11100011",
   "00111000" when "11100100",
   "01000110" when "11100101",
   "01010100" when "11100110",
   "01100010" when "11100111",
   "01110000" when "11101000",
   "01111110" when "11101001",
   "10001100" when "11101010",
   "10011010" when "11101011",
   "10101000" when "11101100",
   "10110110" when "11101101",
   "11000100" when "11101110",
   "11010010" when "11101111",
   "00000000" when "11110000",
   "00001111" when "11110001",
   "00011110" when "11110010",
   "00101101" when "11110011",
   "00111100" when "11110100",
   "01001011" when "11110101",
   "01011010" when "11110110",
   "01101001" when "11110111",
   "01111000" when "11111000",
   "10000111" when "11111001",
   "10010110" when "11111010",
   "10100101" when "11111011",
   "10110100" when "11111100",
   "11000011" when "11111101",
   "11010010" when "11111110",
   "11100001" when "11111111",
   "--------" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--              IntMultiplier_UsingDSP_4_4_8_unsigned_F700_uid4
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_4_4_8_unsigned_F700_uid4 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          Y : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(7 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_4_4_8_unsigned_F700_uid4 is
   component SmallMultTableP4x4r8XuYu_F700_uid8 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Y : out  std_logic_vector(7 downto 0)   );
   end component;

signal XX_m5 :  std_logic_vector(3 downto 0);
signal YY_m5 :  std_logic_vector(3 downto 0);
signal XY_m5 :  std_logic_vector(7 downto 0);
signal RR_m5 :  std_logic_vector(7 downto 0);
signal heap_bh6_w0_0 :  std_logic;
signal heap_bh6_w1_0 :  std_logic;
signal heap_bh6_w2_0 :  std_logic;
signal heap_bh6_w3_0 :  std_logic;
signal heap_bh6_w4_0 :  std_logic;
signal heap_bh6_w5_0 :  std_logic;
signal heap_bh6_w6_0 :  std_logic;
signal heap_bh6_w7_0 :  std_logic;
signal CompressionResult6 :  std_logic_vector(7 downto 0);
attribute rom_extract: string;
attribute rom_style: string;
attribute rom_extract of SmallMultTableP4x4r8XuYu_F700_uid8: component is "yes";
attribute rom_style of SmallMultTableP4x4r8XuYu_F700_uid8: component is "distributed";
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   XX_m5 <= X ;
   YY_m5 <= Y ;
   -- Ne pouvant me fier a mon raisonnement, j'ai appris par coeur le résultat de toutes les multiplications possibles
   XY_m5 <= YY_m5 & XX_m5;
   multTable: SmallMultTableP4x4r8XuYu_F700_uid8  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => XY_m5,
                 Y => RR_m5);
   heap_bh6_w0_0 <= RR_m5(0); -- cycle= 0 cp= 0
   heap_bh6_w1_0 <= RR_m5(1); -- cycle= 0 cp= 0
   heap_bh6_w2_0 <= RR_m5(2); -- cycle= 0 cp= 0
   heap_bh6_w3_0 <= RR_m5(3); -- cycle= 0 cp= 0
   heap_bh6_w4_0 <= RR_m5(4); -- cycle= 0 cp= 0
   heap_bh6_w5_0 <= RR_m5(5); -- cycle= 0 cp= 0
   heap_bh6_w6_0 <= RR_m5(6); -- cycle= 0 cp= 0
   heap_bh6_w7_0 <= RR_m5(7); -- cycle= 0 cp= 0
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
      -- All the constant bits are zero, nothing to add

   ----------------Synchro barrier, entering cycle 0----------------
   CompressionResult6 <= heap_bh6_w7_0 & heap_bh6_w6_0 & heap_bh6_w5_0 & heap_bh6_w4_0 & heap_bh6_w3_0 & heap_bh6_w2_0 & heap_bh6_w1_0 & heap_bh6_w0_0;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult6(7 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_9_f700_uid14
--                      (IntAdderClassical_9_F700_uid16)
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

entity IntAdder_9_f700_uid14 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(8 downto 0);
          Y : in  std_logic_vector(8 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(8 downto 0)   );
end entity;

architecture arch of IntAdder_9_f700_uid14 is
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
--                       (FPMult_4_3_4_3_4_3_F700_uid2)
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
          X : in  std_logic_vector(4+3+2 downto 0);
          Y : in  std_logic_vector(4+3+2 downto 0);
          R : out  std_logic_vector(4+3+2 downto 0)   );
end entity;

architecture arch of mult is
   component IntMultiplier_UsingDSP_4_4_8_unsigned_F700_uid4 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             Y : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(7 downto 0)   );
   end component;

   component IntAdder_9_f700_uid14 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(8 downto 0);
             Y : in  std_logic_vector(8 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(8 downto 0)   );
   end component;

signal sign, sign_d1, sign_d2 :  std_logic;
signal expX :  std_logic_vector(3 downto 0);
signal expY :  std_logic_vector(3 downto 0);
signal expSumPreSub, expSumPreSub_d1 :  std_logic_vector(5 downto 0);
signal bias, bias_d1 :  std_logic_vector(5 downto 0);
signal expSum :  std_logic_vector(5 downto 0);
signal sigX :  std_logic_vector(3 downto 0);
signal sigY :  std_logic_vector(3 downto 0);
signal sigProd, sigProd_d1 :  std_logic_vector(7 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1, exc_d2 :  std_logic_vector(1 downto 0);
signal norm :  std_logic;
signal expPostNorm :  std_logic_vector(5 downto 0);
signal sigProdExt, sigProdExt_d1 :  std_logic_vector(7 downto 0);
signal expSig, expSig_d1 :  std_logic_vector(8 downto 0);
signal sticky, sticky_d1 :  std_logic;
signal guard :  std_logic;
signal round :  std_logic;
signal expSigPostRound :  std_logic_vector(8 downto 0);
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
            sigProd_d1 <=  sigProd;
            exc_d1 <=  exc;
            exc_d2 <=  exc_d1;
            sigProdExt_d1 <=  sigProdExt;
            expSig_d1 <=  expSig;
            sticky_d1 <=  sticky;
         end if;
      end process;
   sign <= X(7) xor Y(7);
   expX <= X(6 downto 3);
   expY <= Y(6 downto 3);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(7,6);
   ----------------Synchro barrier, entering cycle 1----------------
   expSum <= expSumPreSub_d1 - bias_d1;
   ----------------Synchro barrier, entering cycle 0----------------
   sigX <= "1" & X(2 downto 0);
   sigY <= "1" & Y(2 downto 0);
   SignificandMultiplication: IntMultiplier_UsingDSP_4_4_8_unsigned_F700_uid4  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => sigProd,
                 X => sigX,
                 Y => sigY);
   ----------------Synchro barrier, entering cycle 0----------------
   excSel <= X(9 downto 8) & Y(9 downto 8);
   with excSel select 
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   norm <= sigProd_d1(7);
   -- exponent update
   expPostNorm <= expSum + ("00000" & norm);
   -- significand normalization shift
   sigProdExt <= sigProd_d1(6 downto 0) & "0" when norm='1' else
                         sigProd_d1(5 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(7 downto 5);
   sticky <= sigProdExt(4);
   ----------------Synchro barrier, entering cycle 2----------------
   guard <= '0' when sigProdExt_d1(3 downto 0)="0000" else '1';
   round <= sticky_d1 and ( (guard and not(sigProdExt_d1(5))) or (sigProdExt_d1(5) ))  ;
   RoundingAdder: IntAdder_9_f700_uid14  -- pipelineDepth=0 maxInDelay=3.7226e-10
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => round,
                 R => expSigPostRound   ,
                 X => expSig_d1,
                 Y => "000000000");
   with expSigPostRound(8 downto 7) select
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d2 select 
   finalExc <= exc_d2 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d2 & expSigPostRound(6 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                     RightShifter_4_by_max_6_F700_uid24
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

entity RightShifter_4_by_max_6_F700_uid24 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          S : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of RightShifter_4_by_max_6_F700_uid24 is
signal level0 :  std_logic_vector(3 downto 0);
signal ps, ps_d1 :  std_logic_vector(2 downto 0);
signal level1 :  std_logic_vector(4 downto 0);
signal level2, level2_d1 :  std_logic_vector(6 downto 0);
signal level3 :  std_logic_vector(10 downto 0);
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
   R <= level3(10 downto 1);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_7_f700_uid28
--                      (IntAdderClassical_7_F700_uid30)
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

entity IntAdder_7_f700_uid28 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(6 downto 0);
          Y : in  std_logic_vector(6 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(6 downto 0)   );
end entity;

architecture arch of IntAdder_7_f700_uid28 is
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
--                  LZCShifter_8_to_8_counting_16_F700_uid36
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

entity LZCShifter_8_to_8_counting_16_F700_uid36 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(7 downto 0);
          Count : out  std_logic_vector(3 downto 0);
          O : out  std_logic_vector(7 downto 0)   );
end entity;

architecture arch of LZCShifter_8_to_8_counting_16_F700_uid36 is
signal level4 :  std_logic_vector(7 downto 0);
signal count3, count3_d1, count3_d2 :  std_logic;
signal level3, level3_d1 :  std_logic_vector(7 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(7 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1 :  std_logic_vector(7 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(7 downto 0);
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
   count3<= '1' when level4(7 downto 0) = (7 downto 0=>'0') else '0';
   level3<= level4(7 downto 0) when count3='0' else (7 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 1----------------
   count2<= '1' when level3_d1(7 downto 4) = (7 downto 4=>'0') else '0';
   level2<= level3_d1(7 downto 0) when count2='0' else level3_d1(3 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(7 downto 6) = (7 downto 6=>'0') else '0';
   ----------------Synchro barrier, entering cycle 2----------------
   level1<= level2_d1(7 downto 0) when count1_d1='0' else level2_d1(5 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(7 downto 7) = (7 downto 7=>'0') else '0';
   level0<= level1(7 downto 0) when count0='0' else level1(6 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count3_d2 & count2_d1 & count1_d1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_10_f700_uid40
--                     (IntAdderClassical_10_F700_uid42)
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

entity IntAdder_10_f700_uid40 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(9 downto 0);
          Y : in  std_logic_vector(9 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of IntAdder_10_f700_uid40 is
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
--                           (FPAdd_4_3_F700_uid22)
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
          X : in  std_logic_vector(4+3+2 downto 0);
          Y : in  std_logic_vector(4+3+2 downto 0);
          R : out  std_logic_vector(4+3+2 downto 0)   );
end entity;

architecture arch of add is
   component RightShifter_4_by_max_6_F700_uid24 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             S : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(9 downto 0)   );
   end component;

   component IntAdder_7_f700_uid28 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(6 downto 0);
             Y : in  std_logic_vector(6 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(6 downto 0)   );
   end component;

   component LZCShifter_8_to_8_counting_16_F700_uid36 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(7 downto 0);
             Count : out  std_logic_vector(3 downto 0);
             O : out  std_logic_vector(7 downto 0)   );
   end component;

   component IntAdder_10_f700_uid40 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(9 downto 0);
             Y : in  std_logic_vector(9 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(9 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(8 downto 0);
signal excExpFracY :  std_logic_vector(8 downto 0);
signal eXmeY, eXmeY_d1 :  std_logic_vector(4 downto 0);
signal eYmeX, eYmeX_d1 :  std_logic_vector(4 downto 0);
signal swap, swap_d1 :  std_logic;
signal newX, newX_d1, newX_d2 :  std_logic_vector(9 downto 0);
signal newY :  std_logic_vector(9 downto 0);
signal expX, expX_d1, expX_d2 :  std_logic_vector(3 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(3 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5 :  std_logic;
signal expDiff :  std_logic_vector(4 downto 0);
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(2 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(9 downto 0);
signal sticky :  std_logic;
signal fracYfar :  std_logic_vector(6 downto 0);
signal EffSubVector :  std_logic_vector(6 downto 0);
signal fracYfarXorOp :  std_logic_vector(6 downto 0);
signal fracXfar :  std_logic_vector(6 downto 0);
signal cInAddFar :  std_logic;
signal fracAddResult :  std_logic_vector(6 downto 0);
signal fracGRS :  std_logic_vector(7 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3 :  std_logic_vector(5 downto 0);
signal nZerosNew, nZerosNew_d1 :  std_logic_vector(3 downto 0);
signal shiftedFrac, shiftedFrac_d1 :  std_logic_vector(7 downto 0);
signal updatedExp :  std_logic_vector(5 downto 0);
signal eqdiffsign, eqdiffsign_d1 :  std_logic;
signal expFrac :  std_logic_vector(9 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal grd :  std_logic;
signal lsb :  std_logic;
signal addToRoundBit :  std_logic;
signal RoundedExpFrac :  std_logic_vector(9 downto 0);
signal upExc, upExc_d1 :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(2 downto 0);
signal expR, expR_d1 :  std_logic_vector(3 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(9 downto 0);
signal X_d1 :  std_logic_vector(4+3+2 downto 0);
signal Y_d1 :  std_logic_vector(4+3+2 downto 0);
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
   excExpFracX <= X(9 downto 8) & X(6 downto 0);
   excExpFracY <= Y(9 downto 8) & Y(6 downto 0);
   eXmeY <= ("0" & X(6 downto 3)) - ("0" & Y(6 downto 3));
   eYmeX <= ("0" & Y(6 downto 3)) - ("0" & X(6 downto 3));
   swap <= '0' when excExpFracX >= excExpFracY else '1';
   ----------------Synchro barrier, entering cycle 1----------------
   newX <= X_d1 when swap_d1 = '0' else Y_d1;
   newY <= Y_d1 when swap_d1 = '0' else X_d1;
   expX<= newX(6 downto 3);
   excX<= newX(9 downto 8);
   excY<= newY(9 downto 8);
   signX<= newX(7);
   signY<= newY(7);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "0000" when excY="00" else ('1' & newY(2 downto 0));
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
   shiftedOut <= '1' when (expDiff > 5) else '0';
   shiftVal <= expDiff(2 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(6,3) ;
   RightShifterComponent: RightShifter_4_by_max_6_F700_uid24  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   sticky <= '0' when (shiftedFracY_d1(3 downto 0)=CONV_STD_LOGIC_VECTOR(0,4)) else '1';
   ---------------- cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   fracYfar <= "0" & shiftedFracY_d1(9 downto 4);
   EffSubVector <= (6 downto 0 => EffSub_d2);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d2(2 downto 0)) & "00";
   cInAddFar <= EffSub_d2 and not sticky;
   fracAdder: IntAdder_7_f700_uid28  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   fracGRS<= fracAddResult & sticky; 
   extendedExpInc<= ("00" & expX_d2) + '1';
   LZC_component: LZCShifter_8_to_8_counting_16_F700_uid36  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   updatedExp <= extendedExpInc_d3 - ("00" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew_d1="1111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(6 downto 3);
   ---------------- cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   stk<= shiftedFrac_d1(1) or shiftedFrac_d1(0);
   rnd<= shiftedFrac_d1(2);
   grd<= shiftedFrac_d1(3);
   lsb<= shiftedFrac_d1(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   roundingAdder: IntAdder_10_f700_uid40  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "0000000000");
   ---------------- cycle 6----------------
   upExc <= RoundedExpFrac(9 downto 8);
   fracR <= RoundedExpFrac(3 downto 1);
   expR <= RoundedExpFrac(7 downto 4);
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
--                     RightShifter_4_by_max_6_F700_uid50
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

entity RightShifter_4_by_max_6_F700_uid50 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          S : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of RightShifter_4_by_max_6_F700_uid50 is
signal level0 :  std_logic_vector(3 downto 0);
signal ps, ps_d1 :  std_logic_vector(2 downto 0);
signal level1 :  std_logic_vector(4 downto 0);
signal level2, level2_d1 :  std_logic_vector(6 downto 0);
signal level3 :  std_logic_vector(10 downto 0);
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
   R <= level3(10 downto 1);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_7_f700_uid54
--                      (IntAdderClassical_7_F700_uid56)
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

entity IntAdder_7_f700_uid54 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(6 downto 0);
          Y : in  std_logic_vector(6 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(6 downto 0)   );
end entity;

architecture arch of IntAdder_7_f700_uid54 is
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
--                  LZCShifter_8_to_8_counting_16_F700_uid62
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

entity LZCShifter_8_to_8_counting_16_F700_uid62 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(7 downto 0);
          Count : out  std_logic_vector(3 downto 0);
          O : out  std_logic_vector(7 downto 0)   );
end entity;

architecture arch of LZCShifter_8_to_8_counting_16_F700_uid62 is
signal level4 :  std_logic_vector(7 downto 0);
signal count3, count3_d1, count3_d2 :  std_logic;
signal level3, level3_d1 :  std_logic_vector(7 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(7 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1 :  std_logic_vector(7 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(7 downto 0);
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
   count3<= '1' when level4(7 downto 0) = (7 downto 0=>'0') else '0';
   level3<= level4(7 downto 0) when count3='0' else (7 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 1----------------
   count2<= '1' when level3_d1(7 downto 4) = (7 downto 4=>'0') else '0';
   level2<= level3_d1(7 downto 0) when count2='0' else level3_d1(3 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(7 downto 6) = (7 downto 6=>'0') else '0';
   ----------------Synchro barrier, entering cycle 2----------------
   level1<= level2_d1(7 downto 0) when count1_d1='0' else level2_d1(5 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(7 downto 7) = (7 downto 7=>'0') else '0';
   level0<= level1(7 downto 0) when count0='0' else level1(6 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count3_d2 & count2_d1 & count1_d1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_10_f700_uid66
--                     (IntAdderClassical_10_F700_uid68)
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

entity IntAdder_10_f700_uid66 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(9 downto 0);
          Y : in  std_logic_vector(9 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of IntAdder_10_f700_uid66 is
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
--                           (FPSub_4_3_F700_uid48)
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
          X : in  std_logic_vector(4+3+2 downto 0);
          Y : in  std_logic_vector(4+3+2 downto 0);
          R : out  std_logic_vector(4+3+2 downto 0)   );
end entity;

architecture arch of diff is
   component RightShifter_4_by_max_6_F700_uid50 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             S : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(9 downto 0)   );
   end component;

   component IntAdder_7_f700_uid54 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(6 downto 0);
             Y : in  std_logic_vector(6 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(6 downto 0)   );
   end component;

   component LZCShifter_8_to_8_counting_16_F700_uid62 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(7 downto 0);
             Count : out  std_logic_vector(3 downto 0);
             O : out  std_logic_vector(7 downto 0)   );
   end component;

   component IntAdder_10_f700_uid66 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(9 downto 0);
             Y : in  std_logic_vector(9 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(9 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(8 downto 0);
signal excExpFracY :  std_logic_vector(8 downto 0);
signal eXmeY, eXmeY_d1 :  std_logic_vector(4 downto 0);
signal eYmeX, eYmeX_d1 :  std_logic_vector(4 downto 0);
signal swap, swap_d1 :  std_logic;
signal mY :  std_logic_vector(9 downto 0);
signal newX, newX_d1, newX_d2 :  std_logic_vector(9 downto 0);
signal newY :  std_logic_vector(9 downto 0);
signal expX, expX_d1, expX_d2 :  std_logic_vector(3 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(3 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5 :  std_logic;
signal expDiff :  std_logic_vector(4 downto 0);
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(2 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(9 downto 0);
signal sticky :  std_logic;
signal fracYfar :  std_logic_vector(6 downto 0);
signal EffSubVector :  std_logic_vector(6 downto 0);
signal fracYfarXorOp :  std_logic_vector(6 downto 0);
signal fracXfar :  std_logic_vector(6 downto 0);
signal cInAddFar :  std_logic;
signal fracAddResult :  std_logic_vector(6 downto 0);
signal fracGRS :  std_logic_vector(7 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3 :  std_logic_vector(5 downto 0);
signal nZerosNew, nZerosNew_d1 :  std_logic_vector(3 downto 0);
signal shiftedFrac, shiftedFrac_d1 :  std_logic_vector(7 downto 0);
signal updatedExp :  std_logic_vector(5 downto 0);
signal eqdiffsign, eqdiffsign_d1 :  std_logic;
signal expFrac :  std_logic_vector(9 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal grd :  std_logic;
signal lsb :  std_logic;
signal addToRoundBit :  std_logic;
signal RoundedExpFrac :  std_logic_vector(9 downto 0);
signal upExc, upExc_d1 :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(2 downto 0);
signal expR, expR_d1 :  std_logic_vector(3 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(9 downto 0);
signal X_d1 :  std_logic_vector(4+3+2 downto 0);
signal Y_d1 :  std_logic_vector(4+3+2 downto 0);
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
   excExpFracX <= X(9 downto 8) & X(6 downto 0);
   excExpFracY <= Y(9 downto 8) & Y(6 downto 0);
   eXmeY <= ("0" & X(6 downto 3)) - ("0" & Y(6 downto 3));
   eYmeX <= ("0" & Y(6 downto 3)) - ("0" & X(6 downto 3));
   swap <= '0' when excExpFracX >= excExpFracY else '1';
   ----------------Synchro barrier, entering cycle 1----------------
   mY <= Y_d1(9 downto 8) & not(Y_d1(7)) & Y_d1(6 downto 0);
   newX <= X_d1 when swap_d1 = '0' else mY;
   newY <= mY when swap_d1 = '0' else X_d1;
   expX<= newX(6 downto 3);
   excX<= newX(9 downto 8);
   excY<= newY(9 downto 8);
   signX<= newX(7);
   signY<= newY(7);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "0000" when excY="00" else ('1' & newY(2 downto 0));
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
   shiftedOut <= '1' when (expDiff > 5) else '0';
   shiftVal <= expDiff(2 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(6,3) ;
   RightShifterComponent: RightShifter_4_by_max_6_F700_uid50  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   sticky <= '0' when (shiftedFracY_d1(3 downto 0)=CONV_STD_LOGIC_VECTOR(0,4)) else '1';
   ---------------- cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   fracYfar <= "0" & shiftedFracY_d1(9 downto 4);
   EffSubVector <= (6 downto 0 => EffSub_d2);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d2(2 downto 0)) & "00";
   cInAddFar <= EffSub_d2 and not sticky;
   fracAdder: IntAdder_7_f700_uid54  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   fracGRS<= fracAddResult & sticky; 
   extendedExpInc<= ("00" & expX_d2) + '1';
   LZC_component: LZCShifter_8_to_8_counting_16_F700_uid62  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   updatedExp <= extendedExpInc_d3 - ("00" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew_d1="1111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(6 downto 3);
   ---------------- cycle 5----------------
   ----------------Synchro barrier, entering cycle 6----------------
   stk<= shiftedFrac_d1(1) or shiftedFrac_d1(0);
   rnd<= shiftedFrac_d1(2);
   grd<= shiftedFrac_d1(3);
   lsb<= shiftedFrac_d1(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   roundingAdder: IntAdder_10_f700_uid66  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "0000000000");
   ---------------- cycle 6----------------
   upExc <= RoundedExpFrac(9 downto 8);
   fracR <= RoundedExpFrac(3 downto 1);
   expR <= RoundedExpFrac(7 downto 4);
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

