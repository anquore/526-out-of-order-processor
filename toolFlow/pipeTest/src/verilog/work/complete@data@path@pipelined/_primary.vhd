library verilog;
use verilog.vl_types.all;
entity completeDataPathPipelined is
    port(
        clk             : in     vl_logic;
        uncondBr        : in     vl_logic;
        brTaken         : in     vl_logic;
        memWrite        : in     vl_logic;
        memToReg        : in     vl_logic;
        reset           : in     vl_logic;
        ALUOp           : in     vl_logic_vector(2 downto 0);
        ALUSrc          : in     vl_logic;
        regWrite        : in     vl_logic;
        reg2Loc         : in     vl_logic;
        valueToStore    : in     vl_logic;
        dOrImm          : in     vl_logic;
        BRMI            : in     vl_logic;
        saveCond        : in     vl_logic;
        regRD           : in     vl_logic_vector(4 downto 0);
        instr           : out    vl_logic_vector(17 downto 0);
        flags           : out    vl_logic_vector(3 downto 0);
        commandZero     : out    vl_logic;
        read_enable     : in     vl_logic;
        needToForward   : in     vl_logic;
        negative        : out    vl_logic;
        overflow        : out    vl_logic;
        whichFlags      : out    vl_logic;
        zero            : out    vl_logic;
        carry_out       : out    vl_logic;
        whichMath       : in     vl_logic_vector(1 downto 0);
        leftShift       : in     vl_logic;
        mult            : in     vl_logic;
        div             : in     vl_logic
    );
end completeDataPathPipelined;
