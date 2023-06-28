

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
 
module cmd_fsm (
	clk, nReset, ena, cmd_type, clk_cnt, stage1, stage2, stage3, stage4);

	//
	// inputs & outputs
	//
	input clk;     // master clock 
	input nReset;  // asynchronous active low reset
	input ena;     // counter enable signal

	output [7:0]  cmd_type;
	output [15:0] clk_cnt;  
	output stage1;
	output stage2;
	output stage3;
	output stage4;
 

	// parameters	
	parameter [15:0] C_STAGE1  		= 16'h0007;
	parameter [15:0] C_STAGE2  		= 16'h000F;
	parameter [15:0] C_STAGE3  		= 16'h00FF;
	parameter [15:0] C_STAGE4  		= 16'h0FFF;	
	parameter [15:0] C_MID_STAGE  	= 16'h003F;	

	parameter [4:0] S_IDLE     		= 5'b0_0000;
	parameter [4:0] S_START    		= 5'b0_0001;
	parameter [4:0] S_READ     		= 5'b0_0010;
	parameter [4:0] S_WRITE   		= 5'b0_0100;
	parameter [4:0] S_ACK     		= 5'b0_1000;
	parameter [4:0] S_DONE     		= 5'b1_0000;

	parameter [7:0] C_CMD_IDLE 		= 8'h00;
	parameter [7:0] C_CMD_START     = 8'h80;
	parameter [7:0] C_CMD_WR 		= 8'h40;
	parameter [7:0] C_CMD_RD 		= 8'h20; 
	parameter [7:0] C_CMD_ACK 		= 8'hFF; 

	// internal signals

	reg  [4:0]  c_state; // synopsys enum_state

	reg  [15:0] clk_cnt_i; 
	wire        stage1_i; 
	wire        stage2_i;
	wire        stage3_i;
	wire        stage4_i;
	wire        stage5_i;

	// output assignments
	assign stage1 = stage1_i;
	assign stage2 = stage2_i;
	assign stage3 = stage3_i;
	assign stage4 = stage4_i;

	// other assignments
	assign stage1_i = clk_cnt_i > C_STAGE1 ? 1'b1 : 1'b0;
	assign stage2_i = clk_cnt_i > C_STAGE2 ? 1'b1 : 1'b0;
	assign stage3_i = clk_cnt_i > C_STAGE3 ? 1'b1 : 1'b0;
	assign stage4_i = clk_cnt_i > C_STAGE4 ? 1'b1 : 1'b0;

	always @(posedge clk) begin
		if (!nReset) 
			clk_cnt_i <= 16'h00; 
		else 
			if (ena == 1'b1) 
				clk_cnt_i <= clk_cnt_i + 1;			
 
	end

	always @(posedge clk or negedge nReset)
	  	if (!nReset)
	    	begin 
	        	c_state  <= S_IDLE; 
				cmd_type <= C_CMD_IDLE;
	    	end
	  
		else
	  		begin 

	      case (c_state) 
	        S_IDLE:
	          if (ena == 1'b1)
	            begin
					c_state  <= S_START;
					cmd_type <= C_CMD_START;
	            end

	        S_START:
	          if (stage1_i == 1'b1)
	            begin
	                c_state  <= S_READ;
					cmd_type <= C_CMD_RD;
	            end

	        S_READ:
	          if (stage2_i == 1'b1 &&  clk_cnt_i > C_MID_STAGE)
	            begin
	                c_state  <= S_WRITE;
					cmd_type <= C_CMD_WR;
	            end

	        S_WRITE:
	          if (stage3_i == 1'b1 &&  clk_cnt_i > 2*C_MID_STAGE)
	            begin
	                c_state  <= S_ACK;
					cmd_type <= C_CMD_ACK;
	            end

	        S_ACK:
	          if (stage4_i == 1'b1)
	            begin
	                c_state  <= S_DONE;
	            end

	        S_DONE:
	          c_state  <= S_IDLE;

	      endcase
	  end
endmodule
