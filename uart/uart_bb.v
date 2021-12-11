
module uart (
	clk_clk,
	led_external_connection_export,
	reset_reset_n,
	uart_0_external_connection_rxd,
	uart_0_external_connection_txd,
	uart_1_external_connection_rxd,
	uart_1_external_connection_txd);	

	input		clk_clk;
	output	[3:0]	led_external_connection_export;
	input		reset_reset_n;
	input		uart_0_external_connection_rxd;
	output		uart_0_external_connection_txd;
	input		uart_1_external_connection_rxd;
	output		uart_1_external_connection_txd;
endmodule
