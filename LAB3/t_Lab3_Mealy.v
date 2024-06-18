module t_Lab3_Mealy;
	
	wire z1, z2;
	reg x;
	reg clock, reset;
	Lab3_Mealy_state_diagram test1(z1, x, clock, reset);
	Lab3_Mealy_structural test2(z2, x, clock, reset);
	initial begin
		clock = 1'b0;
		#0 reset = 1'b0;
		#5 reset = 1'b1;
		forever #10 clock = ~clock;
		
	end

	initial begin
		#0 x = 1'b0; // reset = 0
		#9 x = 1'b0; // S0 -> S1 
		#29 x = 1'b1; //S1 -> S3 
		#49 x = 1'b1; //S3 -> S2 
		#69 x = 1'b1; //S2 -> S3
		#89 x = 1'b0; //S3 -> S0
		#109 x = 1'b1; //S0 -> S2
		#129 x = 1'b0; //S2 -> S1 
		#149 x = 1'b0; //S1 -> S0
	end

	initial #200 $finish;

endmodule
