`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:29 09/05/2016 
// Design Name: 
// Module Name:    control_Tx 
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
module control_Tx(
		input clk,
		input readyTx,
		input startTx,
		input [7:0] bufferIn,
		input [9:0] lmax,
		input [7:0] PalabraCtrl,
		output reg CtrlStartTx = 0,word_sent = 0,
		output reg [9:0] index = 0,
		output reg [7:0] bufferOut = 0
    );

reg [2:0] regControl = 0;

	 OneShot o1 (
    .clk(clk), 
    .signal(readyTx), 
    .trigger(readyTx_OneShoot)
    );


always @(posedge clk) begin

case (regControl)
	
	3'd0:	begin
	   word_sent	<= 0;
		if (startTx) begin
			regControl	<= 3'd1;
			index		<= 10'd0;
		end			
	end
	
	3'd1: begin
		CtrlStartTx	<= 1;
		bufferOut	<= 8'd0;//primero envio un 0
		regControl	<= 3'd2;
		index			<= index + 10'd1;
		end
	
	3'd2: begin
		if (readyTx_OneShoot) begin
			if(index > 10'd3) begin
				regControl	<= 3'd3;
				index			<= 0;
				bufferOut	<= PalabraCtrl;//la palabra de control
			end
			else begin
			    if(index == 10'd1)
				    bufferOut	<= 10'd255;//luego 255
                if(index == 10'd2)
                    bufferOut	<= 10'd0;// otra vez 0
                if(index == 10'd3)
                    bufferOut	<= 10'd255;//otra vez 255
                    
				index			<= index + 10'd1;//subo el index
			end
		end
	end
	
	3'd3: begin
		if (readyTx_OneShoot) begin//cada vez que me llegue el readyTx guardo otro dato
			bufferOut	<= bufferIn;
			if (index <= lmax) begin
				index			<= index + 10'd1;
			end
			else begin
				regControl	<= 3'd4;
				index			<= 0;
		    end
		end
	end
	
	3'd4: begin
		if (readyTx_OneShoot) begin
            if(index == 10'd0)
                bufferOut	<= 10'd1;
            if(index == 10'd1)
                bufferOut	<= 10'd254;
            if(index == 10'd2)
                bufferOut	<= 10'd1;
            if(index == 10'd3)
                bufferOut	<= 10'd254;
            if(index > 10'd3) begin
                regControl	<= 3'd0;
                index			<= 0;
                CtrlStartTx	<= 0;
                word_sent	<= 1;
            end
		else
			index			<= index + 10'd1;
		end
	end
endcase

end

endmodule
