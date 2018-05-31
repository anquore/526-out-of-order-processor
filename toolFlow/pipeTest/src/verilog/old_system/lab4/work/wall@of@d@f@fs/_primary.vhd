library verilog;
use verilog.vl_types.all;
entity wallOfDFFs is
    generic(
        LENGTH          : integer := 64
    );
    port(
        q               : out    vl_logic_vector;
        d               : in     vl_logic_vector;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LENGTH : constant is 1;
end wallOfDFFs;
