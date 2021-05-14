`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : mult2x2.v
//  Created On    : 2021-05-14
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : a 2 bits multiplier
//  Modification  : 
//
//==================================================================================================

module MULT2x2(
    // INPUTS
        Clk,               // posedge active
        rst_n,             // negedge active
        a,             // 2 bits
        b,             // 2 bits
    // OUTPUTS        
        out          // 4 bits
    );
    parameter N  = 2; // 2x2

    input              Clk;
    input              rst_n;
    input    [N-1:0]   a;
    input    [N-1:0]   b;
    
    output   [2*N-1:0] out;

    reg     [2*N-1:0]  out;
    reg     [2*N-1:0]  addr;
    
    always@(posedge Clk)begin
        addr <= {a,b};
        if(!rst_n)
            out <= 'bx;
        else             
            case(addr)
                4'h0:out <= 4'b0000;
                4'h1:out <= 4'b0000;
                4'h2:out <= 4'b0000;
                4'h3:out <= 4'b0000;
                
                4'h4:out <= 4'b0000;
                4'h5:out <= 4'b0001;
                4'h6:out <= 4'b0010;
                4'h7:out <= 4'b0011;
                
                4'h8:out <= 4'b0000;
                4'h9:out <= 4'b0010;
                4'ha:out <= 4'b0100;
                4'hb:out <= 4'b0110;
                
                4'hc:out <= 4'b0000;
                4'hd:out <= 4'b0011;
                4'he:out <= 4'b0110;
                4'hf:out <= 4'b1001;   
                default:out <= 'bx;         
            endcase
      end  
                 
endmodule
