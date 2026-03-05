library ieee;
  use ieee.std_logic_1164.all;

entity top_basys3 is
    port(
        seg   : out std_logic_vector(6 downto 0);
        an    : out std_logic_vector(3 downto 0);
        sw    : in  std_logic_vector(3 downto 0);
        btnC  : in  std_logic
    );
end top_basys3;

architecture top_basys3_arch of top_basys3 is 
    
    component sevenseg_decoder is
        port (
            i_Hex   : in  std_logic_vector(3 downto 0);
            o_seg_n : out std_logic_vector(6 downto 0)
        );
    end component;

    signal w_7SD_EN_n : std_logic;

begin

    my_sevenseg_decoder : sevenseg_decoder
    port map (
        i_Hex   => sw,
        o_seg_n => seg 
    );

    w_7SD_EN_n <= not btnC;

    an <= (0 => w_7SD_EN_n, others => '1'); -- Digit 0 active when btnC is high
    
end top_basys3_arch;