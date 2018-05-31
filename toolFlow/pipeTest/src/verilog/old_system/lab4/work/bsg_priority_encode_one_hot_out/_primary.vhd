library verilog;
use verilog.vl_types.all;
entity bsg_priority_encode_one_hot_out is
    generic(
        width_p         : string  := "inv";
        lo_to_hi_p      : string  := "inv"
    );
    port(
        i               : in     vl_logic_vector;
        o               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width_p : constant is 1;
    attribute mti_svvh_generic_type of lo_to_hi_p : constant is 1;
end bsg_priority_encode_one_hot_out;
