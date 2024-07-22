`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 03:33:44 PM
// Design Name: 
// Module Name: pulse_gen
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


module pulse_gen(
    input clk,
    input [31:0] width,period,
    output reg pulse = 1'b0
    );
    

    reg[31:0] counter = 32'd0;

    always@(posedge clk)begin

            if(counter < period)begin
                counter         <=      counter + 32'd1;
                if(counter <= width)begin
                    pulse           <=      1'd1;
                end
                else begin
                    pulse           <=      1'd0;
                end
            end
            else begin
                counter         <=      32'd0;
                pulse           <=      1'd0;
            end
        
    
    end

endmodule
