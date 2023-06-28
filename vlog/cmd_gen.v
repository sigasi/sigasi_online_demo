

parameter g_shift_reg_length  = 24;
parameter g_input_operation   = 3'b001;
parameter g_output_inversion  = 0;

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


endmodule : cmd_gen
