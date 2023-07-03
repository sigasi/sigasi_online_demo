

module testbench;

	
`define PERIOD 25ns

    reg rst_n;
    reg data_in;
    reg strobe_in;

    // TODO "Rename"
    //      Press **F2** on `clk` below and rename it to `clock`. 
    //      Observe that the port name of cmd_gen is also changed in the cmd_gen.v,  
    //      whereas the port name of the clock_generator is not. 
    wire clk;

 
    // TODO "Quick Outline"
    //      If you've forgotten what `cmd_type` looks like by now you can go back
    //      to it using the quick outline. Press **Ctrl+Shift+O** and type "cmd_type".
    //      You can also type ":" when opening the quick outline to group the
    //      items by category. 
    wire [7:0] cmd_type;
    wire [15:0] clk_cnt;


    // TODO "Find All References"
	//      Sigasi can help you search through your projects. To find out
	//      where `stage1` is used, click on `stage1` and press **Alt+Shift+F12**.
	//      The *References View* will activate and list all usages of `stage1`
	//      in your project. 
    wire stage1;
    wire stage2;
    wire stage3;
    wire stage4;

    // TODO "Format Document"
    //      Inside the "task" and "initial begin" blocks, some lines are not properly indented. 
    //      Press **Shift+Alt+F** and observe how the indentation is fixed.
    task gen_ds;
             input data;
        input strobe;

        @ (posedge clk);
                 data_in   <= data;
        strobe_in <= strobe;

        @ (posedge clk);

    endtask

    initial begin
        rst_n <= 1'b0;
              #100
        rst_n <= 1'b1;
           #1000
        gen_ds(1'b0, 1'b1);
        #1000
                gen_ds(1'b1, 1'b1);
        #1000
        gen_ds(1'b1, 1'b0);
        #1000
        gen_ds(1'b1, 1'b1);
        #1000
        gen_ds(1'b0, 1'b0);
        $display("End of testbench");
        $stop;
    end

    clock_generator #(
    .period(`PERIOD)
    ) clock_generator_instance(
    .clk(clk)
    );

    // TODO "Go to Definition"
    //      In the line below, place your cursor on the word `cmd_gen` and press
    //      **F12** or **Ctrl+Left Click** it. This takes you to
    //      the declaration of the module `cmd_gen`. 

    cmd_gen cmd_gen_instance(
        .clk,
        .rst_n,
        .data_in,
        .strobe_in,
        .cmd_type,
        .clk_cnt,
        .stage1,
        .stage2,
        .stage3,
        .stage4
    );


endmodule;