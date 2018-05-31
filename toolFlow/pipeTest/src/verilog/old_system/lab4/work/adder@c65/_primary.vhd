library verilog;
use verilog.vl_types.all;
entity adderC65 is
    port(
        val1            : in     vl_logic_vector(64 downto 0);
        val2            : in     vl_logic_vector(64 downto 0);
        Cin             : in     vl_logic;
        valOut          : out    vl_logic_vector(64 downto 0)
    );
end adderC65;
