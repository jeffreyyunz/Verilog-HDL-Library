//==================================================================================================
//  Filename      : fulladder.v
//  Created On    : 2021-04-12 
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : a one-bit full adder
//  Modification  ：
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
