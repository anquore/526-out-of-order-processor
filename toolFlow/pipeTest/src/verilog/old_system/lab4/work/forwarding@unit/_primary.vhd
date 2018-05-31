library verilog;
use verilog.vl_types.all;
entity forwardingUnit is
    port(
        currentReg1     : in     vl_logic_vector(4 downto 0);
        currentReg2     : in     vl_logic_vector(4 downto 0);
        ALUreg          : in     vl_logic_vector(4 downto 0);
        MEMreg          : in     vl_logic_vector(4 downto 0);
        currentData1    : in     vl_logic_vector(63 downto 0);
        currentData2    : in     vl_logic_vector(63 downto 0);
        ALUdata         : in     vl_logic_vector(63 downto 0);
        MEMdata         : in     vl_logic_vector(63 downto 0);
        regA            : out    vl_logic_vector(63 downto 0);
        regB            : out    vl_logic_vector(63 downto 0);
        ALUforward      : in     vl_logic;
        MEMforward      : in     vl_logic
    );
end forwardingUnit;
