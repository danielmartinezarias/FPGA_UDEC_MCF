`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:29 05/25/2018 
// Design Name: 
// Module Name:    PreProc_Cs 
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
module PreProc_Cs(
input clk,
input  [5:0]EXPIO_P_APD,
output  [5:0]Cs,
input [7:0] dead_time_APD
);
SimpleOneShot o1[5:0]  (
    .clock(clk), 
    .in(EXPIO_P_APD[5:0]), 
    .out(Cs[5:0]),
    .dead_time_APD(dead_time_APD)
    );
endmodule
