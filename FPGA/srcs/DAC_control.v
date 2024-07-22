`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2020 09:57:58 AM
// Design Name: 
// Module Name: DAC_control
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


module DAC_control(
    input clk, enable, start,
    input [15:0] data_in_A, data_in_B,data_in_C,data_in_D,
    output reg CS = 1'b1,LDAC ='b1,DIN = 1'b0
    );
    
    reg [3:0] control = 4'd0;
    reg [5:0] count = 6'd0;
    reg [23:0] data_in = 24'd0;

    
    always @(posedge clk) begin
        if(enable)begin
            case (control)
             
                0:begin
                //LDAC        <= 1'b1;
                    if(start)begin //comenzamos                        
                        count       <= 6'd0;
                        data_in     <= {1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,data_in_A};//{0 Write,0,010 data register, 000 address,data}
                        control     <= 4'd1;
                    end
                end
                
                1:begin
                    CS          <= 1'b0;
                    DIN         <= 1'b0;
                    control     <= 4'd2;
                end
    
                
                2:begin
                    if(count < 6'd23)begin
                        DIN         <= data_in[6'd22-count];                 
                        count       <= count + 6'd1;
                    end
                    else begin
                        count       <= 6'd0;
                        DIN         <= 1'b0;
                        CS          <= 1'b1;
                        control     <= 4'd3;
                    end
                end
                
                3:begin
                    data_in     <= {1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,data_in_B};
                    control     <= 4'd4;
                end
                
                4:begin
                    CS          <= 1'b0;
                    DIN         <= 1'b0;
                    control     <= 4'd5;
                end
    
                
                5:begin
                    if(count < 6'd23)begin
                        DIN         <= data_in[6'd22-count];  
                        count       <= count + 6'd1;
                    end
                    else begin
                        count       <= 6'd0;
                        DIN         <= 1'b0;                   
                        CS          <= 1'b1;
                        control     <= 4'd6;
                    end
                end
                
                6:begin
                    data_in     <= {1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,data_in_C};
                    control     <= 4'd7;
                end
                
                7:begin
                    CS          <= 1'b0;
                    DIN         <= 1'b0;
                    control     <= 4'd8;
                end
    
                
                8:begin
                    if(count < 6'd23)begin
                        DIN         <= data_in[6'd22-count];  
                        count       <= count + 6'd1;
                    end
                    else begin
                        count       <= 6'd0;
                        DIN         <= 1'b0;                   
                        CS          <= 1'b1;
                        control     <= 4'd9;
                    end
                end
                
                9:begin
                    data_in     <= {1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,data_in_D};
                    control     <= 4'd10;
                end
                
                10:begin
                    CS          <= 1'b0;
                    DIN         <= 1'b0;
                    control     <= 4'd11;
                end
    
                
                11:begin
                    if(count < 6'd23)begin
                        DIN         <= data_in[6'd22-count];  
                        count       <= count + 6'd1;
                        if(count == 6'd15)begin
                            LDAC        <= 1'b0;
                        end
                    end
                    else begin
                        count       <= 6'd0;
                        DIN         <= 1'b0;                   
                        CS          <= 1'b1;
                        control     <= 4'd12;
                    end
                end
                
                12:begin
                    if(count < 6'd23)begin
                        count       <= count + 6'd1;
                    end
                    else begin
                        count       <= 6'd0;
                        //LDAC        <= 1'b0;
                        control     <= 4'd13;
                    end
                end
                
                13:begin
                    if(count < 6'd5)begin
                        count       <= count + 6'd1;
                    end
                    else begin
                        count       <= 6'd0;
                        control     <= 4'd0;
                    end
                end
                
            endcase
        end
        
        else begin
            CS          <= 1'b1;
            control     <= 2'd0;
            LDAC        <= 1'b1;
            count       <= 6'd0;
        end
    end
endmodule