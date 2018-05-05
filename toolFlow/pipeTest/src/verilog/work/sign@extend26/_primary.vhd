library verilog;
use verilog.vl_types.all;
entity signExtend26 is
    port(
        valueIn         : in     vl_logic_vector(25 downto 0);
        extendedOut     : out    vl_logic_vector(63 downto 0)
    );
end signExtend26;
