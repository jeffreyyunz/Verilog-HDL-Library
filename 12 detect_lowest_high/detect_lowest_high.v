`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : detect_lowest_high .v
//  Created On    : 2021-05-20
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : detect lowest high bit
//  Modification  : 
//
//==================================================================================================

module DETECT_LOWEST_HIGH(
    // INPUTS
        Din,           // 128bits
    // OUTPUTS        
        Dout          // 8 bits, MSB = 1 =>none of 1
    );
    input [127:0] Din;
    output [7:0] Dout;
    
    reg [7:0] Dout;
    
    integer i;
    always@(*)begin
        Dout = 8'b1000_0000;
        for(i=127;i>=0;i=i-1)
            if(Din[i]==1'b1)
                Dout = i;
            else
                Dout = Dout;
    end    
endmodule
