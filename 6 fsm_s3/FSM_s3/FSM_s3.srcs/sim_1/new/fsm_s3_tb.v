`timescale 1ns / 1ps
`define     Clock      20 // clock cycle
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/19 11:12:34
// Design Name: 
// Module Name: fsm_s3_tb
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


module fsm_s3_tb;
//--------------------< Port Name >------------------------------------------
    // INPUTS
    reg            Clk;
    reg            rst_n;
    reg            FSM_in;
    // OUTPUTS
    wire           FSM_out;
    
// ----------------------------------------------------------------------
// --  Instantiate the Unit Under Test (UUT)
// ----------------------------------------------------------------------
    FSM_S3 FSM_S3_inst (
    .Clk        (Clk    ),
    .rst_n      (rst_n  ),
    .FSM_in     (FSM_in ),
    .FSM_out    (FSM_out)
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
        FSM_in = 0;         // input initial
        #(`Clock*10); 
    // test1--------------------------
        FSM_in = 1;         // Constantly changing state
        #(`Clock*6);
    // reset--------------------------    
        rst_n = 0; #(`Clock*1);
        rst_n = 1;
        
    // test2--------------------------
        FSM_in = 1;         // Keep state_1
        #(`Clock*1);
        FSM_in = 0;
        #(`Clock*3);     
    // reset--------------------------    
        rst_n = 0; #(`Clock*1);
        rst_n = 1;
    
    // test3--------------------------
        FSM_in = 1;         // Keep state_2
        #(`Clock*2);
        FSM_in = 0;
        #(`Clock*3);         
    // reset--------------------------    
        rst_n = 0; #(`Clock*1);
        rst_n = 1;
    
    // test4--------------------------
        FSM_in = 1;         // changing state wait a clock
        #(`Clock*1);
        FSM_in = 0;         // current state is 1
        #(`Clock*1);         
        FSM_in = 1;         
        #(`Clock*1);
        FSM_in = 0;         // current state is 2
        #(`Clock*1);   
        FSM_in = 1;         
        #(`Clock*1);
        FSM_in = 0;         // current state is 3
        #(`Clock*1);   
        FSM_in = 1;         
        #(`Clock*1);
        FSM_in = 0;         // current state is 4
        #(`Clock*1);   
        FSM_in = 1;         
        #(`Clock*1);
        FSM_in = 0;         // return to Idle, output 1
        #(`Clock*4);   
        
        $stop;
    end
   
endmodule
