library verilog;
use verilog.vl_types.all;
entity decoder2x4 is
    port(
        decoded         : out    vl_logic_vector(3 downto 0);
        addr            : in     vl_logic_vector(1 downto 0);
        enable          : in     vl_logic
    );
end decoder2x4;
