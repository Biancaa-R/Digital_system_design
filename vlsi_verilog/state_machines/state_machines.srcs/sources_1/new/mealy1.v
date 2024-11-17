module mealy1(
input x,clk,reset,
output reg z
);

parameter S0=0,S1=1,S2=2,S3=3;
reg[1:0] PS,NS;
always@(posedge clk or posedge reset)
    begin
    if( reset==1)
        PS<=S0;
    else
        PS<=NS;
    end
always@(posedge clk or posedge reset)
    begin
    if(reset==1)
        z<= 1'b0;
    else
        z<= (PS==S3)&& x;
    end
always@(*)
    begin
        case(PS)
            S0: NS= x ? S1:S0;
            S1: NS= x ? S1:S2;
            S2: NS= x ? S3:S0;
            S3: NS= x ? S1:S2;
         endcase
      end
 endmodule