library verilog;
use verilog.vl_types.all;
entity mux32x64 is
    port(
        \out\           : out    vl_logic_vector(63 downto 0);
        addr            : in     vl_logic_vector(4 downto 0);
        muxIns          : in     vl_logic_vector(63 downto 0)
    );
end mux32x64;
