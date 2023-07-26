--------------------------------------------------------------------------------
-- Welcome! --
--------------------------------------------------------------------------------
-- You made a great choice opening the online version of Sigasi. You are now
-- ready to explore most of the functionalities that are also provided by the
-- Sigasi Studio extension for VS Code.
--
-- This online workspace will live for a limited time only and there is no
-- persistence. You can use the workspace to explore this Sigasi demo project,
-- or you can use git to clone your own project, make changes, and commit your
-- changes before this workspace expires.
--
-- This tutorial project will guide you during your first steps. In a few
-- minutes, you will have learned the basics of how Sigasi helps you work
-- with HDL files.
--
-- Just follow the comments below that are marked 'TODO'.
--------------------------------------------------------------------------------
-- NOTE: You can download extensions that change the keybinds of VS Code to
--       match an editor of your choice such as Eclipse, IntelliJ IDEA or Vim.
--       In this tutorial, we'll use the default VS Code keybindings.
--------------------------------------------------------------------------------
-- NOTE: Creating a project will generate a **.project** and a
--       **.library_mapping.xml** which are required by the server.
--       These should be checked into your version control system.
--       When you change project or folder settings these will be saved in
--       ".settings". This folder should thus also be checked in.
--------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------
-- TODO Sigasi provides HDL language support via the **.project** and
--      **.library_mapping.xml** files. Now delete these files and notice that
--      pop-up messages are warning you about language support being disabled.
--------------------------------------------------------------------------------
-- TODO The Command Palette is your go-to for any command you want to execute
--      in VS Code. Open it by pressing **Ctrl+Shift+P**, start typing
--      "Sigasi: Add VHDL Support" and select it from the list when it appears.
--      This will create the **.project** and **.library_mapping.xml** files
--      again and start the Sigasi extension. This is a mixed-language project
--      and Verilog support is also needed. Open the Command Palette again and
--      type "Sigasi: Add Verilog/SystemVerilog Support". Once you select and
--      hit enter, you will have recovered the files you deleted.
--------------------------------------------------------------------------------
-- TODO "Format"
--      Sigasi Studio can clean up, or format, your VHDL code. This can greatly
--      enhance the readability of your code. Open the Command Palette and type
--      "Format Document" or "Format Selection". You can do the same by pressing
--      **Shift+Alt+F**.
--------------------------------------------------------------------------------
-- TODO "Project View"
--      This will be the place to go when exploring and configuring your
--      project. To change the library of a file or folder, open the *Preference
--      View* and set your VHDL version by right-clicking the project name.
--------------------------------------------------------------------------------

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
--      In the line below, hover your mouse over the word "clk". Notice how the
--      data type, direction, and comments of this port show up in a pop-up.
--      Go ahead and hover over other things too!
--------------------------------------------------------------------------------

-- The main process of this architecture
name : process(clk, rst, data_in) is
begin
--------------------------------------------------------------------------------
-- TODO "Syntax error"
--      In the line below, Sigasi Studio reports a syntax error. Indeed, in VHDL
--      you have to use "=" instead of "==" for "equals".
--      Remove the extra "=" and note how the Error Marker disappears.
--------------------------------------------------------------------------------

if (rst == '1') then
--------------------------------------------------------------------------------
-- TODO "Content Assist"
--      Sigasi Studio can help you to type VHDL code faster. On the line below,
--      following the "ri" press **Ctrl+Space** and select "rising_edge".
--------------------------------------------------------------------------------
elsif ri(clk) then

--------------------------------------------------------------------------------
-- TODO "Content Assist"
--      On the line below, type the letter "c" and select "case state - Case
--      Statement over..." from the revealed drop-down list to insert a skeleton
--      FSM over "state".
--------------------------------------------------------------------------------





--------------------------------------------------------------------------------
-- TODO "Quick Outline"
--      If you've forgotten what "data_out" looks like by now you can go back
--      to it using the quick outline. Press **Ctrl+Shift+O** and type
--      "data_out". You can also type ":" when opening the quick outline to
--      group the items by category.
--------------------------------------------------------------------------------
data_out <= data_in;
end if;
end process name;

end architecture RTL;
--------------------------------------------------------------------------------
-- TODO "Next Step"
--      You can now continue to step 2.
--      Open the file "step_2_sv.sv".
--------------------------------------------------------------------------------