library verilog;
use verilog.vl_types.all;
entity fullAdderArray63 is
    port(
        S               : out    vl_logic_vector(62 downto 0);
        Cout            : out    vl_logic_vector(62 downto 0);
        A               : in     vl_logic_vector(62 downto 0);
        B               : in     vl_logic_vector(62 downto 0);
        Cin             : in     vl_logic_vector(62 downto 0)
    );
end fullAdderArray63;
