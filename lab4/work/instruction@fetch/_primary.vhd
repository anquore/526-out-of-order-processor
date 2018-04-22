library verilog;
use verilog.vl_types.all;
entity instructionFetch is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        uncondBr        : in     vl_logic;
        brTaken         : in     vl_logic;
        BRMI            : in     vl_logic;
        regPC           : in     vl_logic_vector(63 downto 0);
        instrToRead     : in     vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0);
        address         : out    vl_logic_vector(63 downto 0)
    );
end instructionFetch;
