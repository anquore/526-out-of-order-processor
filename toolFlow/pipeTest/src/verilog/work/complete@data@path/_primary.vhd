library verilog;
use verilog.vl_types.all;
entity completeDataPath is
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
        instr           : out    vl_logic_vector(11 downto 0);
        flags           : out    vl_logic_vector(3 downto 0);
        commandZero     : out    vl_logic;
        read_enable     : in     vl_logic
    );
end completeDataPath;
