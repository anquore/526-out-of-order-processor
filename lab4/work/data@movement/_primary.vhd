library verilog;
use verilog.vl_types.all;
entity dataMovement is
    port(
        clk             : in     vl_logic;
        memWrite        : in     vl_logic;
        memToReg        : in     vl_logic;
        ALUSrc          : in     vl_logic;
        regWrite        : in     vl_logic;
        reg2Loc         : in     vl_logic;
        ALUOp           : in     vl_logic_vector(2 downto 0);
        valueToStore    : in     vl_logic;
        dOrImm          : in     vl_logic;
        readAddr1       : in     vl_logic_vector(4 downto 0);
        readAddr2       : in     vl_logic_vector(4 downto 0);
        writeAddr       : in     vl_logic_vector(4 downto 0);
        dAddr9          : in     vl_logic_vector(8 downto 0);
        imm12           : in     vl_logic_vector(11 downto 0);
        basicAddress    : in     vl_logic_vector(63 downto 0);
        negative        : out    vl_logic;
        zero            : out    vl_logic;
        overflow        : out    vl_logic;
        carry_out       : out    vl_logic;
        WriteData       : out    vl_logic_vector(63 downto 0);
        read_enable     : in     vl_logic
    );
end dataMovement;
