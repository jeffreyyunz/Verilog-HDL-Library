`timescale  1ns / 1ps
//======================================================================================================
//  Filename      : tb_mult_for.v   
//  Created On    : 2021-05-24
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : testbench of mult_for.v
//  Modification  : 
//
//======================================================================================================
module tb_MULT_FOR;

    //---------------------------------------< Parameter >----------------------------------------------
    parameter                           PERIOD = 10                ;
    parameter                           N  = 8                     ;

    //---------------------------------------< Port Name >----------------------------------------------
    // INPUTS
    reg                [N-1:0]          a                          ;
    reg                [N-1:0]          b                          ;
    // OUTPUTS        
    wire               [2*N-1:0]        out                        ;

    //---------------------------------------< Module Instance >----------------------------------------
    MULT_FOR #(
    .N                                 (N )                       ) 
    u_MULT_FOR (
    .a                                 (a    [N-1:0]              ),
    .b                                 (b    [N-1:0]              ),

    .out                               (out  [2*N-1:0]            ) 
    );

    //---------------------------------------< Design Input >----------------------------------------
    initial begin
        // Initial input
        a = 'd0;
        b = 'd0;
        // Test case 1 : out = 'd8
        #(PERIOD*10)
        a = 'd4;
        b = 'd2;

        // Test case 2 : out = 'd32
        #(PERIOD*1)
        a = 'd4;
        b = 'd8;

        // Test case 3 : out = 'd88
        #(PERIOD*1)
        a = 'd11;
        b = 'd8;

        // Test case 4 : out = 'd132
        #(PERIOD*1)
        a = 'd11;
        b = 'd12;

        // Test case 5 : out = 'd28125
        #(PERIOD*1)
        a = 'd125;
        b = 'd225;
        $stop;
    end

endmodule