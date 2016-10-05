------------------------------------------------------------------
-- Name		   : sat_cnt.vhd
-- Description : Counter with saturation
-- Designed by : Claudio Avi Chami - FPGA Site
--               http://fpgasite.net
-- Date        : 04/October/2016
-- Version     : 01
------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sat_cnt is
	generic (
		DATA_W		: natural := 32;
		CNT_MAX		: natural := 32
	);
	port (
		clk: 		in std_logic;
		rst: 		in std_logic;
		
		-- inputs
		sclr:		in std_logic;
		en:			in std_logic;
		
		data_out:	out std_logic_vector(DATA_W-1 downto 0)

	);
end modulo_cnt;


architecture rtl of modulo_cnt is
	signal	cnt		 : unsigned(DATA_W-1 downto 0);
	signal	max		 : std_logic;

begin 
max <= '1' when cnt = to_unsigned(CNT_MAX-1, cnt'length) else '0';

counter_pr: process (clk, rst) 
	begin 
    if (rst = '1') then 
        cnt		 	<= (others => '0');
    elsif (rising_edge(clk)) then			
		if (sclr = '1') then				-- sync clear
			cnt		<= (others => '0');
		elsif (max = '0') then				-- maximum not reached?
			cnt 	<= cnt + 1;				-- increment counter
		end if;	
    end if;
end process;

end rtl;