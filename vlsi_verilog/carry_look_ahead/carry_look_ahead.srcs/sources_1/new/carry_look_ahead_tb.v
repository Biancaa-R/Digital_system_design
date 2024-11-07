module carry_look_ahead_tb;
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire carry;
wire [3:0]sum;

carry_look_ahead uut(
.A(A),
.B(B),
.Cin(Cin),
.Sum(sum),
.cout(carry)
);

initial begin
A= 4'b0000;
B=4'b0000;
Cin=0;
#10;
A=4'b 1010;
B= 4'b 1101;
Cin=1;
#10;
A=4'b 1010;
B= 4'b 1001;
Cin=0;
#10;
A=4'b 1010;
B= 4'b 0001;
Cin=1;
#10;
end
endmodule