module up_down_counter ( 
    input clk,          // Clock input 
    input reset,        // Asynchronous reset 
    input up_down,      // Up/Down control input 
    output reg [3:0] count // 4-bit counter output 
); 
 
always @(posedge clk or posedge reset) begin 
    if (reset) begin 
        count <= 4'b0000;  // Reset the counter to 0 
    end else begin 
        if (up_down) begin 
            count <= count + 1;  // Count up 
        end else begin 
            count <= count - 1;  // Count down 
        end 
    end 
end 
 
endmodule