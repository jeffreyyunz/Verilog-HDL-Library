`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : seqdet_shift.v
//  Created On    : 2021-04-19
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : Use shift register for sequence detection
//  Modification  :
//
//==================================================================================================


module SEQDET_SHIFT(
// INPUTS
        Clk,        // posedge active
        rst_n,      // negedge active
        x,          // sequence input
    // OUTPUTS        
        y           // detection "10010"
    );
       
    input              Clk;
    input              rst_n;
    input              x;
    
    output             y;

    reg               y;
    reg     [4:0]     shift_r;
       
    // shift register design
    always @(posedge Clk or negedge rst_n)begin
        if(!rst_n)
            shift_r <= 5'd0;
        else
            shift_r <= {shift_r[3:0], x};
    end
    
    // detection output
    always@(posedge Clk or negedge rst_n)begin
        if(!rst_n)
            y <= 1'b0;
        else if(shift_r == 5'b10010)
            y <= 1'b1;
        else
            y <= 1'b0;
    end
    
endmodule
