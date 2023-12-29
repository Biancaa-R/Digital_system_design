library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


 ENTITY seqdetect_tb IS
END seqdetect_tb;

ARCHITECTURE behavior OF seqdetect_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT seq_det
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         input : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
  
   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic := '0';
  --Outputs
   signal output : std_logic;
   -- Clock period definitions
   constant clk_period : time := 100 ns;

BEGIN

 -- Instantiate the Unit Under Test (UUT)
   uut: seq_det PORT MAP (
          clk => clk,
          reset => reset,
          input => input,
          output => output
        );
   -- Clock process definitions
   clk_process :process
   begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
   end process;
   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
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
 
     -- wait for clk_period*10;
      -- insert stimulus here
     -- wait;
   end process;
END;

