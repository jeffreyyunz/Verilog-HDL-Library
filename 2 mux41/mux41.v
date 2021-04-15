`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : mux41.v
//  Created On    : 2021-04-13
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : a 4 to 1 multiplexer 
//  Modification  :
//
//==================================================================================================
module MUX41(
	// INPUTS
		A,  // port A
		B,  // port B
		C,  // port C
		D,  // port D
		Sel,  // select control
	// OUTPUTS
		Mux_out // multiplexer out
);

	input          A;
	input          B;
	input          C;
	input          D;
  	input  [1:0]   Sel;
    
	output Mux_out;
	
	reg Mux_out;

	// Multiplexor using a case statement	
	always@(A or B or C or D or Sel)
    begin
        case (Sel)
            2'b00 : Mux_out = A;
            2'b01 : Mux_out = B;
            2'b10 : Mux_out = D;
            default : Mux_out = D;
        endcase
    end
    
endmodule
