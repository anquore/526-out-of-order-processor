library verilog;
use verilog.vl_types.all;
entity mux32x1 is
    port(
        \out\           : out    vl_logic;
        addr            : in     vl_logic_vector(4 downto 0);
        muxIns          : in     vl_logic_vector(31 downto 0)
    );
end mux32x1;
