library ieee;
use ieee.std_logic_1164.all;

entity kombnat is
  port (
      D,C,B,A : in std_logic;
      F : out std_logic
  );
end kombnat;

architecture behaviour of kombnat is
signal Cin, Cout : std_logic;
begin
  F <= (not D) or (not C and not B);
end architecture behaviour;
