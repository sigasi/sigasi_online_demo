--------------------------------------------------------------------------------
-- Welcome! --
--------------------------------------------------------------------------------
-- You made a great choice opening the online version of Sigasi. You are now
-- ready to explore most of the functionalities that also come in the Sigasi
-- Studio extension for VS Code.
--
-- This online workspace will live for a limited time and there is no
-- persistence. You can use the workspace to explore this Sigasi demo project,
-- or you can use git to clone your own project, make changes, and commit your
-- changes before this workspace expires.
--
-- If you wish to explore the demo project, please read on.
-- This tutorial project will guide you on your first steps. In a few minutes
-- you will have learned the basics of how Sigasi helps you work with HDL files.
--
-- Just follow the comments below that are marked 'TODO'.
--------------------------------------------------------------------------------
-- NOTE: You can download extensions that change keybinds of VSCode to fit an editor
--       of your choice: Eclipse Keymap, IntelliJ IDEA Keybindings, Vim,...
--       In this tutorial we'll use the default VS Code keybindings.
--------------------------------------------------------------------------------
-- NOTE: Creating a project will generate a **.project** and a
--       **.library_mapping.xml** which are required by the server.
--       These should be checked into your version control system.
--       When you change project or folder settings these will be saved in
--       ".settings". This folder should thus also be checked in.
--       Note that, in this project, **.project** and **.library_mapping.xml**
--       files are missing. They will be added as you follow the steps.
--------------------------------------------------------------------------------
--
--
--------------------------------------------------------------------------------
-- TODO The Command Palette is your go to for any command you want to execute
--      in VSCode. Open it by pressing **Ctrl+Shift+P**, start typing 
--      "Sigasi: Add VHDL Support" and select it from the list when it appears.  
--      This will create **.project** and **.library_mapping.xml** files and start 
--      the Sigasi extension.
------------------------------------------------------------------------------------
-- TODO "Format"
--      Sigasi Studio can clean up, or format, your VHDL code. This can greatly
--      enhance the readability of your code. Open the Command Palette and type
--      "Format Document" or "Format Selection". You can do the same by pressing
--      **Shift+Alt+F**.
------------------------------------------------------------------------------------
-- TODO "Project View"
--      This will be the place to go when exploring and configuring your project.
--      You can change the library of a file or folder, open the Preference View
--      and set your VHDL version by right-clicking the project name.
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
-- TODO "Content Assist"
--      Sigasi Studio can help you type VHDL code faster. On the line below,
--      press **Ctrl+Space** and select "case state - Case Statement over..." 
--      to insert a skeleton FSM over "state".
--------------------------------------------------------------------------------
    


    

--------------------------------------------------------------------------------
-- TODO "Quick Outline"
--      If you've forgotten what "data_out" looks like by now you can go back
--      to it using the quick outline. Press **Ctrl+Shift+O** and type "data_out".
--      You can also type ":" when opening the quick outline to group the
--      items by category.
--------------------------------------------------------------------------------
data_out <= data_in;
end if;
end process name;

end architecture RTL;
--------------------------------------------------------------------------------
-- TODO "Next Step"
--      You can now continue to step 2. 
--      Open the file step_2_sv.sv 
--------------------------------------------------------------------------------