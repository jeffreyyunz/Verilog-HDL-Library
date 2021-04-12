`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 10:02:30
// Design Name: 
// Module Name: full_adder_tb
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

module full_adder_tb;

// Inputs
reg Ain;
reg Bin;
reg Cin;

// Outputs
wire  Sum;
wire  Cout;

// Instantiate the Unit Under Test (UUT)
FULL_ADDER FULL_ADDER_inst (
    .Ain(Ain),  
    .Bin(Bin),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
 );

 
initial
begin
// Initialize Inputs
    Ain = 0;
    Bin = 0;
    Cin = 0;
    #100;
    Ain = 0;
    Bin = 0;
    Cin = 1;
    #100;
    Ain = 0;
    Bin = 1;
    Cin = 0;
    #100;
    Ain = 1;
    Bin = 0;
    Cin = 0;
    #100;
    Ain = 1;
    Bin = 1;
    Cin = 0; 
    #100;
    Ain = 1;
    Bin = 1;
    Cin = 1;   
    #1000;
    $stop;
end

////Create clock
//always #10 Clk = ~ Clk; //50M

endmodule
