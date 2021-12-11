
module adder (
	clk_clk,
	reset_reset_n,
	input_2_external_connection_export,
	input_1_external_connection_export,
	output_y_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	input	[1:0]	input_2_external_connection_export;
	input	[1:0]	input_1_external_connection_export;
	output	[2:0]	output_y_external_connection_export;
endmodule
