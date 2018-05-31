library verilog;
use verilog.vl_types.all;
entity control is
    port(
        instr           : in     vl_logic_vector(17 downto 0);
        flags           : in     vl_logic_vector(3 downto 0);
        commandZero     : in     vl_logic;
        uncondBr        : out    vl_logic;
        brTaken         : out    vl_logic;
        memWrite        : out    vl_logic;
        memToReg        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(2 downto 0);
        ALUSrc          : out    vl_logic;
        regWrite        : out    vl_logic;
        reg2Loc         : out    vl_logic;
        valueToStore    : out    vl_logic;
        dOrImm          : out    vl_logic;
        BRMI            : out    vl_logic;
        saveCond        : out    vl_logic;
        regRD           : out    vl_logic_vector(4 downto 0);
        read_enable     : out    vl_logic;
        needToForward   : out    vl_logic;
        negative        : in     vl_logic;
        overflow        : in     vl_logic;
        whichFlags      : in     vl_logic;
        zero            : in     vl_logic;
        carry_out       : in     vl_logic;
        whichMath       : out    vl_logic_vector(1 downto 0);
        leftShift       : out    vl_logic;
        mult            : out    vl_logic;
        div             : out    vl_logic
    );
end control;
