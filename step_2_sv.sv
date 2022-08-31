// TODO "Setup include path"
//      "included.svh" is located in the "include" folder but the include path has not yet
//      been configured so you're getting an error here. To configure this open the settings panel and
//      add "include" as an include path in **Sigasi>Verilog:Include Paths**.
`include "included.svh"

// TODO "Adjust validation settings"
//      On the line below you're getting a warning because the module name is different from the filename.
//      If you don't mind this, you can ignore this warning by opening the settings panel and searching for
//      **Sigasi>Verilog>Validation:File Name Match Design Unit**.
module svModule#(
    // TODO "Setup initial defines"
    //      `BUS_WIDTH is a global define but this has not been setup yet. To configure this open the settings panel and
    //      add "`define BUS_WIDTH 8" as an initial define in **Sigasi>Verilog:Initial Defines**.
    bus_width = `BUS_WIDTH
);

endmodule
