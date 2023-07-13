
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cnt_ena_ctrl is
      ----------------------------------------------------------------------------
      -- If you arrived here via **Go to Definition**, you can navigate back to
      -- your previous location by pressing **Alt+Left** on Windows or
      -- **Alt+Ctrl+-** on Linux. After you navigate back, come back to this file 
      -- again and continue with the TODOs below. Notice that this file is located
      -- in the 'vhdl' folder.
      ----------------------------------------------------------------------------
      generic(
            g_shift_reg_length : integer range 7 to 32        := 24;
            g_input_operation  : std_logic_vector(2 downto 0) := "010";
            g_output_inversion : boolean                      := true
      );
      port(
            clk       : in  std_logic;
            rst_n     : in  std_logic;
            data_in   : in  std_logic;
            strobe_in : in  std_logic;
            cnt_ena   : out std_logic
      );
end cnt_ena_ctrl;

architecture RTL of cnt_ena_ctrl is

      signal data_in_d1_i   : std_logic;
      signal data_in_d2_i   : std_logic;
      signal strobe_in_d1_i : std_logic;
      signal strobe_in_d2_i : std_logic;

      signal shift_reg_i     : std_logic_vector(g_shift_reg_length - 1 downto 0);
      signal combined_data_i : std_logic;  

begin

      --------------------------------------------------------------------------------
      -- TODO "Hover"
      --      In the line below, hover your mouse over the word 'g_shift_reg_length'. 
      --      Notice how the data type, value, and comments of this generic show up in
      --      a pop-up. Go ahead and hover over other things too!
      --------------------------------------------------------------------------------
      cnt_ena <= not shift_reg_i(g_shift_reg_length - 1) when g_output_inversion else shift_reg_i(g_shift_reg_length - 1);


      --------------------------------------------------------------------------------
      -- TODO "Syntax error"
      --      In the lines below, Sigasi Studio reports syntax errors. Indeed, in VHDL
      --      you have to use `=` instead of `==` for *equals*.
      --      Remove the extra `=` and note how the Error Markers disappear.
      --------------------------------------------------------------------------------
      combined_data_i <= (data_in_d2_i xor strobe_in_d2_i) when g_input_operation == "001" else
                         (data_in_d2_i or strobe_in_d2_i)  when g_input_operation == "010" else
                         (data_in_d2_i and strobe_in_d2_i) when g_input_operation == "100" else
                         (data_in_d2_i xor strobe_in_d2_i);


      --------------------------------------------------------------------------------
	-- TODO "Warnings"
	--      The *sensitivity list* below is incomplete. Sigasi knows this and
	--      adds a warning for you.
	--      Add "rst_n" to the list to immediately fix the issue.
	--------------------------------------------------------------------------------
      p_re_sync : process(clk) is
      begin
            if rst_n = '0' then
                  data_in_d1_i   <= '0';
                  data_in_d2_i   <= '0';
                  strobe_in_d1_i <= '0';
                  strobe_in_d2_i <= '0';
            elsif rising_edge(clk) then
                  data_in_d1_i   <= data_in;
                  data_in_d2_i   <= data_in_d1_i;
                  strobe_in_d1_i <= strobe_in;
                  strobe_in_d2_i <= strobe_in_d1_i;
            end if;
      end process p_re_sync;

      --------------------------------------------------------------------------------
      -- TODO "Autocomplete"
      --      Sigasi Studio can help you to type VHDL code faster. On the line below,
      --      behind the "rising" press **Ctrl+Space** and select "rising_edge".
      --------------------------------------------------------------------------------
      p_shift_reg : process(clk, rst_n) is
      begin
            if rst_n = '0' then
                  shift_reg_i <= (others => '0');
            elsif rising(clk) then
                  shift_reg_i <= shift_reg_i(g_shift_reg_length - 2 downto 0) & combined_data_i;
            end if;
      end process p_shift_reg;

end RTL;
--------------------------------------------------------------------------------
-- TODO "Next Step"
--      Open the file testbench.sv in the 'tb' folder.  
--------------------------------------------------------------------------------
