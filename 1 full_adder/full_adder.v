//==================================================================================================
//  Filename      : fulladder.v
//  Created On    : 2021-04-12 09:16:38
//  Last Modified : 2021-04-12 09:57:56
//  Revision      : 
//  Author        : Rongye
//
//  Description   : a one-bit full adder
//
//
//==================================================================================================
module FULL_ADDER(
	//INPUTS
		Ain,  //port A
		Bin,  //port B
		Cin,  //carry in
	//OUTPUTS
		Cout, //carry out
		Sum	  //Sum
);

	input Ain;
	input Bin;
	input Cin;

	output Cout;
	output Sum;
	//Draw a Karnaugh map to simplify the expression	
	assign Sum = Ain^Bin^Cin;
	assign Cout = (Ain & Bin) | (Bin & Cin) | (Ain & Cin);
	
endmodule