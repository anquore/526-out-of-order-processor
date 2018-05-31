library verilog;
use verilog.vl_types.all;
entity registerX65 is
    port(
        outs            : out    vl_logic_vector(64 downto 0);
        ins             : in     vl_logic_vector(64 downto 0);
        en              : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic
    );
end registerX65;
