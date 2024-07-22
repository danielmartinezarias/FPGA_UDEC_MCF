`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 04:45:36 PM
// Design Name: 
// Module Name: trigger_ADP_with_delay
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


module trigger_ADP_with_delay(
    input clk,
    input trigger_IN,
    output reg signal_out = 1'b0,gate_A = 1'b0,gate_B = 1'b0,
    input [31:0] delay,
    input [31:0] width
    );
    
    OneShot o1 (
    .clk(clk), 
    .signal(trigger_IN), 
    .trigger(os_trigger_IN)
    );
    
    reg [1:0] state = 2'd0;
    reg [31:0] counter = 32'd0;
    
    always@(posedge clk)begin
    
        case(state)
        
            0:begin
                if(os_trigger_IN)begin
                    state       <= 1;
                    signal_out  <= 1'b1;
                    gate_A      <= 1'b1;
                    counter     <= 32'd1;
                end                
            end
            
            1:begin
                
                if(counter==width)begin
                    signal_out  <= 1'b0;
                    gate_A      <= 1'b0;
                    state       <= 2;
                end
                else begin
                    counter     <= counter + 32'd1;
                end
            end
            
            2:begin
                if(counter==delay)begin
                    signal_out  <= 1'b1;
                    gate_B      <= 1'b1;
                    counter     <= 32'd1;
                    state       <= 3;
                end
                else begin
                    counter     <= counter + 32'd1;
                end
            end
            
            3:begin
                if(counter==width)begin
                    signal_out  <= 1'b0;
                    gate_B      <= 1'b0;
                    counter     <= 32'd0;
                    state       <= 0;
                end
                else begin
                    counter     <= counter + 32'd1;
                end
            end
            
        endcase
    end
    
endmodule
