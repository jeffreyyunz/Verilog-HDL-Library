`timescale 1ns / 1ps
`define     Clock      20 // clock cycle
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/20 09:42:55
// Design Name: 
// Module Name: DETECT_tb
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


module DETECT_tb;
    // INPUTS
        reg [127:0] Din;               // posedge active
    // OUTPUTS        
        wire [7:0] Dout;          // 8 bits
    
    DETECT_LOWEST_HIGH DETECT_LOWEST_HIGH_inst (
    .Din        (Din      ),
    .Dout      (Dout    )
    );      
    
    initial begin
        #(`Clock*1);
        Din = 128'd1213213;        // 100101000001100011101     Dout = 0
        
        #(`Clock*5);   
        Din = 128'd2223123513; // 10000100100000100010110000111001   Dout = 0
        
        #(`Clock*5);  
        Din = 128'd2; // 10     Dout = 1
        
        #(`Clock*5);  
        Din = 128'd4;  // 100   Dout = 2
       
        #(`Clock*5);  
        Din = 128'd8; // 1000   Dout = 3
        
        #(`Clock*5);  
        Din = 128'd4444; // 1000101011100   Dout = 2
        
        $stop;
    end
endmodule

