`timescale 1ns / 1ps

module overflow_adder_tb();

	reg [3:0]A;
	reg [3:0]B;
	reg M; 
	wire [4:0]C;
	wire V; 
	initial begin
	#50 
	A = 4'b1111;
	B = 4'b1111; 
	M = 1'b0; 
	#50 
	A = 4'b0111; 
	B = 4'b0100; 
	M = 1'b0; 
	#50 
	A = 4'b1111; 
	B = 4'b0011; 
	M = 1'b1; 
	#50 
	A = 4'b1000; 
	B = 4'b0111; 
	M = 1'b1;
	#50 
	A = 4'b0000; 
	B = 4'b0111; 
	M = 1'b1;
	#50 $finish; 
	end overflow_adder ovfd1(.A(A), .B(B),.M(M), .C(C), .V(V)); 
	endmodule