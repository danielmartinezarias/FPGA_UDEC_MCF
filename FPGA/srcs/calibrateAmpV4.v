`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2023 01:16:05 PM
// Design Name: 
// Module Name: calibrateAmpV4
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


module calibrateAmpV4(
    input clk,
    input start_V4_cal,
    input [15:0] V4_decoy, V4_vaccum, V4_signal,
    output reg [15:0] V4_decoy_calibrated, V4_vaccum_calibrated, V4_signal_calibrated,
    input [31:0] decoy_counts, vaccum_counts, signal_counts,
    input [31:0] APD_sum,
    output reg done = 1'd0,
    input EnACCCtrl
    );
    
    OneShot o1 (
    .clk(clk), 
    .signal(start_V4_cal), 
    .trigger(os_start_V4_cal)
    );
    
    OneShot o2 (
    .clk(clk), 
    .signal(EnACCCtrl), 
    .trigger(os_EnACCCtrl)
    );
    
    reg [2:0] control = 3'd0;
    reg [31:0] counts_control;
    reg [31:0] delta; 
    reg [31:0] delta0 = 16'd65000; 
    reg [15:0] V4_control;
    reg [15:0] V4_control0;
    reg [15:0] V4_cal;
    reg [1:0] AmpState = 2'd0;
    
    always@(posedge clk)begin
    
        case(control)
        
            0:begin
                if(os_start_V4_cal)begin// espero la señal de entrada
                    control         <= 1;
                    done            <= 1'd0;
                end
            end
        
            1:begin
                    delta0          <= 16'd65000;//actualizo la variable a minimizar
                    control         <= 2;//
                    case(AmpState)
                        0:begin 
                            counts_control      <= vaccum_counts;//vaccum
                            V4_control          <= V4_vaccum; //vaccum           
                        end
                        
                        1:begin 
                            counts_control      <= decoy_counts;//decoy
                            V4_control          <= V4_decoy; //decoy                          
                        end
                        
                        2:begin 
                            counts_control      <= signal_counts;//signal
                            V4_control          <= V4_signal; //signal                            
                        end
                        
                        default: begin
                            counts_control      <= vaccum_counts;//vaccum
                            V4_control          <= V4_vaccum; //vaccum
                        end
                        
                    endcase 
            end
            
            
            2:begin //caluclamos el valor absoluto de counts_control - APD_sum
                if(os_EnACCCtrl)begin
                    if(counts_control > APD_sum)begin
                        delta       <= counts_control - APD_sum;
                    end
                    else begin
                        delta       <= APD_sum - counts_control;
                    end
                    control         <= 3;
                end
            end
            
            3:begin
                if(delta < delta0)begin
                    V4_control      <= V4_control + 16'd10;
                    V4_control0     <= V4_control;
                    delta0          <= delta;
                    control         <= 2;
                end
                else begin
                    V4_control      <= V4_control0;
                    control         <= 4;
                end
            end
            
            4:begin
                
                case(AmpState)
                        0:begin 
                            V4_vaccum_calibrated    <=  V4_control;   
                            AmpState                <=  1;    
                            control                 <= 1;                            
                        end
                        1:begin 
                            V4_decoy_calibrated    <=  V4_control;   
                            AmpState                <=  2;          
                            control                 <= 1;                      
                        end
                        2:begin 
                            V4_signal_calibrated    <=  V4_control;   
                            AmpState                <=  0; 
                            done                    <=  1'd1;
                            control                 <=  0;                               
                        end
                endcase
            end
            
    
        endcase
    end
    
endmodule
