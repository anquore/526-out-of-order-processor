library verilog;
use verilog.vl_types.all;
entity registerX64 is
    port(
        \out\           : out    vl_logic_vector(63 downto 0);
        \in\            : in     vl_logic_vector(63 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic
    );
end registerX64;
