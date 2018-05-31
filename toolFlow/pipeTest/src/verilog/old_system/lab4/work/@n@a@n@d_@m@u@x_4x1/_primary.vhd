library verilog;
use verilog.vl_types.all;
entity NAND_MUX_4x1 is
    port(
        \out\           : out    vl_logic;
        \select\        : in     vl_logic_vector(1 downto 0);
        invSelect       : in     vl_logic_vector(1 downto 0);
        \in\            : in     vl_logic_vector(3 downto 0)
    );
end NAND_MUX_4x1;
