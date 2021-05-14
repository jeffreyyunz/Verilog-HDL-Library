`timescale 1ns / 1ps
`define     Clock      20 // clock cycle
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/14 10:31:48
// Design Name: 
// Module Name: MULT4x4_tb
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


module MULT4x4_tb;
//--------------------< Port Name >------------------------------------------
    parameter N  = 4; // 4x4
    // INPUTS
    reg             Clk;               // posedge active
    reg             rst_n;             // negedge active
    reg   [N-1:0]   a;                 // 4 bits
    reg   [N-1:0]   b;                 // 4 bits
    // OUTPUTS        
    wire  [2*N-1:0] out;          // 8 bits
    
// ----------------------------------------------------------------------
// --  Instantiate the Unit Under Test (UUT)
// ----------------------------------------------------------------------
    MULT4x4 MULT4x4_inst (
    .Clk        (Clk      ),
    .rst_n      (rst_n    ),
    .a          (a        ),
    .b          (b        ),
    .out        (out      )
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
        reset_1;
    end
      
// ----------------------------------------------------------------------
// --   Design input signal
// ----------------------------------------------------------------------
    initial begin
        #(`Clock*1);
        a = 4'd3;         
        b = 4'd5;
        
        #(`Clock*5);   // wait 5 clocks
        a = 4'd4;         
        b = 4'd12;
        
        #(`Clock*5);
        a = 4'd5;         
        b = 4'd9;
        
        #(`Clock*5);
        a = 4'd11;         
        b = 4'd14;
        
        #(`Clock*5);
        $stop;
    end
// ----------------------------------------------------------------------
// --   task:Reset a clock 
// ----------------------------------------------------------------------
    task reset_1;                //任务定义结构开头，命名为 task_demo
        begin
            rst_n = 0; 
            #(`Clock*1);
            rst_n = 1;
        end
    endtask


endmodule