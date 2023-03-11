`timescale 1ns / 1ps

module overflow_adder(

    input M,
    input [3:0] A,
    input [3:0] B,
    output [4:0] C,
    output V
);

wire [3:0]X;
wire [4:1]Ca;

assign X[0] = B[0]^M;
assign X[1] = B[1]^M;
assign X[2] = B[2]^M;
assign X[3] = B[3]^M;


fulladder f0(.A(A[0]),.B(X[0]),.Cin(M),.Sum(C[0]),.Cout(Ca[1]));
fulladder f1(.A(A[1]),.B(X[1]),.Cin(Ca[1]),.Sum(C[1]),.Cout(Ca[2]));
fulladder f2(.A(A[2]),.B(X[2]),.Cin(Ca[2]),.Sum(C[2]),.Cout(Ca[3]));
fulladder f3(.A(A[3]),.B(X[3]),.Cin(Ca[3]),.Sum(C[3]),.Cout(Ca[4]));

xor(V,Ca[3],Ca[4]);
assign C[4] = Ca[4];


endmodule
