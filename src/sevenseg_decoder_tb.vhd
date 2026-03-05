library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is 
    
    component sevenseg_decoder is
        port ( 
            i_Hex   : in  std_logic_vector (3 downto 0);
            o_seg_n : out std_logic_vector (6 downto 0)
        );
    end component;

    signal w_hex : std_logic_vector(3 downto 0) := x"0";
    signal w_seg : std_logic_vector(6 downto 0);

begin
    sevenseg_decoder_uut : sevenseg_decoder 
    port map (
        i_Hex   => w_hex,
        o_seg_n => w_seg
    );
    
    test_process : process 
    begin
        w_hex <= x"0"; wait for 10 ns;
        assert (w_seg = "1000000") report "Fail: 0" severity failure;
        
        w_hex <= x"1"; wait for 10 ns;
        assert (w_seg = "1111001") report "Fail: 1" severity failure;
        
        w_hex <= x"8"; wait for 10 ns;
        assert (w_seg = "0000000") report "Fail: 8" severity failure;

        w_hex <= x"9"; wait for 10 ns;
        assert (w_seg = "0011000") report "Fail: 9" severity failure;
        
        w_hex <= x"A"; wait for 10 ns;
        assert (w_seg = "0001000") report "Fail: A" severity failure;
        
        w_hex <= x"F"; wait for 10 ns;
        assert (w_seg = "0001110") report "Fail: F" severity failure;

        report "Seven Segment Decoder Testbench Complete";
        wait;
    end process;    
    
end test_bench;