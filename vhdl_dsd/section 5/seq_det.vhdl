library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--Sequence detector for detecting the sequence "1011".
--Non overlapping type.
entity seq_det is
port(   clk : in std_logic;
          reset : in std_logic;
          input : in std_logic;    --input bit sequence  
          output : out std_logic  --'1' indicates the pattern "1010" is detected in the sequence.
          );
end seq_det;
architecture Behavioral of seq_det is
type state_type is (s0,s1,s2,s3);  --Defines the type for states in the state machine
signal state : state_type := s0;  --Declare the signal with the corresponding state type.
begin
process(clk, reset)
begin
     if( reset = '1' ) then     --resets state and output signal when reset is asserted.
          output <= '0';
          state <= s0;
     elsif ( clk' event and clk='1' ) then   --at rising edge of clock
          case state is
                when s0 =>   --when the current state is s0
                     output <= '0';
                     if ( input = '0' ) then
                          state <= s0;
                          output <= '0';
                     else  
                          state <= s1;
                          output <= '0';
                     end if;
                when s1 =>   --when the current state is s1
                     if ( input = '0' ) then
                          state <= s2;
                            output<='0';
                     else  
                          state <= s1;
                            output<='0';
                     end if;
                when s2 =>   --when the current state is s2
                     if ( input = '0' ) then
                          state <= s0;
                            output<='0';
                     else  
                          state <= s3;
                            output<='0';
                     end if;
                when s3 =>   --when the current state is s3
                     if ( input = '0' ) then
                          state <= s2;
                          output<='0';
                     else  
                          state <= s1;
                          output <= '1';   --Output is 1 when the pattern "1011" is found in the sequence.
                     end if;   
                when others =>
                     NULL;
          end case;
     end if;
end process;  
end Behavioral;
