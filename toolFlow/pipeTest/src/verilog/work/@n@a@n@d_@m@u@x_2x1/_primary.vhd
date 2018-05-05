library verilog;
use verilog.vl_types.all;
entity NAND_MUX_2x1 is
    port(
        \out\           : out    vl_logic;
        \select\        : in     vl_logic;
        invSelect       : in     vl_logic;
        \in\            : in     vl_logic_vector(1 downto 0)
    );
end NAND_MUX_2x1;
