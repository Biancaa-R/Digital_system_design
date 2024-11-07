`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 19:57:43
// Design Name: 
// Module Name: carry_look_ahead
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module carry_look_ahead(
    input [3:0] A,
    input clk,
    input[3:0] B,
    input Cin,
    output [3:0]Sum,
    output cout
    );
    
    wire [3:0]P;
    wire [3:0]G;
    wire[3:0] c;
    wire sum;
    
    assign P=A^B;
    assign G= A&B;
    assign c[0] = Cin;
    assign c[1]= G[0] | (P[0]&c[0]);
    assign c[2]= G[1] | (P[1]&c[1]);
    assign c[3]= G[2] | (P[2]&c[2]);
    assign cout = G[3] | (P[3]&c[3]);
    assign Sum = P^c;

endmodule
