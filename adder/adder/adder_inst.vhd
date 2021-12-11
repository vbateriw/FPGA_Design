	component adder is
		port (
			clk_clk                             : in  std_logic                    := 'X';             -- clk
			reset_reset_n                       : in  std_logic                    := 'X';             -- reset_n
			input_2_external_connection_export  : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			input_1_external_connection_export  : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			output_y_external_connection_export : out std_logic_vector(2 downto 0)                     -- export
		);
	end component adder;

	u0 : component adder
		port map (
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                          clk.clk
			reset_reset_n                       => CONNECTED_TO_reset_reset_n,                       --                        reset.reset_n
			input_2_external_connection_export  => CONNECTED_TO_input_2_external_connection_export,  --  input_2_external_connection.export
			input_1_external_connection_export  => CONNECTED_TO_input_1_external_connection_export,  --  input_1_external_connection.export
			output_y_external_connection_export => CONNECTED_TO_output_y_external_connection_export  -- output_y_external_connection.export
		);

