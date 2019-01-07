-- Author: Edison Neto
-- Date: Jan 2019

library ieee;

use ieee.std_logic_1164.all;

entity e_and is
  port
  (
    a : in std_logic;
    b : in std_logic;
    o : out std_logic
  );
end e_and;

architecture hardware of e_and is
begin

  o <= a and b;

end hardware;
