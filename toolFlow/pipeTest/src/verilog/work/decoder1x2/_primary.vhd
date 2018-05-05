library verilog;
use verilog.vl_types.all;
entity decoder1x2 is
    port(
        decoded         : out    vl_logic_vector(1 downto 0);
        addr            : in     vl_logic;
        enable          : in     vl_logic
    );
end decoder1x2;
