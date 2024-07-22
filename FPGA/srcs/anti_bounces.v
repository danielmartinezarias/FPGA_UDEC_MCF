`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:14 04/13/2017 
// Design Name: 
// Module Name:    anti_bounces 
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
module anti_bounces(
	input clk,
	input signal,
	output reg trigger = 0
    );
	 
	 reg [1:0] monitor = 0;
	 reg [14:0] ancho = 15'd0;
	 reg control = 0;

	always @(posedge clk) begin

		case(control)
		
		0: begin
			monitor  <= {monitor[0],signal};
			if (monitor  == 2'b01)begin
				trigger 	   <= 1'b1;
				monitor     <= 2'd0;
				control		<= 1'b1;
			end
				
			else
				trigger 	  <= 1'b0;
		end
		
		1: begin
			
			if(ancho<15'd100)begin
				ancho		<= ancho + 15'd1;
			end
			else begin
			 trigger 	  	<= 1'b0;
				control		<= 1'b0;
				ancho <= 15'd0;
			end
			
		end
		
		endcase
		
		
	end
	 
	 


endmodule 