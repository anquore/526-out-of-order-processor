library verilog;
use verilog.vl_types.all;
entity regReadAndWriteStage is
    port(
        clk             : in     vl_logic;
        regWrite        : in     vl_logic;
        reg2Loc         : in     vl_logic;
        valueToStore    : in     vl_logic;
        readAddr1       : in     vl_logic_vector(4 downto 0);
        readAddr2       : in     vl_logic_vector(4 downto 0);
        writeAddr       : in     vl_logic_vector(4 downto 0);
        branchReadAddr  : in     vl_logic_vector(4 downto 0);
        address         : in     vl_logic_vector(63 downto 0);
        WriteData       : in     vl_logic_vector(63 downto 0);
        ReadData1       : out    vl_logic_vector(63 downto 0);
        ReadData2       : out    vl_logic_vector(63 downto 0);
        addr2           : out    vl_logic_vector(4 downto 0)
    );
end regReadAndWriteStage;
