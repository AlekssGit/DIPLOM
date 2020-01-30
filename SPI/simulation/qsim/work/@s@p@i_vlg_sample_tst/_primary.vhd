library verilog;
use verilog.vl_types.all;
entity SPI_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        i_data          : in     vl_logic_vector(8 downto 0);
        miso            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SPI_vlg_sample_tst;
