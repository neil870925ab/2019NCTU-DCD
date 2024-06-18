module Lab3_Mealy_structural (output z,input x, clock, reset);

	FJKRSE  JK1(A,J1,K1,clock,reset), 
		JK2(B,J2,K2,clock,reset);

	assign J1 = x;
	assign K1 = ~x;
	assign J2 = A|(~x);
	assign K2 = A|(~x);
	assign z = ~(x^A^B);



endmodule
