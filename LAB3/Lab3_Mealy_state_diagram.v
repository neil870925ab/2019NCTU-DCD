module Lab3_Mealy_state_diagram(output z, input x, clock, reset);

	reg [1:0] state, nextstate;
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

	always @ (posedge clock, negedge reset) begin
		
		if(reset==0) state <= S0;
		else state <= nextstate;

	end

	always @ (state,x) begin
	
		case(state)
			S0:if(x==0) nextstate = S1;else nextstate = S2;
			S1:if(x==0) nextstate = S0;else nextstate = S3;
			S2:if(x==0) nextstate = S1;else nextstate = S3;
			S3:if(x==0) nextstate = S0;else nextstate = S2;
		endcase
	end

	reg tmp;
	assign z = tmp;

	always @ (state,x) begin

		case(state)
			S0,S3: tmp = ~x;
			S1,S2: tmp = x;
		endcase
	end



endmodule
