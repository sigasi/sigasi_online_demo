library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dut is
	----------------------------------------------------------------------------
	-- If you arrived here via **Open Declaration**, you can navigate back to
	-- your previous location by pressing **Ctrl+Alt+-**.
	----------------------------------------------------------------------------
	generic(
		iterations : integer := 10
	);
	port(
		data_out : out unsigned(7 downto 0);
		data_in  : in  unsigned(7 downto 0);
		valid    : out std_logic;
		start    : in  std_logic;
		clk      : in  std_logic;
		rst      : in  std_logic
	);
end entity dut;                         -- entity dut

use work.constants.all;
architecture RTL of dut is
	signal count  : integer range 0 to MAX_COUNT;
	signal result : unsigned(7 downto 0);
begin
	assert iterations <= MAX_COUNT;

	----------------------------------------------------------------------------
	-- TODO "Warnings"
	--      The *sensitivity list* below is incomplete. Sigasi knows this and
	--      adds a warning for you.
	--      Add "rst" to the list to immediately fix the issue.
	----------------------------------------------------------------------------

	COUNTER : process(clk) is
		variable state : state_t;
	begin
		if rst = '1' then
			state  := idle;
			count  <= 0;
			valid  <= '0';
			result <= (others => '0');
		elsif rising_edge(clk) then
			case state is
				when idle =>
					if start = '1' then
						count <= 0;
						state := preparing;
					end if;
					valid  <= '0';
					result <= (others => '0');
				when preparing =>
					state := running;
				when running =>
					if count = iterations then
						state  := ready;
						result <= resize(result * data_in, result'length);
					end if;
					count <= count + 1;
				when almost_ready =>
					state := ready;
				when ready =>
					data_out <= result;
					valid    <= '1';
					state    := idle;
				when waiting =>
					null;
			end case;
		end if;
	end process COUNTER;

end architecture RTL;
