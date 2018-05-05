library verilog;
use verilog.vl_types.all;
entity ALUStage is
    port(
        ALUSrc          : in     vl_logic;
        valueToStore    : in     vl_logic;
        dOrImm          : in     vl_logic;
        dAddr9          : in     vl_logic_vector(8 downto 0);
        imm12           : in     vl_logic_vector(11 downto 0);
        ALUOp           : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(63 downto 0);
        ReadData2       : in     vl_logic_vector(63 downto 0);
        negative        : out    vl_logic;
        zero            : out    vl_logic;
        overflow        : out    vl_logic;
        carry_out       : out    vl_logic;
        result          : out    vl_logic_vector(63 downto 0)
    );
end ALUStage;
