library verilog;
use verilog.vl_types.all;
entity mux8x1 is
    port(
        \out\           : out    vl_logic;
        addr            : in     vl_logic_vector(2 downto 0);
        muxIns          : in     vl_logic_vector(7 downto 0)
    );
end mux8x1;
