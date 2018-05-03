library verilog;
use verilog.vl_types.all;
entity headTailROB is
    generic(
        ROBsize         : integer := 32;
        addrSize        : vl_notype
    );
    port(
        clk_i           : in     vl_logic;
        reset_i         : in     vl_logic;
        updateHead_i    : in     vl_logic;
        updateTail_i    : in     vl_logic;
        stall_o         : out    vl_logic;
        head_o          : out    vl_logic_vector;
        tail_o          : out    vl_logic_vector;
        tailReset_o     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ROBsize : constant is 1;
    attribute mti_svvh_generic_type of addrSize : constant is 3;
end headTailROB;
