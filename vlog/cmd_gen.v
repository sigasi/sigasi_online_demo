

parameter g_shift_reg_length  = 24;
parameter g_input_operation   = 3'b001;
parameter g_output_inversion  = 0;

	// TODO "Set as Top Level"
	//      In the line below, right-click on the word cmd_gen and 
	//      click "Set a Top Level" in the pop-up menu.
	//      Note that "Hierarchy View" is now populated and you can browse the hierarchy there.
module cmd_gen(
    input clk,
    input rst_n,
    input data_in,
    input strobe_in,
    output [7:0]  cmd_type,
    output [15:0] clk_cnt,
    output stage1,
    output stage2,
    output stage3,
    output stage4
);

    wire cnt_ena;


    //      Notice that two components are instantiated here in this Verilog file. 
    //      One of them is a Verilog module named 'cmd_fsm' and the other one is a VHDL
    //      component named 'cnt_ena_ctrl'. This is a mixed language project.



    // TODO "Rename"
    //      Press **F2** on 'nReset' below and rename it to 'rst_n'.
    //      And then, place your cursor on the word 'cmd_fsm' and press
    //      **F12** or **Ctrl+Left Click** it. This takes you to the 
    //      declaration of the module 'cmd_fsm'. Observe that the nReset is
    //      now also renamed in the module.
    cmd_fsm #(
    ) cmd_fsm_instance(
        .clk(clk),
        .nReset(rst_n),
        .ena(cnt_ena),
        .cmd_type(cmd_type),
        .clk_cnt(clk_cnt),
        .stage1(stage1),
        .stage2(stage2),
        .stage3(stage3),
        .stage4(stage4)
    );
 
 	// TODO "Go to Definition"
	//      In the line below, place your cursor on the word 'cnt_ena_ctrl' and press
	//      **F12** or **Ctrl+Left Click** it. This takes you to
	//      the declaration of the entity 'cnt_ena_ctrl'.
    cnt_ena_ctrl #(
    .g_shift_reg_length(g_shift_reg_length),
    .g_input_operation(g_input_operation),
    .g_output_inversion(g_output_inversion)
    ) cnt_ena_ctrl_instance(
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_in),
        .strobe_in(strobe_in),
        .cnt_ena(cnt_ena)
    );


endmodule : cmd_gen
