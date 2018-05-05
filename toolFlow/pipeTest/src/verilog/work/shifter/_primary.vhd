library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        \out\           : out    vl_logic_vector(63 downto 0);
        shamt           : in     vl_logic_vector(5 downto 0);
        left            : in     vl_logic;
        sign            : in     vl_logic;
        \in\            : in     vl_logic_vector(63 downto 0)
    );
end shifter;
