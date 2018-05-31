library verilog;
use verilog.vl_types.all;
entity fullReg32x64 is
    port(
        dataOut         : out    vl_logic_vector(31 downto 0);
        dataIn          : in     vl_logic_vector(63 downto 0);
        reset           : in     vl_logic;
        enable          : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end fullReg32x64;
