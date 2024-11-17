`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2024 09:19:15
// Design Name: 
// Module Name: universal_shift_tb
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


module universal_shift_tb;
reg [7:0]D;
reg clk;
reg rst;
reg [2:0]opcode;
reg SI;
wire SO;
wire [7:0]Q;

universal_shift uut(
.clk(clk),
.D(D),
.rst(rst),
.opcode(opcode),
.SI(SI),
.SO(SO),
.Q(Q)
);

  // Clock generation 
initial clk = 0; 
always #5 clk = ~clk; // 10ns clock period 

initial begin
rst=1;
#10 rst=0;
#10 D=8'b10110111 ; SI=1'b1 ;opcode=3'b000;
#10 opcode=3'b001;
#10 D=8'b11101110; SI=1'b0; opcode=3'b111;
#10 D=8'b11101110; SI=1'b0; opcode=3'b010;
end
endmodule
