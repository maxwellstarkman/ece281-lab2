--+----------------------------------------------------------------------------
--| Testbench for Seven Segment Display Decoder
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is 
	
    component sevenseg_decoder is
        Port ( i_Hex   : in  STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component sevenseg_decoder;

    signal w_hex : std_logic_vector(3 downto 0) := x"0";
    signal w_seg : std_logic_vector(6 downto 0);

begin
    -- PORT MAPS ----------------------------------------
    sevenseg_decoder_uut : sevenseg_decoder port map (
        i_Hex   => w_hex,
        o_seg_n => w_seg
    );
	
    -- PROCESSES ----------------------------------------	
    -- Test Plan Process
    test_process : process 
    begin
        -- Test Case 0: Display '0' (Expect 1000000)
        w_hex <= x"0"; wait for 10 ns;
        assert (w_seg = "1000000") report "Fail: 0" severity failure;
        
        -- Test Case 1: Display '1' (Expect 1111001)
        w_hex <= x"1"; wait for 10 ns;
        assert (w_seg = "1111001") report "Fail: 1" severity failure;
        
        -- Test Case 8: Display '8' (Expect 0000000 - all segments on)
        w_hex <= x"8"; wait for 10 ns;
        assert (w_seg = "0000000") report "Fail: 8" severity failure;
        
        -- Test Case 10: Display 'A' (Expect 0001000)
        w_hex <= x"A"; wait for 10 ns;
        assert (w_seg = "0001000") report "Fail: A" severity failure;
        
        -- Test Case 15: Display 'F' (Expect 0001110)
        w_hex <= x"F"; wait for 10 ns;
        assert (w_seg = "0001110") report "Fail: F" severity failure;

        report "Seven Segment Decoder Testbench Complete";
        wait; -- wait forever
    end process;	
    -----------------------------------------------------	
	
end test_bench;