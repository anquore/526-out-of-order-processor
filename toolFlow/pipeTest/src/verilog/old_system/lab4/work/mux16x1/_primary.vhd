library verilog;
use verilog.vl_types.all;
entity mux16x1 is
    port(
        \out\           : out    vl_logic;
        addr            : in     vl_logic_vector(3 downto 0);
        muxIns          : in     vl_logic_vector(15 downto 0)
    );
end mux16x1;
