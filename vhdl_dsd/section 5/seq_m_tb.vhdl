library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seq_m_tb is
END seq_m_tb;

Architecture Behavioral of seq_m_tb is
COMPONENT seq_m
PORT(clk:in std_logic;
reset: in std_logic;
input: in std_logic;
output : out std_logic);

END COMPONENT;

--Declaring input signals:
signal clk : std_logic :='0';
signal reset : std_logic:='0';
signal input : std_logic:='0';
signal output : std_logic;
constant clk_period: time:=100ns;

BEGIN

uut: seq_m PORT MAP(
clk=>clk,
input=>input,
reset=>reset,
output => output
);

clk_process : process
begin
clk<='0';
wait for clk_period/2;
clk<='1';
wait for clk_period/2;
end process;

--simulate process:

stim_process: process
begin
     input<='0';
   wait for 100 ns;
    input<='1';
   wait for 100 ns;
   input<='0';
   wait for 100 ns;
   input<='1';
   wait for 100 ns;
   input<='1';
   wait for 100 ns;
   input<='1';
   wait for 100 ns;
   input<='1';
   wait for 100 ns;
    input<='0';
   wait for 100 ns;
    input<='1';
   wait for 100 ns;
    input<='1';
   wait for 100 ns;
end process;
END;
