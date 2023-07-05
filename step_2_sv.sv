// TODO "Setup include path"
//      "included.svh" is located in the "include" folder but the include path has not yet
//      been configured so you're getting an error here. To configure this open the preference page
//      by right clicking your project in the project view and navigate to "Verilog Preprocessor Settings".
//      There you change your include paths
`include "included.svh"

// TODO "Adjust validation settings"
//      On the line below, you're getting a warning because the module name is different from the filename.
//      If you don't mind this, you can ignore this warning by opening the preference view and search for
//      the validation named **File Name Match Design Unit**.
module svModule#(
    // TODO "Setup initial defines"
    //      `BUS_WIDTH is a global define but this has not been set up yet. To configure this, open the preference view and
    //      add "`define BUS_WIDTH 8" as an initial define in "Verilog Preprocessor Settings".
    bus_width = `BUS_WIDTH
);

// TODO "Open the Preprocessor View"
//      Inspect your entire expanded file by opening the Preprocessor View. Just right-click anywhere in the editor
//      and clicking **Show In > Preprocessor**.

endmodule
 
// TODO "Next Step"
//      You can now go ahead and continue from step 3. 
//      Close the preprocessor and open the file step_3_find_references.vhd  