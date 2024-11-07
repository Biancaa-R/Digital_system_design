`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 01:10:34
// Design Name: 
// Module Name: up_down_counter_tb
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


module up_down_counter_tb;
reg clk;
reg reset;
reg updown;
wire [3:0]count;

up_down_counter uut(
.clk(clk),
.reset(reset),
.up_down(updown),
.count(count)
);

initial begin
    clk=0;
    forever #5 clk=~clk; 
    end
initial begin
    reset=0;
    updown=0;
    #10 reset =0;
    #10 reset =1;
    #10 reset =0;
    updown=1;
    #100;
    updown=0;
    #100;
    #10 reset =0;
    #10 reset =1;
    #10 reset =0;  
    end
endmodule
