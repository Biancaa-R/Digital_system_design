module alu1_tb;

reg[7:0] A;
reg[7:0] B;
reg[3:0] opcode;
wire[15:0] result;
wire carry_out;
wire overflow;
wire zero;

alu1 uut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry_out),
    .overflow(overflow));
    
initial begin
A=8'b0;
B=8'b0;
#10;
opcode=4'b0000;
#10;
A=8'h3;
B=8'h7;
opcode=4'b 0001;
#10;
opcode=4'b0010;
end 
endmodule 


    

