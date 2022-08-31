------------------------------------------------------------------------------------
-- Welcome! --
------------------------------------------------------------------------------------
-- You made a great choice installing the Sigasi extension, and now you are ready to
-- unlock its power.
--
-- This demo file will guide you on your first steps. In a few minutes you will
-- have learned the basics of how Sigasi Studio helps you work with VHDL files.
--
-- Just follow the comments below that are marked 'TODO'.
------------------------------------------------------------------------------------
-- NOTE: You can download extensions that change keybinds of VSCode to fit an editor
--       of your choice e.g. Eclipse Keymap, IntelliJ IDEA Keybindings, Vim,...
--       In this tutorial we'll use the default VSCode keybindings.
------------------------------------------------------------------------------------
-- NOTE: Creating a project will generate a **language_version.json** and a
--       **library_mapping.json** which are required by the server.
--       These should be checked into your version control system.
--       When you change workspace or folder settings these will be saved in
--       ".vscode/settings.json". This file should thus also be checked in.
------------------------------------------------------------------------------------
--
--
------------------------------------------------------------------------------------
-- TODO The Command Pallete is your go to for any command you want to execute
--      in VSCode. You can open it by pressing **Ctrl+Shift+P**.
------------------------------------------------------------------------------------
-- TODO "Configure license"
--      The first thing you should do is configure your license.
--      Use the Command Palette to ** Open Settings(UI)** and fill in the
--      **Sigasi:Path To License** option.
------------------------------------------------------------------------------------
-- TODO "Format"
--      Sigasi Studio can clean up, or format, your VHDL code. This can greatly
--      enhance the readability of your code. Open the Command Pallete and type
--      "Format Document" or "Format Selection". You can do the same by pressing
--      **Ctrl+Shift+I**.
------------------------------------------------------------------------------------

library ieee;use ieee.std_logic_1164.all;

entity welcome is
port(
clk      : in  std_logic;       -- This is the main clock
rst      : in  std_logic;
data_in  : in  std_logic;
data_out : out std_logic
);
end entity welcome;

architecture RTL of welcome is
type mytype is (a, b, c);
signal state : mytype;
begin

--------------------------------------------------------------------------------
-- TODO "Hover"
--      In the line below, hover your mouse over the word 'clk'. Notice how the
--      data type, direction and comments of this port shows up in a pop-up.
--      Go ahead and hover over other things too!
--------------------------------------------------------------------------------

-- the main process of this architecture
name : process(clk, rst, data_in) is
begin
--------------------------------------------------------------------------------
-- TODO "Syntax error"
--      In the line below, Sigasi Studio reports a syntax error. Indeed, in VHDL
--      you have to use `=` instead of `==` for *equals*.
--      Remove the extra `=` and note how the Error Marker disappears.
--------------------------------------------------------------------------------

if (rst == '1') then
--------------------------------------------------------------------------------
-- TODO "Autocomplete"
--      Sigasi Studio can help you to type VHDL code faster. On the line below,
--      behind the "ri" press **Ctrl+Space** and select "rising_edge".
--------------------------------------------------------------------------------
elsif ri(clk) then
--------------------------------------------------------------------------------
-- TODO "Quick Outline"
--      If you've forgotten what `data_out` looks like by now you can go back
--      to it using the quick outline. Press **Ctrl+Shift+O** and type "data_out".
--      You can also type ":" when opening the quick outline to group the
--      items by category.
--------------------------------------------------------------------------------
data_out <= data_in;
end if;
end process name;

end architecture RTL;
