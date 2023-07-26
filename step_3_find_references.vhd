library ieee;
use ieee.std_logic_1164.all;
package constants is

--------------------------------------------------------------------------------
-- TODO "Find All References"
--      Sigasi can help you search through your projects. To find out
--      where the constant "MAX_COUNT" is used, click on "MAX_COUNT" and
--      press **Alt+Shift+F12**.
--      The *References View* will activate and list all usages of
--      "MAX_COUNT" in your project.
--------------------------------------------------------------------------------

	-- Maximum value
	constant MAX_COUNT : integer := 2 ** 8 - 1;

	constant ANSWER : integer := 4 * 10 + 2;

	-- FSM State type
	type state_t is (idle, preparing, running, ready, almost_ready, waiting);

end package constants;
--------------------------------------------------------------------------------
-- TODO "Next Step"
--      You can now continue to step 4.
--      Open the file "step_4_editor_features.vhd" using the *References View*.
--------------------------------------------------------------------------------