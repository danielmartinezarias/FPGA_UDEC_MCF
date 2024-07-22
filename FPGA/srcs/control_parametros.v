`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:32 09/21/2016 
// Design Name: 
// Module Name:    control_parametros 
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
module control_parametros(
   input clk,
	input readyRx,
	input [7:0] bufferRx,
	output reg [15:0] V1 = 16'b0111111111111111,V2 = 16'b0111111111111111,V3 = 16'b0111111111111111,V4 = 16'b0111111111111111,
	output reg [2:0] modo_medicion = 3'd0,
	output reg [3:0] enablePM = 4'b1111,
	output reg [15:0] counter_medidas_max = 16'd65535,
	output reg start_medicion = 1'b0,
	output reg [15:0] VRampa_0_1 = 16'd31265,VRampa_0_2 = 16'd31265,VRampa_0_3 = 16'd31265,VRampa_0_4 = 16'd31265,
    output reg [15:0] VRampa_F_1 = 16'd34265,VRampa_F_2 = 16'd34265,VRampa_F_3 = 16'd34265,VRampa_F_4 = 16'd34265,
    output reg [15:0] pasos_rampa = 16'd16,
    output reg [15:0] detec_counter = 16'd17,
    output reg [31:0] delay_ADP = 32'd0,
    output reg [31:0] PM_stabilization = 32'd10000000,
    output reg [7:0] dead_time_APD = 8'd10,
    output reg [31:0] N_muestras = 32'd10000000,
    output reg [15:0] V0_1=16'd31580,V0_2=16'd31550,V0_3=16'd31750,V0_4=16'd31734,
    output reg [31:0] period=32'd100000000,width=32'd100,delay_tr4 = 32'd20,width_tr4 = 32'd3,delay_tr5 = 32'd7,width_tr5 = 32'd3,width_ID220=32'd2,period_ID220=32'd200,delay_ID220=32'd0,
    output reg align_button = 1'b0,
    output reg [31:0] N_decoy = 32'd50, N_vaccum = 32'd50, N_signal = 32'd3000,
    output reg [15:0] V4_decoy = 16'b0111111111111111, V4_vaccum = 16'b0111111111111111, V4_signal = 16'b0111111111111111,
    output reg acknowledged = 1'b0
    );



OneShot o1 (
    .clk(clk), 
    .signal(readyRx), 
    .trigger(os_readyRx)
    );

reg [15:0] ctrl = 0;
reg [7:0] d1 = 0;
reg [7:0] d2 = 0;
reg [7:0] d3 = 0;
reg [7:0] d4 = 0;
reg [7:0] d5 = 0;
reg [7:0] d6 = 0;
reg [7:0] d7 = 0;
reg [7:0] d8 = 0;
reg [15:0] orden = 0;





always @(posedge clk) begin

case (ctrl)
	0: begin
		if(os_readyRx)begin
			ctrl				<= {8'd0,bufferRx};
		end
	end
	
	1: begin
		if(os_readyRx) begin
			d8				<= bufferRx;
			ctrl			<= 16'd2;
		end
	end
	
	2: begin
		if(os_readyRx) begin
			d7				<= bufferRx;
			ctrl			<= 16'd3;
		end
	end
	
	3: begin
		if(os_readyRx) begin
			d6				<= bufferRx;
			ctrl			<= 16'd4;
		end
	end
	
	4: begin
		if(os_readyRx) begin
			d5				<= bufferRx;
			ctrl			<= 16'd5;
		end
	end
	
	5: begin
		if(os_readyRx) begin
			d4				<= bufferRx;
			ctrl			<= 16'd6;
		end
	end
	
	6: begin
		if(os_readyRx)begin
			d3				<= bufferRx;
			ctrl			<= 16'd7;
		end
	end
	
	7: begin
		if(os_readyRx)begin
			d2				<= bufferRx;
			ctrl			<= 16'd8;
		end
	end
	
	8: begin
		if(os_readyRx)begin
			d1				<= bufferRx;
			ctrl			<= 16'd9;
		end
	end	
	
	9:begin 
	   if(os_readyRx)begin
			orden[15:8]		<= bufferRx;
			ctrl			<= 16'd10;
		end
	end
	
	10:begin 
	   if(os_readyRx)begin
			orden[7:0]		<= bufferRx;
			ctrl			<= 16'd11;
		end
	end
	
	11:begin 
		ctrl			<= orden;
	end
	
	
	20: begin
		V1             			<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	21: begin
		V2             			<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	22: begin
		V3             			<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	23: begin
		V4             			<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	24: begin
		modo_medicion           <= {d1[2:0]};
		ctrl					<= 16'd0;
	end
	
	25: begin
		enablePM             	<= {d1[3:0]};
		ctrl					<= 16'd0;
	end
	
	26: begin
		counter_medidas_max		<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	27: begin
		start_medicion 			<= {d1[0]};
		ctrl					<= 16'd0;
	end
	
	28: begin
		VRampa_0_1             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	29: begin
		VRampa_0_2             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	30: begin
		VRampa_0_3             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	31: begin
		VRampa_0_4             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	32: begin
		VRampa_F_1             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	33: begin
		VRampa_F_2             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	34: begin
		VRampa_F_3             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	35: begin
		VRampa_F_4             	<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	36: begin
		pasos_rampa    			<= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	37:begin
	    detec_counter    	    <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	38:begin
	    delay_ADP    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	39:begin
	    PM_stabilization    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	40:begin
	    dead_time_APD    	    <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	41:begin
	    N_muestras    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	42:begin
	    V0_1    	                <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	43:begin
	    V0_2    	                <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	44:begin
	    V0_3    	                <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	45:begin
	    V0_4    	                <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	46:begin
	    width    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	47:begin
	    period    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	48:begin
	    delay_tr4    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	49:begin
	    width_tr4    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	50:begin
	    delay_tr5    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	51:begin
	    width_tr5    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	52:begin
	    width_ID220    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	53:begin
	    period_ID220  	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	54:begin
	    delay_ID220    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	55: begin
		align_button 			<= {d1[0]};
		ctrl					<= 16'd0;
	end
	
	56:begin
	    N_decoy        	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	57:begin
	    N_vaccum    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	58:begin
	    N_signal    	        <= {d4,d3,d2,d1};
		ctrl					<= 16'd0;
	end
	
	59:begin
	    V4_decoy    	        <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	60:begin
	    V4_vaccum    	        <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	61:begin
	    V4_signal    	        <= {d2,d1};
		ctrl					<= 16'd0;
	end
	
	62:begin 
	    acknowledged    	    <= 1'b1;
		ctrl					<= 16'd63;
	end
	
	63:begin 
	    acknowledged    	    <= 1'b0;
		ctrl					<= 16'd0;
	end


	default:
		ctrl					<= 16'd0;
	
endcase
end
endmodule
