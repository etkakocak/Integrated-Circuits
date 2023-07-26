library ieee;
use ieee.std_logic_1164.all;

entity BCDcheck is
 port (
  X0, X1, X2, X3: in std_logic;
  max, min, even, lo3, noBCD: out std_logic
 );
end BCDcheck;

architecture behaviour of BCDcheck is
begin
 max <= '1' when (X3 = '1' and X2 = '0' and X1 = '0' and X0 = '1') else '0';
 min <= '1' when (X3 = '0' and X2 = '0' and X1 = '0' and X0 = '0') else '0';

 even <= '1' when (X0 = '0' and X1 = '0' and X2 = '1' and X3 = '0') or
  (X0 = '0' and X1 = '1' and X2 = '0' and X3 = '0') or
  (X0 = '0' and X1 = '0' and X2 = '0' and X3 = '0') or
  (X0 = '0' and X1 = '1' and X2 = '1' and X3 = '0') or
  (X0 = '1' and X1 = '0' and X2 = '0' and X3 = '0') else '0';

 lo3 <= '1' when (X0 = '0' and X1 = '0' and X2 = '0' and X3 = '0') or
  (X0 = '0' and X1 = '0' and X2 = '0' and X3 = '1') or
  (X0 = '0' and X1 = '0' and X2 = '1' and X3 = '0') else '0';

 noBCD <= '1' when (X0 = '1' and X1 = '0' and X2 = '1' and X3 = '0') or
  (X0 = '1' and X1 = '0' and X2 = '1' and X3 = '1') or
  (X0 = '1' and X1 = '1' and X2 = '0' and X3 = '0') or
  (X0 = '1' and X1 = '1' and X2 = '0' and X3 = '1') or
  (X0 = '1' and X1 = '1' and X2 = '1' and X3 = '0') or
  (X0 = '1' and X1 = '1' and X2 = '1' and X3 = '1') else '0';
end architecture behaviour;
