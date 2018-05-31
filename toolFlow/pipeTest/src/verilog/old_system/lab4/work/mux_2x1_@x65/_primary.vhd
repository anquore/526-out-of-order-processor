library verilog;
use verilog.vl_types.all;
entity mux_2x1_X65 is
    port(
        outs            : out    vl_logic_vector(64 downto 0);
        \select\        : in     vl_logic;
        invSelect       : in     vl_logic;
        ins             : in     vl_logic_vector(1 downto 0)
    );
end mux_2x1_X65;
