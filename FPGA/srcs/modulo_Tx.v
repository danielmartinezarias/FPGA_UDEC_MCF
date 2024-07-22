`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:01:37 09/05/2016 
// Design Name: 
// Module Name:    modulo_Tx 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module modulo_Tx(
		input clk,
		input tick,
		input [7:0] bufferTx,
		input [9:0] index_write,
		input [9:0] lmax,
		input [7:0] PalabraCtrl,
		input enable_write,
		input control_write,
		input StartTx,
		output pin_Tx,word_sent
    );


wire [9:0] index;
wire [9:0] indexMem;
wire [7:0] bufferTx_out;
wire [7:0] bufferMem;

assign indexMem = (control_write) ? index_write:index;

MemTx_8x1024 MemTx_1 (
  .clka(clk),    // input wire clka
  .wea(enable_write),      // input wire [0 : 0] wea
  .addra(indexMem),  // input wire [9 : 0] addra
  .dina(bufferTx),    // input wire [7 : 0] dina
  .douta(bufferMem)  // output wire [7 : 0] douta
);


control_Tx control_Tx_1 (
    .clk(clk), 
    .readyTx(readyTx), 
    .startTx(StartTx), 
    .bufferIn(bufferMem),
	 .lmax(lmax), 
    .PalabraCtrl(PalabraCtrl), 	 
    .CtrlStartTx(CtrlStartTx), 
	 .word_sent(word_sent),
    .index(index), 
    .bufferOut(bufferTx_out)
    );



UART_Tx UART_Tx_1 (
    .clk(clk), 
    .tick(tick), 
    .StartTx(CtrlStartTx), 
    .BufferTx(bufferTx_out),
	 .readyTx(readyTx), 
    .PinTx(pin_Tx)
    );
	 
endmodule
