`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2021 11:24:34 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input [1:0] trigger_in_PIN,
    output [1:0] trigger_out_PIN,
    input [6:0] EXPIO_P_APD,
    input UART_TXD_IN,
    output UART_RXD_OUT,
    //DAC analog devices AD5764
    output SYNC_DAC,DIN,LDAC,CLK_DAC
    );
    
    
    

    //definiciones   
    ///UART
    wire [7:0] bufferRx;
    wire tick, ReadyRx;
    //PARAMETROS
    wire [15:0] V1,V2,V3,V4;
//    wire [7:0] rd_data,wr_data,bufferRx;
    wire [2:0] modo_medicion;
    wire [3:0] enablePM;
    wire [15:0] counter_medidas;
    wire [15:0] counter_medidas_max;
    wire start_medicion;
    wire startTx;
    wire startDAC;
    wire [15:0] DAC1,DAC2,DAC3,DAC4;
    wire [15:0] Vout1,Vout2,Vout3,Vout4;
    wire [15:0] VRampa_0_1,VRampa_0_2,VRampa_0_3,VRampa_0_4;
    wire [15:0] VRampa_F_1,VRampa_F_2,VRampa_F_3,VRampa_F_4;
    wire [15:0] pasos_rampa;
    wire [31:0] APD0,APD1,APD2,APD3,APD4,APD5,APD6,APD_sum;
    wire [15:0] detec_counter;
    wire [31:0] delay_ADP;
    wire [31:0] PM_stabilization;
    wire [31:0] N_muestras;
    wire [7:0] dead_time_APD;
    wire [15:0] V0_1,V0_2,V0_3,V0_4;
    wire [31:0] width,period,delay_tr4,width_tr4,delay_tr5,width_tr5;
    wire [31:0] width_ID220,period_ID220,delay_ID220;
    wire [31:0] N_decoy, N_vaccum, N_signal;
    wire [15:0] V4_decoy, V4_vaccum, V4_signal;
    
    ///////////
    assign APD_sum = APD0+APD1+APD2+APD3+APD4+APD5+APD6;

    
    
    ///////////////////////////////////
    ////// asignaciones a puertos//////
    ///////////////////////////////////
    
    
//    assign pmodDA2_1[3] = clk25MHz ;
//    assign pmodDA2_1[2] = DINB_1;
//    assign pmodDA2_1[1] = DINA_1;
//    assign pmodDA2_1[0] = CS_1;
    
//    assign pmodDA2_2[3] = clk25MHz ;
//    assign pmodDA2_2[2] = DINB_2;
//    assign pmodDA2_2[1] = DINA_2;
//    assign pmodDA2_2[0] = CS_2;
    
    assign CLK_DAC = clk25MHz;
//    assign Trigger_in_APD = signal_2MHz;
//    assign Trigger_APD_4 = Trigger_APD_4_reg;
//    assign Trigger_APD_5 = Trigger_APD_5_reg;
    assign trigger_out_PIN[0] = meas_monitor;
    assign trigger_out_PIN[1] = gate_ID220;

    
    //CLOCK
    clk_wiz_0 CLOCK_MASTER   (
        // Clock out ports
        .clk_out1(clk100MHz),     // output clk_out1
        .clk_out2(clk400MHz),     // output clk_out2
        .clk_out3(clk25MHz),     // output clk_out3
       // Clock in ports
        .clk_in1(clk))// input clk_in1
    ;     
    
    
//    pulse_gen pulse_gen_signal_2MHz(
//        .clk(clk100MHz),
//        .width(width),
//        .period(period),
//        .pulse(signal_2MHz)
//    );
    
    pulse_gen pulse_gen_signal_alignment(
        .clk(clk100MHz),
        .width(width),
        .period(period),
        .pulse(signal_alignment)
    );
    
//    trigger_ADP_with_delay trigger_ADP_with_delay_4 (
//    .clk(clk100MHz),
//    .trigger_IN(Trigger_in_APD),
//    .signal_out(Trigger_APD_4_reg),
//    .gate_A(gate_4),
//    .gate_B(gate_5),
//    .delay(delay_tr4),
//    .width(width_tr4)
//    );
    
//    trigger_ADP_with_delay trigger_ADP_with_delay_5 (
//    .clk(clk100MHz),
//    .trigger_IN(Trigger_in_APD),
//    .signal_out(Trigger_APD_5_reg),
//    .gate_A(gate_6),
//    .gate_B(gate_7),
//    .delay(delay_tr5),
//    .width(width_tr5)
//    );

//    ONE_MHz_signal ONE_MHz_signal_100ms(
//        .clk(clk100MHz),
//        .width(32'd1000000),
//        .ONE_MHz_signal(signal_100ms)
//    );
    
//    ONE_MHz_signal ONE_MHz_signal_20ns(
//    .clk(clk100MHz),
//    .width(16'd1),
//    .ONE_MHz_signal(signal_20ns)
//    ); 
    
//     simula_APD simula_APD0(
//        .clk(clk100MHz),
//        .detec_counter(detec_counter),
//        .delay(delay_ADP),
//        .trigger(signal_100ms),
//        .signal(APD0_pin)
//    );
    
//    simula_APD simula_APD1(
//        .clk(clk100MHz),
//        .detec_counter(detec_counter),
//        .delay(delay_ADP+32'd1000),
//        .trigger(signal_100ms),
//        .signal(APD1_pin)
//    );
    
//    simula_APD simula_APD2(
//        .clk(clk100MHz),
//        .detec_counter(detec_counter),
//        .delay(delay_ADP+32'd2000),
//        .trigger(signal_100ms),
//        .signal(APD2_pin)
//    );
    
//    simula_APD simula_APD3(
//        .clk(clk100MHz),
//        .detec_counter(detec_counter),
//        .delay(delay_ADP+32'd3000),
//        .trigger(signal_100ms),
//        .signal(APD3_pin)
//    );
    
    AccCuentas Acc011 (
        .clk(clk100MHz), 
        .clk400MHz(clk400MHz),
        .sclr(sclrAcc), 
        .En(EnAcc), 
        .EnACCCtrl(EnACCCtrl),
//        .EXPIO_P_APD({signal_20ns,signal_20ns,signal_20ns,signal_20ns} ), 
        .EXPIO_P_APD(EXPIO_P_APD ), 
//        .EXPIO_P_APD({APD3_pin,APD2_pin,APD1_pin,APD0_pin} ),
        .APD0(APD0), 
        .APD1(APD1), 
        .APD2(APD2), 
        .APD3(APD3),
        .APD4(APD4), 
        .APD5(APD5),
        .APD6(APD6), 
        .dead_time_APD(dead_time_APD),
//        .Trigger_in_APD(Trigger_in_APD),
//        .gate_4(gate_4),
//        .gate_5(gate_5),
//        .gate_6(gate_6),
//        .gate_7(gate_7)
        .width_ID220(width_ID220),
        .delay_ID220(delay_ID220),
        .trigger_in_APD(trigger_in_PIN[1]),
        .gate_ID220(gate_ID220)
    );
    
    
    
    //Modulo de asignacion de valores
    control_parametros control_parametros_1(
        .clk(clk100MHz),
//        .clk(clk50MHz),//no recuerdo porque lo tenia a 50 MHz
        .readyRx(ReadyRx),
        .bufferRx(bufferRx),
        .V1(V1), 
        .V2(V2),
        .V3(V3),
        .V4(V4),
        .modo_medicion(modo_medicion),
        .enablePM(enablePM),
        .counter_medidas_max(counter_medidas_max),
        .start_medicion(start_medicion),
        .VRampa_0_1(VRampa_0_1),
        .VRampa_0_2(VRampa_0_2),
        .VRampa_0_3(VRampa_0_3),
        .VRampa_0_4(VRampa_0_4),
        .VRampa_F_1(VRampa_F_1),
        .VRampa_F_2(VRampa_F_2),
        .VRampa_F_3(VRampa_F_3),
        .VRampa_F_4(VRampa_F_4),
        .pasos_rampa(pasos_rampa),
        .detec_counter(detec_counter),
        .delay_ADP(delay_ADP),
        .PM_stabilization(PM_stabilization),
        .dead_time_APD(dead_time_APD),
        .N_muestras(N_muestras),
        .V0_1(V0_1),
        .V0_2(V0_2),
        .V0_3(V0_3),
        .V0_4(V0_4),
        .width(width),
        .period(period),
        .delay_tr4(delay_tr4),
        .width_tr4(width_tr4),
        .delay_tr5(delay_tr5),
        .width_tr5(width_tr5),
        .width_ID220(width_ID220),
        .period_ID220(period_ID220),
        .delay_ID220(delay_ID220),
        .align_button(align_button),
        .N_decoy(N_decoy), 
        .N_vaccum(N_vaccum), 
        .N_signal(N_signal),
        .V4_decoy(V4_decoy), 
        .V4_vaccum(V4_vaccum), 
        .V4_signal(V4_signal),
        .acknowledged(acknowledged)
        
    );    
    
    
    
    
    controlPhase_Trigger controlPhase_Trigger1(
        .clk(clk100MHz),
//        .trigger_pin(signal_2Hz),

        .trigger_pin(trigger_in_PIN[0]),
        .sclr(sclrAcc),
        .en_count(EnAcc),
        .actualizar_regsAPD(EnACCCtrl),
        .modo_medicion(modo_medicion),
        .enablePM(enablePM),
        .counter_medidas(counter_medidas),
        .counter_medidas_max(counter_medidas_max),
        .start_medicion(start_medicion),
        .startTx(startTx),
        .startDAC(startDAC),
        .DAC1(DAC1),
        .DAC2(DAC2),
        .DAC3(DAC3),
        .DAC4(DAC4),
        .Vout1(Vout1),
        .Vout2(Vout2),
        .Vout3(Vout3),
        .Vout4(Vout4),
        .V1(V1), 
        .V2(V2),
        .V3(V3),
        .V4(V4),
        .V0_1(V0_1),
        .V0_2(V0_2),
        .V0_3(V0_3),
        .V0_4(V0_4),
        .VRampa_0_1(VRampa_0_1),
        .VRampa_0_2(VRampa_0_2),
        .VRampa_0_3(VRampa_0_3),
        .VRampa_0_4(VRampa_0_4),
        .VRampa_F_1(VRampa_F_1),
        .VRampa_F_2(VRampa_F_2),
        .VRampa_F_3(VRampa_F_3),
        .VRampa_F_4(VRampa_F_4),
        .pasos_rampa(pasos_rampa),
        .ReadyTx(ReadyTx),
        .PM_stabilization(PM_stabilization),
        .meas_monitor(meas_monitor),
        .N_muestras(N_muestras),
        .align_button(align_button),
        .signal_alignment(signal_alignment),
        .N_decoy(N_decoy), 
        .N_vaccum(N_vaccum), 
        .N_signal(N_signal),
        .V4_decoy(V4_decoy), 
        .V4_vaccum(V4_vaccum), 
        .V4_signal(V4_signal),
        .APD_sum(APD_sum),
        .acknowledged(acknowledged)
    );
    
//    UART_FIFO_TX_control UART_FIFO_TX_control_1(
//        .clk(clk50MHz),
//        .counter_medidas(counter_medidas),
//        .APD0(APD0), 
//        .APD1(APD1), 
//        .APD2(APD2), 
//        .APD3(APD3),
//        .APD4(APD4),
//        .APD5(APD5),
//        .APD6(APD6), 
//        .Vout1(Vout1),
//        .Vout2(Vout2),
//        .Vout3(Vout3),
//        .Vout4(Vout4),
//        .startTx(startTx),
//        .wr_en(wr_en),
//        .wr_data(wr_data),
//        .wr_full(wr_full),
//        .ReadyTx(ReadyTx)
//    );
    
    //DAC control - AD5764
    DAC_control DAC_control_1(
        .clk(clk25MHz), 
        .enable(1'b1), 
        .start(startDAC),
        .data_in_A(DAC1), 
        .data_in_B(DAC2),
        .data_in_C(DAC3),
        .data_in_D(DAC4),
        .CS(SYNC_DAC),
        .LDAC(LDAC),
        .DIN(DIN)
    );
//    ////////////////////////
//    //instnciamos los PMOD//
//    ////////////////////////

    
//    pmodDA2 pmodDA2_1_inst(
//        .clk(clk25MHz),
//        .enable(1'b1),
//        .data_in_A(T_1),
//        .data_in_B(T_2),
//        .CS(CS_1),
//        .DIN_A(DINA_1),
//        .DIN_B(DINB_1)
//    );
    
//    pmodDA2 pmodDA2_2_inst(
//        .clk(clk25MHz),
//        .enable(1'b1),
//        .data_in_A(T_3),
//        .data_in_B(T_4),
//        .CS(CS_2),
//        .DIN_A(DINA_2),
//        .DIN_B(DINB_2)
//    );
    
//    //comunicacion UART
//    UART_FIFO_RX_control UART_FIFO_RX_control_1(
//        .clk(clk50MHz),
//        .rd_en(rd_en),
//        .rd_data(rd_data),
//        .rd_empty(rd_empty),
//        .bufferRx(bufferRx),
//        .ReadyRx(ReadyRx)
//    );
    
    
//    ft245_async_fifo #(.read_depth(4), .write_depth(7), .same_clocks(1)) ft245_async_fifo_1 (
//		.D(data),
//		.RXFn(rxf),
//		.TXEn(txe),
//		.RDn(rd),
//		.WRn(wr),
//		.clk_50mhz(clk50MHz),
//        .rw_clk(clk50MHz),
//		.rd_en(rd_en),
//		.rd_data(rd_data),
//		.rd_empty(rd_empty),
//		.wr_en(wr_en),
//		.wr_data(wr_data),
//		.wr_full(wr_full)
//	);
    
    
    
    //Comunicacion UART
    tick_generator tick_generator_1(
	.clk(clk100MHz),
	.tick(tick)
    );
        
    UART_Rx UART_Rx_1(
	.clk(clk100MHz),
	.tick(tick),
	.PinRx(UART_TXD_IN),
	.bufferRx(bufferRx),
	.ReadyRx(ReadyRx)
    );
    
    UART_TX_control UART_TX_control_1(
        .clk(clk100MHz),
        .tick(tick),
        .pin_Tx(UART_RXD_OUT),
        .counter_medidas(counter_medidas),
        .APD0(APD0), 
        .APD1(APD1), 
        .APD2(APD2), 
        .APD3(APD3),
        .APD4(APD4),
        .APD5(APD5),
        .APD6(APD6), 
        .Vout1(Vout1),
        .Vout2(Vout2),
        .Vout3(Vout3),
        .Vout4(Vout4),
        .startTx_main(startTx),
        .ReadyTx(ReadyTx)
    );
    
    


endmodule
