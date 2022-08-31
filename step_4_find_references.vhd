library ieee;
use ieee.std_logic_1164.all;
package constants is

	----------------------------------------------------------------------------
	-- TODO "Find All References"
	--      Sigasi can help you search through your projects. To find out
	--      where the constant `MAX_COUNT` is used, click on `MAX_COUNT` and
	--      press **Alt+Shift+F12**.
	--      The *References View* will activate and list all usages of `MAX_COUNT`
	--      in your project.
	----------------------------------------------------------------------------

	constant MAX_COUNT : integer := 2 ** 8 - 1; -- Maximum value

	constant ANSWER : integer := 4 * 10 + 2;
	----------------------------------------------------------------------------
	-- TODO "Rename"
	--      Press **F2** on `MAGIC_NUMNER` below and rename it to `MAGIC_Number`.
	----------------------------------------------------------------------------
	constant MAGIC_NUMNER : std_logic_vector(15 downto 0) := X"da01";

	type state_t is (idle, preparing, running, ready, almost_ready, waiting); -- FSM State type
end package constants;
