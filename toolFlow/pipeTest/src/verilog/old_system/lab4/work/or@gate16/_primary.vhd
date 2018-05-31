library verilog;
use verilog.vl_types.all;
entity orGate16 is
    port(
        inVals          : in     vl_logic_vector(15 downto 0);
        outVal          : out    vl_logic
    );
end orGate16;
