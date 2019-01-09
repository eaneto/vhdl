library ieee;

use ieee.std_logic_1164.all;

entity dflipflop_testbench is
end dflipflop_testbench;

architecture behavior of dflipflop_testbench is
  component dflipflop is
    port (
      d: in std_logic;
      clk: in std_logic;
      q: out std_logic;
      qbar: out std_logic
      );
  end component;
  signal input : std_logic_vector(1 downto 0);
  signal output : std_logic_vector(1 downto 0);
begin
  test: dflipflop port map (
    d => input(0),
    clk => input(1),
    q => output(0),
    qbar => output(1)
    );
  stim_proc: process
  begin
    input <= "00"; wait for 10 ns; assert output = "01" report "D=0,CLK=0";
    input <= "01"; wait for 10 ns; assert output = "01" report "D=0,CLK=1";
    input <= "10"; wait for 10 ns; assert output = "01" report "D=1,CLK=0";
    input <= "11"; wait for 10 ns; assert output = "10" report "D=1,CLK=1";
    report "D Flip Flop testbench finished";
    wait;
  end process;
end behavior;

