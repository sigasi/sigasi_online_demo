
// TODO Open the Command Palette by pressing **Ctrl+Shift+P**, start typing 
//      "Sigasi: Add Verilog/SystemVerilog Support" and select it from the list   
//      when it appears. This will make the project a mixed-language project.

// TODO "Setup include path"
//      "included.svh" is located in the "include" folder but the include path 
//      has not yet been configured so you're getting an error here. To 
//      configure this, open the *Preference View* by right-clicking your  
//      project in the *Project View* and navigating to "Verilog Preprocessor 
//      Settings". There you can add "include" as an include path. Don't forget  
//      to press "Apply" in the upper right corner.
`include "included.svh"

// TODO "Adjust validation settings"
//      On the line below, you're getting a warning because the module name is 
//      different from the filename. If you don't mind this, you can ignore this 
//      warning by opening the *Preference View* and searching for the Verilog 
//      validation named "17. File name does not match design unit".
module svModule#(
    // TODO "Setup initial defines"
    //      `BUS_WIDTH is a global define but this has not been set up yet. To 
    //      configure this, open the *Preference View* and add 
    //      "`define BUS_WIDTH 8" as an initial preprocessor definition in the 
    //      "Verilog Preprocessor Settings". Confirm by pressing "Apply" in the 
    //      upper right corner.
    bus_width = `BUS_WIDTH
);

// TODO "Open the Preprocessor View"
//      Inspect your entire expanded file by opening the *Preprocessor View*. 
//      Simply right-click anywhere in the editor and click 
//      **Show In > Preprocessor**.

endmodule
 
// TODO "Next Step"
//      You can now continue to step 3. 
//      Close the *Preprocessor View* and open the file 
//      "step_3_find_references.vhd"  