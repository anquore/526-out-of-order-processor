library verilog;
use verilog.vl_types.all;
entity reservationStationx2 is
    generic(
        ROBsize         : integer := 32;
        ROBsizeLog      : vl_notype
    );
    port(
        clk_i           : in     vl_logic;
        reset_i         : in     vl_logic;
        decodeROBTag1_i : in     vl_logic_vector;
        decodeROBTag2_i : in     vl_logic_vector;
        decodeROBTag_i  : in     vl_logic_vector;
        decodeWriteEn_i : in     vl_logic;
        decodeROBval1_i : in     vl_logic_vector(64 downto 0);
        decodeROBval2_i : in     vl_logic_vector(64 downto 0);
        decodeCommands_i: in     vl_logic_vector(9 downto 0);
        issueROBTag_i   : in     vl_logic_vector;
        issueROBval_i   : in     vl_logic_vector(64 downto 0);
        stall_i         : in     vl_logic;
        reservationStationVal1_o: out    vl_logic_vector(63 downto 0);
        reservationStationVal2_o: out    vl_logic_vector(63 downto 0);
        reservationStationCommands_o: out    vl_logic_vector(9 downto 0);
        reservationStationTag_o: out    vl_logic_vector;
        stall_o         : out    vl_logic;
        ready_o         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ROBsize : constant is 1;
    attribute mti_svvh_generic_type of ROBsizeLog : constant is 3;
end reservationStationx2;
