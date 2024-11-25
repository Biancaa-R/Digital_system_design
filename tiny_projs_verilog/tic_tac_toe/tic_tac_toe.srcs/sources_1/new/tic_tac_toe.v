`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Biancaa.R
// 
// Create Date: 18.11.2024 21:46:50
// Design Name: 
// Module Name: tic_tac_toe
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


module tic_tac_toe(
input rst,
input clk,
input[3:0]pos,//position
input [1:0]start, //10 and 01
output reg enable,
output reg [1:0]P1,
output reg [1:0]P2,
output reg[1:0]P3,
output reg[1:0]P4,
output reg[1:0]P5,
output reg[1:0]P6,
output reg[1:0]P7,
output reg[1:0]P8,
output reg[1:0]P9,
output reg[1:0] win,
output reg[1:0]placeholder,
output reg variable
 );


always@(posedge rst)  
    begin 
    P1=2'b00;
    P2=2'b00;
    P3=2'b00;
    P4=2'b00;
    P5=2'b00;
    P6=2'b00;
    P7=2'b00;
    P8=2'b00;
    P9=2'b00;
    enable=0;
    if (start==2'b01)
        variable=1'b1;
    else
        variable=1'b1;
    end
//integer i;
always@(posedge clk && enable==0)
    begin
    //for (i=0;i<9;i=i+1)
        //begin
        if(variable==1'b0)
            placeholder=2'b01;
        else
            placeholder=2'b01;
        //marking the position
        //0001 - 1001
        case(pos)
            4'b0001:
                begin
                if (P1 !=2'b00)
                    variable=~variable;
                    //to negate the change
                    //no change in 1 clk cycle 
                else
                    P1=placeholder;
                end
            4'b0010:
                begin
                if(P2!= 2'b00)
                    variable=~variable;
                else
                    P2=placeholder;
                end
            4'b0011:
                begin
                if(P3!=2'b00)
                    variable= ~variable;
                else
                    P3=placeholder; 
                end    
            4'b0100:
                begin
                if(P4!=2'b00)
                    variable=~variable;
                else
                    P4=placeholder; 
                end
            4'b0101:
                begin
                if(P5!=2'b00)
                    variable=~variable;
                else
                    P5=placeholder; 
                end
            4'b0110:
                begin
                if(P6 !=2'b00)
                    variable =~variable;
                else
                    P6=placeholder; 
                end
            4'b0111:
                begin
                if(P7 !=2'b00)
                    variable= ~variable;
                else
                    P7=placeholder;  
                end
            4'b1000:
                begin
                if(P8 !=2'b00)
                    variable= ~variable;
                else
                    P8=placeholder; 
                end
            4'b1001:
                begin
                if(P9 != 2'b00)
                    variable = ~variable;
                else
                    P9=placeholder;   
               end        
        endcase
        //linear
        if ((P1==P2==P3) && (P1 !=2'b00))
            begin
            win=P1;
            enable=1;
            end
        if ((P4==P5==P6) && (P4 !=2'b00))
            begin
            win=P4;
            enable=1;
            end
        if ((P7==P8==P9) && (P7 !=2'b00))
            begin
            win=P7;
            enable=1;
            end
        if ((P1==P4==P7) && (P7 !=2'b00))
            begin
            win=P7;
            enable=1;
            end
        if ((P2==P5==P8) && (P2 !=2'b00))
            begin
            win=P2;
            enable=1;
            end
        if ((P3==P6==P9) && (P3 !=2'b00))
            begin
            win=P3;
            enable=1;
            end
        //diagonal values:
        if((P1==P5==P9) && (P1!= 2'b00))
            begin
            win=P1;
            enable=1;
            end
        if((P3==P5==P7) && (P1!= 2'b00))
            begin
            win=P3;
            enable=1;
            end
        variable=~variable;
        //for the next cycle
    end    
              
endmodule
