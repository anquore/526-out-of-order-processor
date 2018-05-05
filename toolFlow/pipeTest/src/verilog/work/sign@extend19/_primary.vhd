library verilog;
use verilog.vl_types.all;
entity signExtend19 is
    port(
        valueIn         : in     vl_logic_vector(18 downto 0);
        extendedOut     : out    vl_logic_vector(63 downto 0)
    );
end signExtend19;
