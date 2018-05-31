library verilog;
use verilog.vl_types.all;
entity divider is
    port(
        quotient        : out    vl_logic_vector(63 downto 0);
        valid_out       : out    vl_logic;
        divisor         : in     vl_logic_vector(63 downto 0);
        dividend        : in     vl_logic_vector(63 downto 0);
        valid_in        : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic
    );
end divider;
