`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/13 09:16:56
// Design Name: 
// Module Name: MUX41_tb
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


module MUX41_tb(
    );
	// INPUTS
    reg             A;  // port A
    reg             B;  // port B
    reg             C;  // port C
    reg             D;  // port D
    reg    [1:0]    Sel;  // select control
    
    // OUTPUTS
    wire Mux_out; // multiplexer out
    
    // Instantiate the Unit Under Test (UUT)
    MUX41 MUX41_inst (
        .A(A),  
        .B(B),
        .C(C),
        .D(D),
        .Sel(Sel),
        .Mux_out(Mux_out)
     );
     
     initial
     begin
     // Initialize Inputs
         A = 1'b0;
         B = 1'b0;
         C = 1'b0;
         D = 1'b0;
         Sel = 2'b00;
     // Select the A port, the output should be 1.
         #100;
         A = 1'b1;
     // Select the A port, the output should be 0.
         #100;
         A = 1'b0;
         B = 1'b1;
     // Select the B port, the output should be 1.
         #100;
         Sel = 2'b01;
     // Select the D port, the output should be 0.
         #100;
         Sel = 2'b11;
     // Select the D port, the output should be 1.
         #100;
         D = 1'b1;
     // End simulation
         #1000;
         $stop;
     end
endmodule
