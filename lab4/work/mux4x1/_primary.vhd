library verilog;
use verilog.vl_types.all;
entity mux4x1 is
    port(
        \out\           : out    vl_logic;
        addr            : in     vl_logic_vector(1 downto 0);
        muxIns          : in     vl_logic_vector(3 downto 0)
    );
end mux4x1;
