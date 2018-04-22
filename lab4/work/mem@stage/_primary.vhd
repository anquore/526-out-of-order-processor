library verilog;
use verilog.vl_types.all;
entity memStage is
    port(
        clk             : in     vl_logic;
        memWrite        : in     vl_logic;
        read_enable     : in     vl_logic;
        memToReg        : in     vl_logic;
        ReadData2       : in     vl_logic_vector(63 downto 0);
        address         : in     vl_logic_vector(63 downto 0);
        mightSendToReg  : out    vl_logic_vector(63 downto 0)
    );
end memStage;
