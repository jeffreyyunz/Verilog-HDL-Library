`timescale 1ns / 1ps
//======================================================================================================
//  Filename      : mult_for.v  
//  Created On    : 2021-05-24
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : Use for loop to implement binary multiplication operation.
//  Modification  : 
//
//======================================================================================================
module MULT_FOR #(
    //---------------------------------------< Parameter >----------------------------------------------
    parameter                           N  = 8                      // N bits   

) (
    //---------------------------------------< Port Name >----------------------------------------------
    // INPUTS
    input              [N-1:0]          a                          ,// port a
    input              [N-1:0]          b                          ,// port b
    // OUTPUTS        
    output reg         [2*N-1:0]        out                         // data out

);
    //---------------------------------------< Variable >-----------------------------------------------
    // integer
    integer i;
    
    //---------------------------------------< Always block >-------------------------------------------
    // Combinational logic  
    // Binary multiplication
    always @(a or b) begin
        out = 'b0;
        for (i = 0; i<N; i=i+1) begin
            if (!b[i]) begin
                out = out;
            end else begin
                out = out + (a<<i);
            end
        end
    end

endmodule
