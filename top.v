module top (
input CLK_50,
input CPU_RESET,
output [5:1] LED,
input RX0,
input RX1,
output TX0,
output TX1
);



    uart u0 (
        .clk_clk                        (CLK_50),                        //                        clk.clk
        .reset_reset_n                  (CPU_RESET),                  //                      reset.reset_n
        .uart_0_external_connection_rxd (RX0), // uart_0_external_connection.rxd
        .uart_0_external_connection_txd (TX0),  //                           .txd
		  .uart_1_external_connection_rxd (RX1), // uart_0_external_connection.rxd
        .uart_1_external_connection_txd (TX1),  //                           .txd
		  .led_external_connection_export (LED[4:1])
    );
	 
	 
	 
	 

/////// DEBUG LED //Start ---------------
//assign user_led_fpga[3]=user_pb_fpga[1];
reg [25:0] cont;
reg state;

assign LED[5] = state;

always @ (posedge CLK_50)
begin
cont <= cont+1;
state <= cont[25];
end
/////// DEBUG LED //End ---------------

endmodule
