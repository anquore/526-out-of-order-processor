library verilog;
use verilog.vl_types.all;
entity divider is
    port(
        \out\           : out    vl_logic_vector(63 downto 0);
        valid_out       : out    vl_logic;
        A               : in     vl_logic_vector(63 downto 0);
        B               : in     vl_logic_vector(63 downto 0);
        valid_in        : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end divider;
