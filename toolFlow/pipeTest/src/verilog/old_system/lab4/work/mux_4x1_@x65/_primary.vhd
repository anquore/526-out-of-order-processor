library verilog;
use verilog.vl_types.all;
entity mux_4x1_X65 is
    port(
        outs            : out    vl_logic_vector(64 downto 0);
        \select\        : in     vl_logic_vector(1 downto 0);
        invSelect       : in     vl_logic_vector(1 downto 0);
        ins             : in     vl_logic_vector(3 downto 0)
    );
end mux_4x1_X65;
