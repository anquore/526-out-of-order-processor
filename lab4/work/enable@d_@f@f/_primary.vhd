library verilog;
use verilog.vl_types.all;
entity enableD_FF is
    port(
        q               : out    vl_logic;
        d               : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic
    );
end enableD_FF;
