`timescale 1ns / 1ps
`define     Clock      20 // clock cycle
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/19 14:38:46
// Design Name: 
// Module Name: SEQDET_FSM_tb
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


module SEQDET_FSM_tb;
//--------------------< Port Name >------------------------------------------
    // INPUTS
    reg            Clk;
    reg            rst_n;
    reg            x;
    
    // OUTPUTS
    wire           y;
    
    
    reg [23:0] data;    
// ----------------------------------------------------------------------
// --  Instantiate the Unit Under Test (UUT)
// ----------------------------------------------------------------------
    SEQDET_FSM SEQDET_FSM_inst (
    .Clk        (Clk     ),
    .rst_n      (rst_n   ),
    .x          (data[23]),
    .y          (y       )
    );  
    
// ----------------------------------------------------------------------
// --  Clock signal and reset signal                            
// ----------------------------------------------------------------------
    initial begin
        Clk = 1;
        forever
        #(`Clock/2) Clk = ~Clk;
    end

    initial begin
        rst_n = 0; #(`Clock*10+1);
        rst_n = 1;
    end
      
// ----------------------------------------------------------------------
// --   Design input signal
// ----------------------------------------------------------------------
    initial begin
        #1;
        x = 0;         // input initial
        #(`Clock*10); 
    // test1--------------------------
        #1000; 
        $stop;
    end
    
    always @ (posedge Clk) // ÒÆÎ»Êä³öÂëÁ÷
    begin    
        if(!rst_n)
            data='b1100_1101_0001_0010_0100;
        else
            data={data[22:0],data[23]};
    end

endmodule
