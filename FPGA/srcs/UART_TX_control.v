`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 12:04:16 AM
// Design Name: 
// Module Name: UART_TX_control
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


module UART_TX_control(
    input clk,
    input tick, 
    output pin_Tx,
    input [15:0] counter_medidas,
    input [31:0] APD0,APD1,APD2,APD3,APD4,APD5,APD6,
    input [15:0] Vout1,Vout2,Vout3,Vout4,
    input startTx_main,
    
    output reg ReadyTx = 1'b0
    );
    
    
	
	
    
    reg [3:0] state = 4'd0;


    
    /////
    wire [7:0] bufferTx,bufferTx16,bufferTx32;
	wire [9:0] indexMem,indexMem16,indexMem32;
	wire startTx;
//	wire [9:0] lmax;
	reg [7:0] palabra_ctrl;
	reg [15:0] data16bit;
	reg [31:0] data32bit;
	reg resetTx16 = 1'b0;
	reg resetTx32 = 1'b0;
	reg selector16_32 = 1'b1;
	reg startTx16 =1'b0;
	reg startTx32 =1'b0;
	reg StartCode16 = 1'b0;
	reg StartCode32 = 1'b0;
    



	//convierte numeros de 16 bits a dos de 8 bits para enviarlos via serial
dcode16to8 dcode16to8_1 (
    .clk(clk), 
    .datain(data16bit), 
    .startCode(StartCode16), 
    .reset(resetTx16), 
    .indexTx(indexMem16), 
    .dataout(bufferTx16), 
    .weTx(Write_En_Tx16), 
    .ControlMemTx(ControlMemTx16), 
    .CodeRady(readyCode16)
    );


dcode32to8 dcode32to8_1 (
    .clk(clk), 
    .datain(data32bit), 
    .startCode(StartCode32), 
    .reset(resetTx32), 
    .indexTx(indexMem32), 
    .dataout(bufferTx32), 
    .weTx(Write_En_Tx32), 
    .ControlMemTx(ControlMemTx32), 
    .CodeRady(readyCode32)
    );


assign startTx = (selector16_32)?startTx16:startTx32;
assign indexMem = (selector16_32)?indexMem16:indexMem32;
assign bufferTx = (selector16_32)?bufferTx16:bufferTx32;
assign Write_En_Tx = (selector16_32)?Write_En_Tx16:Write_En_Tx32;
assign ControlMemTx = (selector16_32)?ControlMemTx16:ControlMemTx32;
    
    modulo_Tx modulo_Tx_1(
		.clk(clk),
		.tick(tick),
		.bufferTx(bufferTx),
		.index_write(indexMem),
		.lmax(indexMem),
		.PalabraCtrl(palabra_ctrl),
		.enable_write(Write_En_Tx),
		.control_write(ControlMemTx),
		.StartTx(startTx),
		.pin_Tx(pin_Tx),
		.word_sent(word_sent)
    );
    
    always@(posedge clk)begin
        case(state)
            0:begin
                    resetTx16       <= 0;
                    resetTx32       <= 0;
                    ReadyTx         <=0;
                if(startTx_main)begin
                    selector16_32 <=1;
                    data16bit       <= counter_medidas;
                    StartCode16     <= 1'b1;
                    state           <= 1;
                end
            end
            
            1:begin
                if(readyCode16)begin
                    data16bit       <= Vout1;
                    StartCode16     <= 1'b1;
                    state           <= 2;
                end
                else begin
                    StartCode16     <= 1'b0;
                end
            end
            
            2:begin
                if(readyCode16)begin
                    data16bit       <= Vout2;
                    StartCode16     <= 1'b1;
                    state           <= 3;
                end
                else begin
                    StartCode16     <= 1'b0;
                end
            end
            
            3:begin
                if(readyCode16)begin
                    data16bit       <= Vout3;
                    StartCode16     <= 1'b1;
                    state           <= 4;
                end
                else begin
                    StartCode16     <= 1'b0;
                end
            end
            
            4:begin
                if(readyCode16)begin
                    data16bit       <= Vout4;
                    StartCode16     <= 1'b1;
                    state           <= 5;
                end
                else begin
                    StartCode16     <= 1'b0;
                end
            end
            
            5:begin
                if(readyCode16)begin
                    startTx16   <= 1'd1;
                    palabra_ctrl <= 8'd16;
//                    resetTx16       <= 1;
//                    resetTx32       <= 1;
                    state       <= 6;
                end
                else begin
                    StartCode16     <= 1'b0;
                end
            end
            
            6:begin
                if(word_sent)begin
                    selector16_32 <=0;
                    data32bit       <= APD0;
                    StartCode32     <= 1'b1;
                    state           <= 7;
                end
                else begin
//                    resetTx16       <= 0;
//                    resetTx32       <= 0;
                    startTx16   <= 1'd0;
                end
            end
            
            
            7:begin
                if(readyCode32)begin
                    data32bit       <= APD1;
                    StartCode32     <= 1'b1;
                    state           <= 8;
                end
                else begin
                    StartCode32     <= 1'b0;
                end
            end
            
            8:begin
                if(readyCode32)begin
                    data32bit       <= APD2;
                    StartCode32     <= 1'b1;
                    state           <= 9;
                end
                else begin
                    StartCode32     <= 1'b0;
                end
            end
            
            9:begin
                if(readyCode32)begin
                    data32bit       <= APD3;
                    StartCode32     <= 1'b1;
                    state           <= 10;
                end
                else begin
                    StartCode32     <= 1'b0;
                end
            end
            
            10:begin
                if(readyCode32)begin
                    data32bit       <= APD4;
                    StartCode32     <= 1'b1;
                    state           <= 11;
                end
                else begin
                    StartCode32     <= 1'b0;
                end
            end
            
            11:begin
                if(readyCode32)begin
                    data32bit       <= APD5;
                    StartCode32     <= 1'b1;
                    state           <= 12;
                end
                else begin
                    StartCode32     <= 1'b0;
                end
            end
            
            12:begin
                if(readyCode32)begin
                    data32bit       <= APD6;
                    StartCode32     <= 1'b1;
                    state           <= 13;
                end
                else begin
                    StartCode32     <= 1'b0;
                end
            end
            
            13:begin
                if(readyCode32)begin
                    startTx32   <= 1'd1;
                    palabra_ctrl<=8'd34;
                    state       <= 14;
                end
                else begin
                    StartCode32     <= 1'b0;
                end
            end
            
            
            14:begin
                if(word_sent)begin
                    selector16_32 <=1;
                    ReadyTx       <=1;
                    resetTx16   <= 1;
                    resetTx32   <= 1;
                    state           <= 0;
                end
                else begin
                    startTx32   <= 1'd0;
                end
            end

            
        endcase
    end
    
endmodule
