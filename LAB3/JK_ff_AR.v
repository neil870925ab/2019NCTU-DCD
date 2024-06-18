module JK_ff_AR(Q, J, K, clock, reset);
	output Q;
	input J, K, clock, reset;
	reg Q;
	wire Q_not;
	assign Q_not = ~Q;

	always @ (posedge clock, negedge reset)
		if(reset==0) Q <= 0;
		else
			case({J, K})
				2'b00: Q <= Q;
				2'b01: Q <= 0;
				2'b10: Q <= 1;
				2'b11: Q <= ~Q;
			endcase

endmodule
