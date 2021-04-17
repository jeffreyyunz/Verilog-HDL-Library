`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 17:49:32
// Design Name: 
// Module Name: div5_tb
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

module div5_tb(
);
    // INPUTS
    reg            clk;
    reg            rst_n;
    // OUTPUTS
    wire           clk_div;
    wire           clk_pose;
    wire           clk_nege;
    wire    [2:0]  coutpose;
    wire    [2:0]  coutnege;

    // Instantiate the Unit Under Test (UUT)
    DIV5 DIV5_inst (
    .Clk(clk),
    .rst_n(rst_n),
    .clk_div(clk_div),
    .clk_pose(clk_pose),
    .clk_nege(clk_nege),
    .coutpose(coutpose),
    .coutnege(coutnege)
    );     
    
    initial begin
    // Initialize Inputs
    clk = 1'b0;
    rst_n = 1'b0;
    // Wait 100 ns for global reset to finish
    #30;
    rst_n = 1'b1;       
    #1000;
    //  $stop;
    end
    
    always #10 clk = ~ clk;   // 50MHz
    
endmodule
