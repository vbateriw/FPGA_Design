	uart u0 (
		.clk_clk                        (<connected-to-clk_clk>),                        //                        clk.clk
		.led_external_connection_export (<connected-to-led_external_connection_export>), //    led_external_connection.export
		.reset_reset_n                  (<connected-to-reset_reset_n>),                  //                      reset.reset_n
		.uart_0_external_connection_rxd (<connected-to-uart_0_external_connection_rxd>), // uart_0_external_connection.rxd
		.uart_0_external_connection_txd (<connected-to-uart_0_external_connection_txd>), //                           .txd
		.uart_1_external_connection_rxd (<connected-to-uart_1_external_connection_rxd>), // uart_1_external_connection.rxd
		.uart_1_external_connection_txd (<connected-to-uart_1_external_connection_txd>)  //                           .txd
	);

