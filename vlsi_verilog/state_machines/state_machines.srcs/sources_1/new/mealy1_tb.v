`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 20:15:07
// Design Name: 
// Module Name: mealy1_tb
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


module mealy1_tb;
reg x;
reg clk;
reg rst;
wire z;

mealy1 uut(
.x(x),
.clk(clk),
.reset(rst),
.z(z)
);

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
rst=1;
#10 rst=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
end
endmodule
