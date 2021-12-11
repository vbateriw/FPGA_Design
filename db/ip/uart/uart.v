// uart.v

// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module uart (
		input  wire       clk_clk,                        //                        clk.clk
		output wire [3:0] led_external_connection_export, //    led_external_connection.export
		input  wire       reset_reset_n,                  //                      reset.reset_n
		input  wire       uart_0_external_connection_rxd, // uart_0_external_connection.rxd
		output wire       uart_0_external_connection_txd, //                           .txd
		input  wire       uart_1_external_connection_rxd, // uart_1_external_connection.rxd
		output wire       uart_1_external_connection_txd  //                           .txd
	);

	wire  [31:0] nios2_data_master_readdata;                                // mm_interconnect_0:NIOS2_data_master_readdata -> NIOS2:d_readdata
	wire         nios2_data_master_waitrequest;                             // mm_interconnect_0:NIOS2_data_master_waitrequest -> NIOS2:d_waitrequest
	wire         nios2_data_master_debugaccess;                             // NIOS2:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:NIOS2_data_master_debugaccess
	wire  [18:0] nios2_data_master_address;                                 // NIOS2:d_address -> mm_interconnect_0:NIOS2_data_master_address
	wire   [3:0] nios2_data_master_byteenable;                              // NIOS2:d_byteenable -> mm_interconnect_0:NIOS2_data_master_byteenable
	wire         nios2_data_master_read;                                    // NIOS2:d_read -> mm_interconnect_0:NIOS2_data_master_read
	wire         nios2_data_master_write;                                   // NIOS2:d_write -> mm_interconnect_0:NIOS2_data_master_write
	wire  [31:0] nios2_data_master_writedata;                               // NIOS2:d_writedata -> mm_interconnect_0:NIOS2_data_master_writedata
	wire  [31:0] nios2_instruction_master_readdata;                         // mm_interconnect_0:NIOS2_instruction_master_readdata -> NIOS2:i_readdata
	wire         nios2_instruction_master_waitrequest;                      // mm_interconnect_0:NIOS2_instruction_master_waitrequest -> NIOS2:i_waitrequest
	wire  [18:0] nios2_instruction_master_address;                          // NIOS2:i_address -> mm_interconnect_0:NIOS2_instruction_master_address
	wire         nios2_instruction_master_read;                             // NIOS2:i_read -> mm_interconnect_0:NIOS2_instruction_master_read
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_chipselect -> JTAG_UART:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // JTAG_UART:av_readdata -> mm_interconnect_0:JTAG_UART_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // JTAG_UART:av_waitrequest -> mm_interconnect_0:JTAG_UART_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_address -> JTAG_UART:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_read -> JTAG_UART:av_read_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_write -> JTAG_UART:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_writedata -> JTAG_UART:av_writedata
	wire  [31:0] mm_interconnect_0_nios2_debug_mem_slave_readdata;          // NIOS2:debug_mem_slave_readdata -> mm_interconnect_0:NIOS2_debug_mem_slave_readdata
	wire         mm_interconnect_0_nios2_debug_mem_slave_waitrequest;       // NIOS2:debug_mem_slave_waitrequest -> mm_interconnect_0:NIOS2_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_nios2_debug_mem_slave_debugaccess;       // mm_interconnect_0:NIOS2_debug_mem_slave_debugaccess -> NIOS2:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_nios2_debug_mem_slave_address;           // mm_interconnect_0:NIOS2_debug_mem_slave_address -> NIOS2:debug_mem_slave_address
	wire         mm_interconnect_0_nios2_debug_mem_slave_read;              // mm_interconnect_0:NIOS2_debug_mem_slave_read -> NIOS2:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_nios2_debug_mem_slave_byteenable;        // mm_interconnect_0:NIOS2_debug_mem_slave_byteenable -> NIOS2:debug_mem_slave_byteenable
	wire         mm_interconnect_0_nios2_debug_mem_slave_write;             // mm_interconnect_0:NIOS2_debug_mem_slave_write -> NIOS2:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_nios2_debug_mem_slave_writedata;         // mm_interconnect_0:NIOS2_debug_mem_slave_writedata -> NIOS2:debug_mem_slave_writedata
	wire         mm_interconnect_0_ocram_s1_chipselect;                     // mm_interconnect_0:OCRAM_s1_chipselect -> OCRAM:chipselect
	wire  [31:0] mm_interconnect_0_ocram_s1_readdata;                       // OCRAM:readdata -> mm_interconnect_0:OCRAM_s1_readdata
	wire  [14:0] mm_interconnect_0_ocram_s1_address;                        // mm_interconnect_0:OCRAM_s1_address -> OCRAM:address
	wire   [3:0] mm_interconnect_0_ocram_s1_byteenable;                     // mm_interconnect_0:OCRAM_s1_byteenable -> OCRAM:byteenable
	wire         mm_interconnect_0_ocram_s1_write;                          // mm_interconnect_0:OCRAM_s1_write -> OCRAM:write
	wire  [31:0] mm_interconnect_0_ocram_s1_writedata;                      // mm_interconnect_0:OCRAM_s1_writedata -> OCRAM:writedata
	wire         mm_interconnect_0_ocram_s1_clken;                          // mm_interconnect_0:OCRAM_s1_clken -> OCRAM:clken
	wire         mm_interconnect_0_uart_0_s1_chipselect;                    // mm_interconnect_0:UART_0_s1_chipselect -> UART_0:chipselect
	wire  [15:0] mm_interconnect_0_uart_0_s1_readdata;                      // UART_0:readdata -> mm_interconnect_0:UART_0_s1_readdata
	wire   [2:0] mm_interconnect_0_uart_0_s1_address;                       // mm_interconnect_0:UART_0_s1_address -> UART_0:address
	wire         mm_interconnect_0_uart_0_s1_read;                          // mm_interconnect_0:UART_0_s1_read -> UART_0:read_n
	wire         mm_interconnect_0_uart_0_s1_begintransfer;                 // mm_interconnect_0:UART_0_s1_begintransfer -> UART_0:begintransfer
	wire         mm_interconnect_0_uart_0_s1_write;                         // mm_interconnect_0:UART_0_s1_write -> UART_0:write_n
	wire  [15:0] mm_interconnect_0_uart_0_s1_writedata;                     // mm_interconnect_0:UART_0_s1_writedata -> UART_0:writedata
	wire         mm_interconnect_0_led_s1_chipselect;                       // mm_interconnect_0:LED_s1_chipselect -> LED:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;                         // LED:readdata -> mm_interconnect_0:LED_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;                          // mm_interconnect_0:LED_s1_address -> LED:address
	wire         mm_interconnect_0_led_s1_write;                            // mm_interconnect_0:LED_s1_write -> LED:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;                        // mm_interconnect_0:LED_s1_writedata -> LED:writedata
	wire         mm_interconnect_0_uart_1_s1_chipselect;                    // mm_interconnect_0:UART_1_s1_chipselect -> UART_1:chipselect
	wire  [15:0] mm_interconnect_0_uart_1_s1_readdata;                      // UART_1:readdata -> mm_interconnect_0:UART_1_s1_readdata
	wire   [2:0] mm_interconnect_0_uart_1_s1_address;                       // mm_interconnect_0:UART_1_s1_address -> UART_1:address
	wire         mm_interconnect_0_uart_1_s1_read;                          // mm_interconnect_0:UART_1_s1_read -> UART_1:read_n
	wire         mm_interconnect_0_uart_1_s1_begintransfer;                 // mm_interconnect_0:UART_1_s1_begintransfer -> UART_1:begintransfer
	wire         mm_interconnect_0_uart_1_s1_write;                         // mm_interconnect_0:UART_1_s1_write -> UART_1:write_n
	wire  [15:0] mm_interconnect_0_uart_1_s1_writedata;                     // mm_interconnect_0:UART_1_s1_writedata -> UART_1:writedata
	wire         irq_mapper_receiver0_irq;                                  // UART_0:irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                  // JTAG_UART:av_irq -> irq_mapper:receiver1_irq
	wire         irq_mapper_receiver2_irq;                                  // UART_1:irq -> irq_mapper:receiver2_irq
	wire  [31:0] nios2_irq_irq;                                             // irq_mapper:sender_irq -> NIOS2:irq
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [JTAG_UART:rst_n, LED:reset_n, NIOS2:reset_n, OCRAM:reset, UART_0:reset_n, UART_1:reset_n, irq_mapper:reset, mm_interconnect_0:NIOS2_reset_reset_bridge_in_reset_reset, rst_translator:in_reset]
	wire         rst_controller_reset_out_reset_req;                        // rst_controller:reset_req -> [NIOS2:reset_req, OCRAM:reset_req, rst_translator:reset_req_in]
	wire         nios2_debug_reset_request_reset;                           // NIOS2:debug_reset_request -> rst_controller:reset_in1

	uart_JTAG_UART jtag_uart (
		.clk            (clk_clk),                                                   //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver1_irq)                                   //               irq.irq
	);

	uart_LED led (
		.clk        (clk_clk),                             //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (led_external_connection_export)       // external_connection.export
	);

	uart_NIOS2 nios2 (
		.clk                                 (clk_clk),                                             //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                     //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                  //                          .reset_req
		.d_address                           (nios2_data_master_address),                           //               data_master.address
		.d_byteenable                        (nios2_data_master_byteenable),                        //                          .byteenable
		.d_read                              (nios2_data_master_read),                              //                          .read
		.d_readdata                          (nios2_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (nios2_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (nios2_data_master_write),                             //                          .write
		.d_writedata                         (nios2_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (nios2_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (nios2_instruction_master_address),                    //        instruction_master.address
		.i_read                              (nios2_instruction_master_read),                       //                          .read
		.i_readdata                          (nios2_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (nios2_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (nios2_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (nios2_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_nios2_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_nios2_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_nios2_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_nios2_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_nios2_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_nios2_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_nios2_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_nios2_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                     // custom_instruction_master.readra
	);

	uart_OCRAM ocram (
		.clk        (clk_clk),                               //   clk1.clk
		.address    (mm_interconnect_0_ocram_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_ocram_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_ocram_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_ocram_s1_write),      //       .write
		.readdata   (mm_interconnect_0_ocram_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_ocram_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_ocram_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),        // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),    //       .reset_req
		.freeze     (1'b0)                                   // (terminated)
	);

	uart_UART_0 uart_0 (
		.clk           (clk_clk),                                   //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),           //               reset.reset_n
		.address       (mm_interconnect_0_uart_0_s1_address),       //                  s1.address
		.begintransfer (mm_interconnect_0_uart_0_s1_begintransfer), //                    .begintransfer
		.chipselect    (mm_interconnect_0_uart_0_s1_chipselect),    //                    .chipselect
		.read_n        (~mm_interconnect_0_uart_0_s1_read),         //                    .read_n
		.write_n       (~mm_interconnect_0_uart_0_s1_write),        //                    .write_n
		.writedata     (mm_interconnect_0_uart_0_s1_writedata),     //                    .writedata
		.readdata      (mm_interconnect_0_uart_0_s1_readdata),      //                    .readdata
		.rxd           (uart_0_external_connection_rxd),            // external_connection.export
		.txd           (uart_0_external_connection_txd),            //                    .export
		.irq           (irq_mapper_receiver0_irq)                   //                 irq.irq
	);

	uart_UART_1 uart_1 (
		.clk           (clk_clk),                                   //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),           //               reset.reset_n
		.address       (mm_interconnect_0_uart_1_s1_address),       //                  s1.address
		.begintransfer (mm_interconnect_0_uart_1_s1_begintransfer), //                    .begintransfer
		.chipselect    (mm_interconnect_0_uart_1_s1_chipselect),    //                    .chipselect
		.read_n        (~mm_interconnect_0_uart_1_s1_read),         //                    .read_n
		.write_n       (~mm_interconnect_0_uart_1_s1_write),        //                    .write_n
		.writedata     (mm_interconnect_0_uart_1_s1_writedata),     //                    .writedata
		.readdata      (mm_interconnect_0_uart_1_s1_readdata),      //                    .readdata
		.rxd           (uart_1_external_connection_rxd),            // external_connection.export
		.txd           (uart_1_external_connection_txd),            //                    .export
		.irq           (irq_mapper_receiver2_irq)                   //                 irq.irq
	);

	uart_mm_interconnect_0 mm_interconnect_0 (
		.CLK_50_clk_clk                          (clk_clk),                                                   //                        CLK_50_clk.clk
		.NIOS2_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                            // NIOS2_reset_reset_bridge_in_reset.reset
		.NIOS2_data_master_address               (nios2_data_master_address),                                 //                 NIOS2_data_master.address
		.NIOS2_data_master_waitrequest           (nios2_data_master_waitrequest),                             //                                  .waitrequest
		.NIOS2_data_master_byteenable            (nios2_data_master_byteenable),                              //                                  .byteenable
		.NIOS2_data_master_read                  (nios2_data_master_read),                                    //                                  .read
		.NIOS2_data_master_readdata              (nios2_data_master_readdata),                                //                                  .readdata
		.NIOS2_data_master_write                 (nios2_data_master_write),                                   //                                  .write
		.NIOS2_data_master_writedata             (nios2_data_master_writedata),                               //                                  .writedata
		.NIOS2_data_master_debugaccess           (nios2_data_master_debugaccess),                             //                                  .debugaccess
		.NIOS2_instruction_master_address        (nios2_instruction_master_address),                          //          NIOS2_instruction_master.address
		.NIOS2_instruction_master_waitrequest    (nios2_instruction_master_waitrequest),                      //                                  .waitrequest
		.NIOS2_instruction_master_read           (nios2_instruction_master_read),                             //                                  .read
		.NIOS2_instruction_master_readdata       (nios2_instruction_master_readdata),                         //                                  .readdata
		.JTAG_UART_avalon_jtag_slave_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //       JTAG_UART_avalon_jtag_slave.address
		.JTAG_UART_avalon_jtag_slave_write       (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //                                  .write
		.JTAG_UART_avalon_jtag_slave_read        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //                                  .read
		.JTAG_UART_avalon_jtag_slave_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                                  .readdata
		.JTAG_UART_avalon_jtag_slave_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                                  .writedata
		.JTAG_UART_avalon_jtag_slave_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                                  .waitrequest
		.JTAG_UART_avalon_jtag_slave_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //                                  .chipselect
		.LED_s1_address                          (mm_interconnect_0_led_s1_address),                          //                            LED_s1.address
		.LED_s1_write                            (mm_interconnect_0_led_s1_write),                            //                                  .write
		.LED_s1_readdata                         (mm_interconnect_0_led_s1_readdata),                         //                                  .readdata
		.LED_s1_writedata                        (mm_interconnect_0_led_s1_writedata),                        //                                  .writedata
		.LED_s1_chipselect                       (mm_interconnect_0_led_s1_chipselect),                       //                                  .chipselect
		.NIOS2_debug_mem_slave_address           (mm_interconnect_0_nios2_debug_mem_slave_address),           //             NIOS2_debug_mem_slave.address
		.NIOS2_debug_mem_slave_write             (mm_interconnect_0_nios2_debug_mem_slave_write),             //                                  .write
		.NIOS2_debug_mem_slave_read              (mm_interconnect_0_nios2_debug_mem_slave_read),              //                                  .read
		.NIOS2_debug_mem_slave_readdata          (mm_interconnect_0_nios2_debug_mem_slave_readdata),          //                                  .readdata
		.NIOS2_debug_mem_slave_writedata         (mm_interconnect_0_nios2_debug_mem_slave_writedata),         //                                  .writedata
		.NIOS2_debug_mem_slave_byteenable        (mm_interconnect_0_nios2_debug_mem_slave_byteenable),        //                                  .byteenable
		.NIOS2_debug_mem_slave_waitrequest       (mm_interconnect_0_nios2_debug_mem_slave_waitrequest),       //                                  .waitrequest
		.NIOS2_debug_mem_slave_debugaccess       (mm_interconnect_0_nios2_debug_mem_slave_debugaccess),       //                                  .debugaccess
		.OCRAM_s1_address                        (mm_interconnect_0_ocram_s1_address),                        //                          OCRAM_s1.address
		.OCRAM_s1_write                          (mm_interconnect_0_ocram_s1_write),                          //                                  .write
		.OCRAM_s1_readdata                       (mm_interconnect_0_ocram_s1_readdata),                       //                                  .readdata
		.OCRAM_s1_writedata                      (mm_interconnect_0_ocram_s1_writedata),                      //                                  .writedata
		.OCRAM_s1_byteenable                     (mm_interconnect_0_ocram_s1_byteenable),                     //                                  .byteenable
		.OCRAM_s1_chipselect                     (mm_interconnect_0_ocram_s1_chipselect),                     //                                  .chipselect
		.OCRAM_s1_clken                          (mm_interconnect_0_ocram_s1_clken),                          //                                  .clken
		.UART_0_s1_address                       (mm_interconnect_0_uart_0_s1_address),                       //                         UART_0_s1.address
		.UART_0_s1_write                         (mm_interconnect_0_uart_0_s1_write),                         //                                  .write
		.UART_0_s1_read                          (mm_interconnect_0_uart_0_s1_read),                          //                                  .read
		.UART_0_s1_readdata                      (mm_interconnect_0_uart_0_s1_readdata),                      //                                  .readdata
		.UART_0_s1_writedata                     (mm_interconnect_0_uart_0_s1_writedata),                     //                                  .writedata
		.UART_0_s1_begintransfer                 (mm_interconnect_0_uart_0_s1_begintransfer),                 //                                  .begintransfer
		.UART_0_s1_chipselect                    (mm_interconnect_0_uart_0_s1_chipselect),                    //                                  .chipselect
		.UART_1_s1_address                       (mm_interconnect_0_uart_1_s1_address),                       //                         UART_1_s1.address
		.UART_1_s1_write                         (mm_interconnect_0_uart_1_s1_write),                         //                                  .write
		.UART_1_s1_read                          (mm_interconnect_0_uart_1_s1_read),                          //                                  .read
		.UART_1_s1_readdata                      (mm_interconnect_0_uart_1_s1_readdata),                      //                                  .readdata
		.UART_1_s1_writedata                     (mm_interconnect_0_uart_1_s1_writedata),                     //                                  .writedata
		.UART_1_s1_begintransfer                 (mm_interconnect_0_uart_1_s1_begintransfer),                 //                                  .begintransfer
		.UART_1_s1_chipselect                    (mm_interconnect_0_uart_1_s1_chipselect)                     //                                  .chipselect
	);

	uart_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.receiver2_irq (irq_mapper_receiver2_irq),       // receiver2.irq
		.sender_irq    (nios2_irq_irq)                   //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.reset_in1      (nios2_debug_reset_request_reset),    // reset_in1.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule