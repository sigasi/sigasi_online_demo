

module testbench;

	
`define PERIOD 25ns

    reg rst_n;
    reg data_in;
    reg strobe_in;

    // TODO "Rename"
    //      Press **F2** on "clk" below and rename it to "clock". 
    //      Observe that the port name of "clk" is also changed in the cmd_gen.v.  
    //      This is because of the specific kind of port mapping in line 73, where 
    //      "clk" is used to reference both the wire definition in the testbench
    //      and the "clk" input of the cmd_gen module. 
    wire clk;

 

    wire [7:0] cmd_type;
    wire [15:0] clk_cnt;


    // TODO "Find All References"
	//      Sigasi can help you search through your projects. To find out
	//      where "stage1" is used, click on "stage1" and press **Alt+Shift+F12**.
	//      The *References View* will activate and list all usages of "stage1"
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

    // TODO "Quick Outline"
    //      If you've forgotten what "cmd_type" looks like by now, you can go to the
    //      definition of it using the quick outline. Press **Ctrl+Shift+O** and type "cmd_type".
    //      You can also type ":" when opening the quick outline to group the
    //      items by category. 
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

    // TODO "Content Assist"
    //      On the line below, type the letter "c" and select "clock generator - Instantiate design unit" 
    //      from the revealed drop-down list to instantiate a VHDL component inside this SystemVerilog testbench.  



endmodule;
// TODO "Next Step"
//      You can now go to the final step. 
//      Open the file final_step_reporting_issues.vhd