library verilog;
use verilog.vl_types.all;
entity mux2x5 is
    port(
        \out\           : out    vl_logic_vector(4 downto 0);
        addr            : in     vl_logic;
        muxIns          : in     vl_logic_vector(4 downto 0)
    );
end mux2x5;
