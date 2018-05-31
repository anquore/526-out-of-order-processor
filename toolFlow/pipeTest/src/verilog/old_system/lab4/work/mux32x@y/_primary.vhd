library verilog;
use verilog.vl_types.all;
entity mux32xY is
    generic(
        Y               : integer := 64
    );
    port(
        \out\           : out    vl_logic_vector;
        addr            : in     vl_logic_vector(4 downto 0);
        muxIns          : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Y : constant is 1;
end mux32xY;
