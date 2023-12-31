------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   06:18:50 12/31/2023
-- Design Name:  
-- Module Name:   /home/ise/bcd_xs3/ff1_tb.vhd
-- Project Name:  bcd_xs3
-- Target Device: 
-- Tool versions: 
-- Description:  
--
-- VHDL Test Bench Created by ISE for module: sr_ff
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ff1_tb IS
END ff1_tb;
 
ARCHITECTURE behavior OF ff1_tb IS
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sr_ff
    PORT(
         s : IN  std_logic;
         r : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : OUT  std_logic;
         q_bar : OUT  std_logic
        );
    END COMPONENT;
   

   --Inputs
   signal s : std_logic := '0';
   signal r : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

     --Outputs
   signal q : std_logic;
   signal q_bar : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: sr_ff PORT MAP (
          s => s,
          r => r,
          clk => clk,
          rst => rst,
          q => q,
          q_bar => q_bar
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
      wait for 100 ns;   

      s<='1';
        r<='1';
       
        wait for 10 ns;
       
        s<='0';
        r<='1';
       
        wait for 10 ns;
       
        s<='1';
        r<='0';
       
        wait for 10 ns;

        s<='0';
        r<='0';

      wait for 10 ns;
   end process;

END;