module universal_shift(
input [7:0] D,
input SI,
input [2:0] opcode,
input clk,
input rst,
output reg SO,
output reg [7:0]Q
);

always@(posedge clk or posedge rst)
    begin
    if(rst==1)
        begin
        Q<= 8'b0;
        SO<=1'b0;
        end
    else
        begin
        case(opcode)
            3'b000:
                begin
                Q<=Q;
                SO <= SO;
                end
            3'b001:
                begin
                //siso left
                SO <= Q[7];
                Q<= {Q[6:0],SI};
                end
            3'b010:
                begin
                //siso right 
                SO <= Q[0];
                Q<= { SI , Q[7:1]};
                end
           3'b011:
                 begin
                 //sipo left
                 SO<= 1'b0;
                 Q<= {Q[6:0],SI};
                 end
            3'b100:
                  begin
                  //sipo right
                  SO<= 1'b0;
                  Q<= {SI , Q[7:1]};
                  end
            3'b101:
                   begin
                   //piso left
                   SO<= Q[7];
                   Q<=D;
                   end
            3'b110:
                    begin
                    //piso right
                    SO<= Q[0];
                    Q<=D;
                    end
            3'b111:
                    begin
                    //pipo 
                    SO<=1'b0;
                    Q<=D;
                    end
           endcase
           end
   end
endmodule     
                
        
