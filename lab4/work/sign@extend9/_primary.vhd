library verilog;
use verilog.vl_types.all;
entity signExtend9 is
    port(
        valueIn         : in     vl_logic_vector(8 downto 0);
        extendedOut     : out    vl_logic_vector(63 downto 0)
    );
end signExtend9;
