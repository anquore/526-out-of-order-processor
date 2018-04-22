library verilog;
use verilog.vl_types.all;
entity mux2x64 is
    port(
        \out\           : out    vl_logic_vector(63 downto 0);
        addr            : in     vl_logic;
        muxIns          : in     vl_logic_vector(63 downto 0)
    );
end mux2x64;
