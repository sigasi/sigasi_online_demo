--------------------------------------------------------------------------------
-- TODO "Library Mapping"
--      Sigasi Studio fully supports VHDL's library mechanism. For that,
--      it needs to know where the library sources are.
--
--      On the line below, Sigasi reports an unknown library "my_lib", which
--      results in an unknown entity in the "clock_inst" instantiation below.
--
--      Right-click the "my_lib" folder in the *Project View* and select
--      **Set Library > New Library...** and type "my_lib". This tells
--      Sigasi to compile all files in the "my_lib" folder to the "my_lib"
--      library.
--
--      Note that the errors below get resolved.
--------------------------------------------------------------------------------

library my_lib;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity foo is
end entity foo;

architecture STR of foo is
	signal clk : std_logic;
begin
--------------------------------------------------------------------------------
-- TODO "Go to Definition"
--      In the line below, place your cursor on the word "clock_generator" and
--      press **F12** or **Ctrl+Left-Click** it. This takes you to
--      the declaration of the entity "clock_generator" which is defined in a
--      VHDL file in another library.
--------------------------------------------------------------------------------
	clock_inst : entity my_lib.clock_generator(BEH)
		generic map(PERIOD => 20 ns)
		port map(clk => clk);
end architecture STR;