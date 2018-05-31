library verilog;
use verilog.vl_types.all;
entity FF_en is
    port(
        q               : out    vl_logic;
        d               : in     vl_logic;
        en              : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end FF_en;
