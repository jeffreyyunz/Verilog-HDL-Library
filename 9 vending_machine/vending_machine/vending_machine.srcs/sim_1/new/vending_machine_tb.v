`timescale 1ns / 1ps
`define     Clock      20 // clock cycle
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 10:05:45
// Design Name: 
// Module Name: VENDING_MACHINE_tb
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


module VENDING_MACHINE_tb;
//--------------------< Port Name >------------------------------------------
    // INPUTS
    reg            Clk;
    reg            rst_n;
    reg    [2:0]   money_in;
    
    // OUTPUTS
    wire   [1:0]   change;
    wire           goods_out;
     
// ----------------------------------------------------------------------
// --  Instantiate the Unit Under Test (UUT)
// ----------------------------------------------------------------------
    VENDING_MACHINE VENDING_MACHINE_inst (
    .Clk        (Clk      ),
    .rst_n      (rst_n    ),
    .money_in   (money_in ),
    .change     (change   ),
    .goods_out  (goods_out)
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
        #1;
        money_in = 3'd0;         // input initial
        #(`Clock*10); 
    
    // test1--------------------------0.5 * 4   =>   goods_out = 1'd0    change = 2'd0
        money_in = 3'd1;          
        #(`Clock*1);
        money_in = 3'd1;         
        #(`Clock*1);         
        money_in = 3'd1;         
        #(`Clock*1);
        money_in = 3'd1;
        #(`Clock*1);
        money_in = 3'd0;                 
        #(`Clock*2);
        reset_1;
    // test2--------------------------0.5 * 5   =>   goods_out = 1'd1    change = 2'd0
        money_in = 3'd1;          
        #(`Clock*1);
        money_in = 3'd1;         
        #(`Clock*1);         
        money_in = 3'd1;         
        #(`Clock*1);
        money_in = 3'd1;
        #(`Clock*1);
        money_in = 3'd1;                 
        #(`Clock*2);
        reset_1;
    // test3--------------------------0.5 * 4 + 1   =>   goods_out = 1'd1    change = 2'd1
        money_in = 3'd1;          
        #(`Clock*1);
        money_in = 3'd1;         
        #(`Clock*1);         
        money_in = 3'd1;         
        #(`Clock*1);
        money_in = 3'd1;         
        #(`Clock*1);   
        money_in = 3'd2;         
        #(`Clock*2);  
        reset_1;
    // test4--------------------------0.5 + 1 + 2   =>   goods_out = 1'd1    change = 2'd2
        money_in = 3'd1;          
        #(`Clock*1);
        money_in = 3'd2;         
        #(`Clock*1);         
        money_in = 3'd4;         
        #(`Clock*2);
        reset_1;
   // test4--------------------------2 + 2   =>   goods_out = 1'd1    change = 2'd3
        money_in = 3'd4;          
        #(`Clock*1);      
        money_in = 3'd4;         
        #(`Clock*2);
        reset_1;
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
