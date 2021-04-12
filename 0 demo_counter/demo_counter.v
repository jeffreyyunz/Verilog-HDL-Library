//==================================================================================================
//  Filename      : demo_counter.v
//  Created On    : 2021-03-23 
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : Language specification template
//  Modification  ：
//
//==================================================================================================
module DEMO_COUNTER(
	// INPUTS
		Clk,  //posedge active
		rst_n,//active low
		En,   //active high
	// OUTPUTS
		Count
);
	parameter WIDTH = 8;
	parameter COUNT_MAX = 8'b0000_1111;	// real_value = 15
	
	input Clk;
	input rst_n;
	input En;

	output reg [WIDTH-1:0]	Count;

	// Count from 0 to 15
	always @(posedge Clk or posedge rst_n) begin
		if (!rst_n) begin
			// reset
			Count <= 8'b0;
		end
		else if (En) begin// Counter On
			if (Count == COUNT_MAX) begin//	Count to 15
				Count <= 8'b0;
			end
			else begin
				Count <= Count + 8'b1;
			end
		end
		else Count <= 8'b0;// Counter Off
	end

endmodule
