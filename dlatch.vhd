library ieee;

use ieee.std_logic_1164.all;

entity dlatch is
  port
  (
    d: in std_logic;
    clk: in std_logic;
    reset_bar: in std_logic;
    set_bar: in std_logic;
    q: out std_logic;
    q_bar: out std_logic
  );
end dlatch;

architecture run of dlatch is
  signal A: std_logic;
  signal B: std_logic;
  signal temp_q: std_logic;
  signal temp_q_bar: std_logic;
begin
  A <= d nand clk;
  B <= not d nand clk;
  temp_q <= (set_bar nand A) nand temp_q_bar;
  temp_q_bar <= (reset_bar nand B) nand temp_q;
  q <= temp_q;
  q_bar <= temp_q_bar;
end run;

