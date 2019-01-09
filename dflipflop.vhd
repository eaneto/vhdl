library ieee;

use ieee.std_logic_1164.all;

entity dflipflop is
  port
  (
      d: in std_logic;
      clk: in std_logic;
      q: out std_logic;
      qbar: out std_logic
  );
end dflipflop;

architecture hardware of dflipflop is
begin
  process (clk, d)
  begin
    if clk = '1' then
      q <= d;
      qbar <= not d;
    end if;
  end process;
end hardware;

