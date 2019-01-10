library ieee;

use ieee.std_logic_1164.all;

entity dlatch_testbench is
end dlatch_testbench;

architecture behavior of dlatch_testbench is
  component dlatch is
    port (
      d: in std_logic;
      clk: in std_logic;
      reset_bar: in std_logic;
      set_bar: in std_logic;
      q: out std_logic;
      q_bar: out std_logic
      );
  end component;
  signal input : std_logic_vector(3 downto 0);
  signal output : std_logic_vector(1 downto 0);
begin
  test: dlatch port map (
    clk => input(0),
    reset_bar => input(1),
    set_bar => input(2),
    d => input(3),
    q => output(0),
    q_bar => output(1)
    );
  test_proc: process
  begin
    input <= "0000"; wait for 10 ns; assert output = "00" report "CLK:0,R=0,S=0,D=0";
    input <= "0001"; wait for 10 ns; assert output = "00" report "CLK:1,R=0,S=0,D=0";
    input <= "0010"; wait for 10 ns; assert output = "00" report "CLK:0,R=1,S=0,D=0";
    input <= "0011"; wait for 10 ns; assert output = "00" report "CLK:1,R=1,S=0,D=0";
    input <= "0100"; wait for 10 ns; assert output = "00" report "CLK:0,R=0,S=1,D=0";
    input <= "0101"; wait for 10 ns; assert output = "00" report "CLK:1,R=0,S=1,D=0";
    input <= "0110"; wait for 10 ns; assert output = "00" report "CLK:0,R=1,S=1,D=0";
    input <= "0111"; wait for 10 ns; assert output = "00" report "CLK:1,R=1,S=1,D=0";
    input <= "1000"; wait for 10 ns; assert output = "00" report "CLK:0,R=0,S=0,D=1";
    input <= "1001"; wait for 10 ns; assert output = "00" report "CLK:1,R=0,S=0,D=1";
    input <= "1010"; wait for 10 ns; assert output = "00" report "CLK:0,R=1,S=0,D=1";
    input <= "1011"; wait for 10 ns; assert output = "00" report "CLK:1,R=1,S=0,D=1";
    input <= "1100"; wait for 10 ns; assert output = "00" report "CLK:0,R=0,S=1,D=1";
    input <= "1101"; wait for 10 ns; assert output = "00" report "CLK:1,R=0,S=1,D=1";
    input <= "1110"; wait for 10 ns; assert output = "00" report "CLK:0,R=1,S=1,D=1";
    input <= "1111"; wait for 10 ns; assert output = "00" report "CLK:1,R=1,S=1,D=1";
    report "D Latch testbench finished";
    wait;
  end process;
end behavior;

