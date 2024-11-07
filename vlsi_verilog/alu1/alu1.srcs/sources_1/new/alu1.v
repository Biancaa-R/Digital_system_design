`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 19:58:51
// Design Name: 
// Module Name: alu1
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


module alu1(
    input[7:0]A,
    input[7:0]B,
    input[3:0]opcode,
    output reg [15:0]result,
    output reg carry,
    output reg overflow
    );
    always@(*)
        begin
        case (opcode)
            4'b0000: 
                result<=16'b0;
            4'b0001:
                result<= A+B;
            4'b0010:
                result<= A-B;
            4'b0011:
                result<= A*B;
            4'b0100:
                result<=A&B;
            4'b0101:
                result<= A|B;
            4'b0110:
                result<= A^B;
            4'b0111:
                result<=~(A|B);
            4'b1000:
                result<= (A<B)?8'b1:8'b0;
            4'b1001:
                result<= (A==B)?8'b1:8'b0;
            4'b1010:
                result<= A<<2;
            4'b1011:
                result<= A>>2;
            4'b1100:
                result<= A+1;
            4'b1101:
                result<=A-1;
            4'b1110:
                result <= ~(A^B);
            4'b1111:
                result<= ~(A&B);
            endcase
            carry= ((opcode==4'b1001) && (result<A || result<B));
            overflow= ((opcode==4'b1001)&& ((A[7]==B[7]) && (A[7]!=result[7])));
            end
endmodule   
