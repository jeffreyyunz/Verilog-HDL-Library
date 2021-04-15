`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : alu.v
//  Created On    : 2021-04-15
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : 4-bit ALU with arithmetic and logic operations 
//  Modification  :
//
//==================================================================================================

module ALU(
    // INPUTS
        Clk,    // posedge active
        rst_n,  // negedge active
        A,      // operand A
        B,      // operand B
        Cin,    // carry in
        Oper,   // operation instruction 
        Mode,   // operation mode: arithmetic(mode = 1'b1) or logic operation(mode = 1'b0)
               
    // OUTPUTS
        Sum,    // calculation result
        Cout    // carry out
);
    parameter N = 4; // 4 bits
    
    input               Clk;
    input               rst_n;
    input    [N-1:0]    A;
    input    [N-1:0]    B;
    input               Cin;
    input    [1:0]      Oper;
    input               Mode;
    
    output   [N-1:0]    Sum;
    output              Cout;
    
    reg [N-1:0] Sum;
    reg Cout;  
    
    // operation block
    always@(posedge Clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                Sum = 'b0;
                Cout = 1'b0;
            end
        else
            begin
                if(Mode) 
                    {Cout,Sum} = arithmetic(A,B,Cin,Oper);
                else    
                    Sum = logic(A,B,Oper);
            end
    end
     
    // function for arithmetic operation
    function [N:0] arithmetic; 
        input    [N-1:0]    A;
        input    [N-1:0]    B;
        input               Cin;
        input    [1:0]      Oper;
    
        reg [N:0] result; // {Cout , Sum}:arithmetic operation result

        begin     
            case(Oper)
                2'b00 : result = A;                     // transfer A
                2'b01 : result = A + B + Cin;           // A + B
                2'b10 : result = A + ~B + 1 + Cin;      // A - B
                2'b11 : result = ~A + B + 1 + Cin;      // B - A
                default :;
            endcase
            arithmetic = result;
        end    
    endfunction    
    
    // function for logic operation
        function [N:0] logic; 
            input    [N-1:0]    A;
            input    [N-1:0]    B;
            input    [1:0]      Oper;
        
            reg [N-1:0] result; // logic operation result
    
            begin     
                case(Oper)
                    2'b00 : result = A & B;         // AND
                    2'b01 : result = A | B;         // OR
                    2'b10 : result = A ^ B;         // XOR
                    2'b11 : result = ~(A ^ B);      // XNOR
                    default :;
                endcase
                logic = result;
            end    
        endfunction    

endmodule
