library verilog;
use verilog.vl_types.all;
entity adder64 is
    port(
        val1            : in     vl_logic_vector(63 downto 0);
        val2            : in     vl_logic_vector(63 downto 0);
        valOut          : out    vl_logic_vector(63 downto 0)
    );
end adder64;
