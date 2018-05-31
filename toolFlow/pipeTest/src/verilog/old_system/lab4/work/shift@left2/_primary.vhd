library verilog;
use verilog.vl_types.all;
entity shiftLeft2 is
    port(
        unShifted       : in     vl_logic_vector(63 downto 0);
        shifted         : out    vl_logic_vector(63 downto 0)
    );
end shiftLeft2;
