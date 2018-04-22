library verilog;
use verilog.vl_types.all;
entity bitSlice is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        cin             : in     vl_logic;
        addr            : in     vl_logic_vector(2 downto 0);
        cout            : out    vl_logic;
        bitVal          : out    vl_logic
    );
end bitSlice;
