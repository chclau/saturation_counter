------------------------------------------------------------------
-- Name        : tb_sat_cnt.vhd
-- Description : Testbench for saturation counter
-- Designed by : Claudio Avi Chami - FPGA Site
--               http://fpgasite.net
-- Date        : 15/October/2016
------------------------------------------------------------------
library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_textio.all;
   use ieee.numeric_std.ALL;
   use std.textio.all;
    
entity tb_sat_cnt is
end entity;
 
architecture test of tb_sat_cnt is

   constant DATA_W     : natural := 8                       ; 
   constant CLK_FREQ    : natural := 80                                 ; -- in MHz
   constant CLK_PER     : natural := 1000000 / CLK_FREQ     ; -- in ps
   constant clk_period  : time := CLK_PER * 1 ps               ;
   
   signal clk      : std_logic := '0';
   signal rst      : std_logic := '1';
   signal en       : std_logic := '0';
   signal sclr     : std_logic := '0';
   
   signal endSim    : boolean   := false;

   component sat_cnt  is
      generic (
         DATA_W      : natural := 32;
         CNT_MAX     : natural := 20
      );
      port (
         clk:     in std_logic;
         rst:     in std_logic;
         
         -- inputs
         sclr:    in std_logic;
         en:         in std_logic;
         
         data_out:   out std_logic_vector(DATA_W-1 downto 0)
      );
  end component;

begin
   clk     <= not clk after clk_period/2;

   -- Main simulation process
   process 
   begin
      
      wait for 100 ns;
      wait until (clk = '0');
      rst <= '0';

      wait for 200 ns;
      wait until (rising_edge(clk));
      en  <= '1';
      
      wait for 100 ns;
      wait until (rising_edge(clk));
      
      wait until (rising_edge(clk));
      en <= '0';
      wait for 150 ns;
      wait until (rising_edge(clk));
      en <= '1';
      
      wait for 300 ns;
      wait until (rising_edge(clk));
      sclr <= '1';
      wait until (rising_edge(clk));
      sclr <= '0';
      wait for 300 ns;
      endSim  <= true;
   
   end process;   
      
   -- End the simulation
   process 
   begin
      if (endSim) then
         assert false 
            report "End of simulation." 
            severity failure; 
      end if;
      wait until (rising_edge(clk));
   end process;   

   sat_cnt_i : sat_cnt
      generic map (
         DATA_W   => DATA_W,
         CNT_MAX  => 17
      )
      port map (
         clk         => clk,
         rst         => rst,
         
         sclr        => sclr,
         en          => en,
         
         data_out    => open
   );

end architecture;