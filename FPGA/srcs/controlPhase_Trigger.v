`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/18/2021 04:17:38 PM
// Design Name: 
// Module Name: controlPhase_Trigger
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


module controlPhase_Trigger(
    input clk,
    input trigger_pin,
    output reg sclr = 1'b0,
    output reg en_count = 1'b0,
    output reg actualizar_regsAPD = 1'b0,
    input [2:0] modo_medicion,
    input [3:0] enablePM,
    output reg [15:0] counter_medidas = 16'd0,
    input [15:0] counter_medidas_max,
    input start_medicion,
    output reg startTx = 1'b0,
    output reg startDAC = 1'b0,
    output reg [15:0] DAC1 = 16'b0111111111111111, DAC2 = 16'b0111111111111111, DAC3 = 16'b0111111111111111, DAC4 = 16'b0111111111111111,
    output reg [15:0] Vout1 = 16'b0111111111111111, Vout2 = 16'b0111111111111111, Vout3 = 16'b0111111111111111, Vout4 = 16'b0111111111111111,
    input [15:0] V1,V2,V3,V4,V0_1,V0_2,V0_3,V0_4,
    input [15:0] VRampa_0_1,VRampa_0_2,VRampa_0_3,VRampa_0_4,
    input [15:0] VRampa_F_1,VRampa_F_2,VRampa_F_3,VRampa_F_4,
    input [15:0] pasos_rampa,
    input ReadyTx,
    input [31:0] PM_stabilization,
    output reg meas_monitor = 1'b0,
    input [31:0] N_muestras,
    input align_button,
    input signal_alignment,
    input [31:0] N_decoy, N_vaccum, N_signal,
    input [15:0] V4_decoy, V4_vaccum, V4_signal,
    input [31:0] APD_sum,
    input acknowledged
    );
    
    OneShot o1 (
    .clk(clk), 
    .signal(trigger_pin), 
    .trigger(os_start_trigger)
    );
    
    OneShot o2 (
    .clk(clk), 
    .signal(~trigger_pin), 
    .trigger(os_end_trigger)
    );
    
    OneShot o4 (
    .clk(clk), 
    .signal(signal_alignment), 
    .trigger(os_signal_alignment)
    );
    
    
    reg [4:0] control = 0;
    reg [2:0] delay_clk = 0;
    reg [15:0] V1_rampa = 16'b0111111111111111;
    reg [15:0] V2_rampa = 16'b0111111111111111;
    reg [15:0] V3_rampa = 16'b0111111111111111;
    reg [15:0] V4_rampa = 16'b0111111111111111;
    reg [31:0] counter = 32'd0;
    reg [31:0] counter_decoy_aux = 32'd0;
    
    
    
    
    
    always@(posedge clk)begin
        
        case(control)
        
            0:begin
                startTx             <= 1'b0;
                if(start_medicion)begin//EMPIEZO LA MEDICION E INICIALIZO LAS COSAS
                    counter_medidas     <= 16'd0;
                    control             <= 1;
                    V1_rampa            <= VRampa_0_1;
                    V2_rampa            <= VRampa_0_2;
                    V3_rampa            <= VRampa_0_3;
                    V4_rampa            <= VRampa_0_4;
                    sclr                <= 1'b1;
                end else begin
                    if(align_button)begin//ALINEACION
                        control             <= 11;
                        counter_medidas     <= 16'd0;
                        sclr                <= 1'b1;  
                        en_count            <= 1'b0;                      
                    end
                    else begin
                        startDAC            <= 1'b1;
                        DAC1                <= V0_1;//PRIMERO LOS DACS ESTAN EN 0, ESPERANDO A QUE EL CNTROL
                        DAC2                <= V0_2;//ESTE LISTO
                        DAC3                <= V0_3;
                        DAC4                <= V0_4;
                    end
                end
            end
            
            1:begin
                
                sclr                        <= 1'b0;
                if(os_start_trigger)begin//CUANDO ESTA LISTO EL CONTROL PREPARO LA MEDICION
                    control         <= 5;
                    delay_clk       <= 3'd0;
                    case(modo_medicion)
                        0:begin//NADA
                            DAC1            <= V0_1;
                            DAC2            <= V0_2;
                            DAC3            <= V0_3;
                            DAC4            <= V0_4;
                        end
                        1:begin//SINGLE MEAS
                            if(enablePM[0])
                                DAC1            <= V1;
                            if(enablePM[1])
                                DAC2            <= V2;
                            if(enablePM[2])
                                DAC3            <= V3;
                            if(enablePM[3])
                                DAC4            <= V4;
                        end
                        2:begin//RAMPA
                            if(enablePM[0])
                                DAC1            <= V1_rampa;
                            if(enablePM[1])
                                DAC2            <= V2_rampa;
                            if(enablePM[2])
                                DAC3            <= V3_rampa;
                            if(enablePM[3])
                                DAC4            <= V4_rampa;
                        end
                        
                        3:begin//fijo
                            if(enablePM[0])
                                DAC1            <= V1;
                            if(enablePM[1])
                                DAC2            <= V2;
                            if(enablePM[2])
                                DAC3            <= V3;
                            if(enablePM[3])
                                DAC4            <= V4;
                        end
                        
                        7:begin//decoy
                            if(enablePM[0])
                                DAC1            <= V1;
                            if(enablePM[1])
                                DAC2            <= V2;
                            if(enablePM[2])
                                DAC3            <= V3;
                            if(enablePM[3])
                                begin
                                if(counter_decoy_aux<(N_vaccum))begin
                                    DAC4                <= V4_vaccum;
                                    counter_decoy_aux   <= counter_decoy_aux + 32'd1;
                                end
                                else begin
                                    if(counter_decoy_aux<(N_decoy + N_vaccum))begin
                                    DAC4                <= V4_decoy;
                                    counter_decoy_aux   <= counter_decoy_aux + 32'd1;
                                    end
                                    else begin
                                        if(counter_decoy_aux<(N_decoy + N_vaccum + N_signal))begin
                                            DAC4                <= V4_signal;
                                            counter_decoy_aux   <= counter_decoy_aux + 32'd1;
                                        end
                                        else begin
                                            counter_decoy_aux   <= 32'd0;
                                        end
                                    end
                                end                               
                                
                                end
                            
                        end
                        
                        default:begin
                            DAC1            <= V1;
                            DAC2            <= V2;
                            DAC3            <= V3;
                            DAC4            <= V4;
                        end
                    endcase
                    startDAC        <= 1'b1;                    
                end
                else begin
                        startDAC        <= 1'b0;
                        if(start_medicion == 1'b0)begin
                            control             <= 9;
                            startTx             <= 1'b1;
                        end
                    end
            end
            
            5:begin
                if(delay_clk<3'd4)begin
                    delay_clk       <= delay_clk + 3'd1;
                end
                else begin
                    delay_clk       <= 3'd0;
                    control             <= 8; 
                    counter         <= 32'd0;
                    meas_monitor    <= 1'b0;
                end
                
            end
            
            8:begin
                startDAC        <= 1'b0;
                if(counter < PM_stabilization)begin
                    counter     <= counter + 32'd1;
                end
                else begin
                    counter     <= 32'd0;
                    meas_monitor    <= 1'b1;
                    en_count        <= 1'b1;
                    control         <= 2;
                end
            end
            
            2:begin
                if(counter == N_muestras)begin
                    actualizar_regsAPD  <= 1'b1;
                    counter             <= 32'd0;
                    sclr                <= 1'b1;
                    en_count            <= 1'b0;
                    control             <= 6;
                    delay_clk           <= 3'd0;
                    case(modo_medicion)
                        3:begin//fijo
                            if(enablePM[0])
                                DAC1            <= V1;
                            if(enablePM[1])
                                DAC2            <= V2;
                            if(enablePM[2])
                                DAC3            <= V3;
                            if(enablePM[3])
                                DAC4            <= V4;
                        end
                        default:begin//cero
                            DAC1              <= V0_1;
                            DAC2              <= V0_2;
                            DAC3              <= V0_3;
                            DAC4              <= V0_4;
                        end
                    endcase
                    Vout1             <= DAC1;
                    Vout2             <= DAC2;
                    Vout3             <= DAC3;
                    Vout4             <= DAC4;
                    startDAC          <= 1'b1;
                    meas_monitor        <= 1'b0;
                end
                else begin
                    if(start_medicion == 1'b0)begin
                        control             <= 9;
                        startTx             <= 1'b1;
                    end
                    else begin
                        startDAC        <= 1'b0;
                        counter         <= counter +32'd1;
                    end
                    
                end
            end
            
            6:begin
                actualizar_regsAPD      <= 1'b0;
                    sclr                <= 1'b0;
                if(delay_clk<3'd4)begin
                    delay_clk       <= delay_clk + 3'd1;
                end
                else begin
                    delay_clk       <= 3'd0;
                    control             <= 3; 
                end
            end
            
            3:begin
                actualizar_regsAPD      <= 1'b0;
                sclr                    <= 1'b0;
                startDAC                <= 1'b0;
                if(~start_medicion || (counter_medidas_max == counter_medidas))begin
                    control             <= 9;
                    startTx             <= 1'b1;
                end
                else begin
                    control             <= 4; 
                    delay_clk           <= 3'd0;
                    startTx             <= 1'b1;
                    counter_medidas     <= counter_medidas + 16'd1;
                    if((V1_rampa + pasos_rampa)<VRampa_F_1)
                        V1_rampa            <= V1_rampa + pasos_rampa;
                    else
                        V1_rampa            <= VRampa_0_1;
                    if((V2_rampa + pasos_rampa)<VRampa_F_2)
                        V2_rampa            <= V2_rampa + pasos_rampa;
                    else
                        V2_rampa            <= VRampa_0_2;
                    if((V3_rampa + pasos_rampa)<VRampa_F_3)
                        V3_rampa            <= V3_rampa + pasos_rampa;
                    else
                        V3_rampa            <= VRampa_0_3;
                    if((V4_rampa + pasos_rampa)<VRampa_F_4)
                        V4_rampa            <= V4_rampa + pasos_rampa;
                    else
                        V4_rampa            <= VRampa_0_4;
                end
            end
            
            4:begin
                if(delay_clk<3'd4)begin
                    delay_clk       <= delay_clk + 3'd1;
                end
                else begin
                    delay_clk       <= 3'd0;
                    control             <= 7; 
                end
                
            end
            
            7:begin
                startTx                     <= 1'b0;
                if(ReadyTx)begin
                    control             <= 19; 
                end
            end
            
            10:begin
                if(counter<PM_stabilization)begin
                    counter     <= counter + 32'd1;
                end
                else begin
                    counter             <= 32'd0;
                    control             <= 1; 
                end
            end
            
            
            
            9:begin
                if(delay_clk<3'd4)begin
                    delay_clk       <= delay_clk + 3'd1;
                end
                else begin
                    delay_clk       <= 3'd0;
                    startTx             <= 1'b0;
                    control         <= 17;
                end
                
            end
            
            
            
            11:begin
                sclr            <= 1'b0;
                startDAC        <= 1'b0;
                if(os_signal_alignment)begin
                    en_count        <= 1'b1;
                    counter         <= 32'd0;
                    meas_monitor    <= 1'b1;
                    control         <= 12;
                end
                else begin
                    if(align_button == 1'b0)begin
                            control             <= 9;
                        startTx             <= 1'b1;
                    end
                end
            end
            
            12:begin
                if(counter == N_muestras)begin
                    actualizar_regsAPD  <= 1'b1;
                    sclr                <= 1'b1;
                    counter             <= 32'd0;
                    en_count            <= 1'b0;
                    control             <= 13;
                    delay_clk           <= 3'd0;
                    Vout1             <= DAC1;
                    Vout2             <= DAC2;
                    Vout3             <= DAC3;
                    Vout4             <= DAC4;
                    meas_monitor        <= 1'b0;
                end
                else begin
                    if(align_button == 1'b0)begin
                        control             <= 9;
                        startTx             <= 1'b1;
                    end
                    else begin
                        counter         <= counter +32'd1;
                    end
                    
                end
            end
            
            13:begin
                actualizar_regsAPD      <= 1'b0;
                sclr                <= 1'b0;
                if(delay_clk<3'd4)begin
                    delay_clk       <= delay_clk + 3'd1;
                end
                else begin
                    delay_clk       <= 3'd0;
                    control             <= 14; 
                end
            end
            
            14:begin
                actualizar_regsAPD      <= 1'b0;
                sclr                    <= 1'b0;
                startDAC                <= 1'b0;
                if(align_button == 1'b0)begin
                    control             <= 9;
                    startTx             <= 1'b1;
                end
                else begin
                    control             <= 15; 
                    delay_clk           <= 3'd0;
                    startTx             <= 1'b1;
                    counter_medidas     <= counter_medidas + 16'd1;
                end
            end
            
            15:begin
                if(delay_clk<3'd4)begin
                    delay_clk       <= delay_clk + 3'd1;
                end
                else begin
                    delay_clk       <= 3'd0;
                    control             <= 16; 
                end
                
            end
            
            16:begin
                startTx                     <= 1'b0;
                if(ReadyTx)begin
                    control             <= 11; 
                end
            end
            
            17:begin
                if(ReadyTx)begin
                        control             <= 18; 
                end
            end 
            
            18:begin
                if(acknowledged)begin
                        control             <= 0; 
                end
            end
            
            19:begin
                if(acknowledged)begin
                        control             <= 10; 
                end
            end

            

            
        endcase
    end
    
    
endmodule