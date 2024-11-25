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


module tic_tac_toe_tb;
reg rst;
reg clk;
reg [3:0]pos;//position
reg [1:0]start; //10 and 01
wire enable;
wire[1:0]P1;
wire [1:0]P2;
wire [1:0]P3;
wire [1:0]P4;
wire [1:0]P5;
wire [1:0]P6;
wire [1:0]P7;
wire [1:0]P8;
wire [1:0]P9;
wire [1:0] win;
wire [1:0]placeholder;
wire variable;

tic_tac_toe uut(
.clk(clk),
.rst(rst),
.start(start),
.enable(enable),
.win(win),
.placeholder(placeholder),
.variable(variable),
.P1(P1),
.P2(P2),
.P3(P3),
.P4(P4),
.P5(P5),
.P6(P6),
.P7(P7),
.P8(P8),
.P9(P9)
);

  // Clock generation 
initial clk = 0; 
always #5 clk = ~clk; // 10ns clock period 

initial begin
rst=1;
#10 rst=0;
#10 start=10;
#10 pos =4'b0001;
#10 pos =4'b0111;
#10 pos =4'b0011;
#10 pos =4'b1000;
#10 pos =4'b0010;
#10 pos =4'b1001;
#10 pos =4'b0100;

end
endmodule