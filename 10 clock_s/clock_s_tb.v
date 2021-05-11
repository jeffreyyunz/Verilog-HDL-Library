`timescale 1ns / 1ps
`define     Clock      20 // clock cycle
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/11 11:14:16
// Design Name: 
// Module Name: CLOCK_S_tb
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


module CLOCK_S_tb;
//--------------------< Port Name >------------------------------------------
    parameter SECONDS  = 32'd32767;
    // INPUTS
    reg            Clk;
    reg            rst_n;
    reg            start;
    reg    [7:0]   alarm;
    
    // OUTPUTS
    wire           pluse;
     
// ----------------------------------------------------------------------
// --  Instantiate the Unit Under Test (UUT)
// ----------------------------------------------------------------------
    CLOCK_S CLOCK_S_inst (
    .Clk        (Clk      ),
    .rst_n      (rst_n    ),
    .start      (start    ),
    .alarm      (alarm    ),
    .pluse      (pluse    )
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
        start = 1'b0;         
        alarm = 7'd0;
        
        #(`Clock*10);   // count to 5
        start = 1'b1;  
        alarm = 7'd5;
        #(`Clock*1);
        start = 1'b0; 
        
        #(`Clock*(SECONDS*(alarm+1)));
        reset_1;
        
        #(`Clock*10);
        start = 1'b1;  
        alarm = 7'd25;   // count to 25
        #(`Clock*1);
        start = 1'b0;
        
        #(`Clock*(SECONDS*(alarm+1)));
        reset_1;
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