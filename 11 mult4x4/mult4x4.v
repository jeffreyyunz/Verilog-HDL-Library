`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : mult4x4.v
//  Created On    : 2021-05-14
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : a 2 bits multiplier
//  Modification  : 
//
//==================================================================================================

module MULT4x4(
    // INPUTS
        Clk,               // posedge active
        rst_n,             // negedge active
        a,             // 4 bits (0-15)
        b,             // 4 bits
    // OUTPUTS        
        out          // 8 bits
    );
    parameter N  = 4; // 4x4

    input              Clk;
    input              rst_n;
    input    [N-1:0]   a;
    input    [N-1:0]   b;
    
    output   [2*N-1:0] out;
    
    reg     [N/2-1:0]  a1,a2,b1,b2; // 2x2
    wire    [N-1:0]    out_a,out_b,out_c,out_d;  
        
    reg     [2*N-1:0]  out;
    
    always@(posedge Clk)
        if(!rst_n)begin
            a1 <= 'bx;
            a2 <= 'bx;
            b1 <= 'bx;
            b2 <= 'bx;
        end
        else begin
            a1 <= a[N-1:N-2];
            a2 <= a[N-3:N-4];
            b1 <= b[N-1:N-2];
            b2 <= b[N-3:N-4];
        end
    
    MULT2x2 MULT1(
            .Clk(Clk),         
            .rst_n(rst_n),          
            .a(a1),            
            .b(b1),             
            .out(out_a)          
            );
            
   MULT2x2 MULT2(
            .Clk(Clk),         
            .rst_n(rst_n),          
            .a(a1),            
            .b(b2),             
            .out(out_b)          
            );
            
   MULT2x2 MULT3(
            .Clk(Clk),         
            .rst_n(rst_n),          
            .a(a2),            
            .b(b1),             
            .out(out_c)          
            );
            
   MULT2x2 MULT4(
            .Clk(Clk),         
            .rst_n(rst_n),          
            .a(a2),            
            .b(b2),             
            .out(out_d)          
            );
   
    always@(posedge Clk)
        if(!rst_n)
            out <= 'bx;
        else
            out <= (out_a << 4) + (out_b << 2) + (out_c << 2) + out_d;
                 
endmodule
