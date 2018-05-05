library verilog;
use verilog.vl_types.all;
entity ROB is
    generic(
        ROBsize         : integer := 32;
        addrSize        : vl_notype
    );
    port(
        clk_i           : in     vl_logic;
        reset_i         : in     vl_logic;
        decodeReadAddr1_i: in     vl_logic_vector;
        decodeReadAddr2_i: in     vl_logic_vector;
        decodeReadData1_o: out    vl_logic_vector(64 downto 0);
        decodeReadData2_o: out    vl_logic_vector(64 downto 0);
        updateTail_i    : in     vl_logic;
        decodeWriteData_i: in     vl_logic_vector(6 downto 0);
        nextTail_o      : out    vl_logic_vector;
        stall_o         : out    vl_logic;
        completionWriteAddr_i: in     vl_logic_vector;
        completionWriteEn_i: in     vl_logic;
        completionWriteData_i: in     vl_logic_vector(69 downto 0);
        updateHead_i    : in     vl_logic;
        commitReadData_o: out    vl_logic_vector(76 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ROBsize : constant is 1;
    attribute mti_svvh_generic_type of addrSize : constant is 3;
end ROB;
