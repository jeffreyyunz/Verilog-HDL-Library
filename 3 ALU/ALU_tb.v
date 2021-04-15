`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 11:05:20
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb(
    );
    
    parameter N = 4; // 4 bits
    
    // INPUTS
    reg               Clk;
    reg               rst_n;
    reg    [N-1:0]    A;
    reg    [N-1:0]    B;
    reg               Cin;
    reg    [1:0]      Oper;
    reg               Mode;
    
    // OUTPUTS
    wire   [N-1:0]    Sum;
    wire              Cout;

    // Instantiate the Unit Under Test (UUT)
    ALU ALU_inst(
        .Clk(Clk),  
        .rst_n(rst_n),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Oper(Oper),
        .Mode(Mode),
        .Sum(Sum),
        .Cout(Cout)
     );
     
     initial
     begin
     // Initialize Inputs
         Clk = 0;
         rst_n = 0;
         A = 'b0;
         B = 'b0;
         Cin = 1'b0;
         Oper = 2'b00;
         Mode = 1'b0;
         
         #100;
         rst_n = 1;
     // test 1_1 - arithmetic mode(transfer A).
         // set A = 3, B = 6, Cin = 0: result = 3 (4'b0011) carry out = 0;
         #20;
         Mode = 1'b1;
         Oper = 2'b00;
         A = 'd3;
         B = 'd6;
         Cin = 1'd0;
     // test 1_2 - arithmetic mode(A + B).
         // set A = 3, B = 6, Cin = 0: result = 9 (4'b1001) carry out = 0;
         #20;
         Oper = 2'b01;
         A = 'd3;
         B = 'd6;
         Cin = 1'd0;
     // test 1_3 - arithmetic mode(A + B).
         // set A = 10, B = 5, Cin = 1: result = 16 (5'b1_0000) carry out = 1;
         #20;
         Oper = 2'b01;
         A = 'd10;
         B = 'd5;
         Cin = 1'd1;
     // test 1_4 - arithmetic mode(A - B).
         // set A = 10, B = 5, Cin = 0: result = 5 (4'b0101) carry out = 0;
         #20;
         Oper = 2'b10;
         A = 'd10;
         B = 'd5;
         Cin = 1'd0;
     // test 1_5 - arithmetic mode(A - B).// an error condition 
         // set A = 2, B = 5, Cin = 0: result = 13 (4'b1101) carry out = 0;
         #20;
         Oper = 2'b10;
         A = 'd2;
         B = 'd5;
         Cin = 1'd0;
     // test 1_6 - arithmetic mode(B - A).
         // set A = 2, B = 5, Cin = 1: result = 4 (4'b0011) carry out = 0;
         #20;
         Oper = 2'b11;
         A = 'd2;
         B = 'd5;
         Cin = 1'd1;

      // test 2_1 - logic mode(AND).
         // set A = 8(4'b1000), B = 11(4'b1011): result = 8 (4'b1000) 
         #20;
         Mode = 1'b0;
         Oper = 2'b00;
         A = 'd8;
         B = 'd11;
     // test 2_2 - logic mode(OR).
         // set A = 8(4'b1000), B = 11(4'b1011): result = 11 (4'b1011) 
         #20;
         Oper = 2'b01;
         A = 'd8;
         B = 'd11;
     // test 2_3 - logic mode(XOR).
         // set A = 8(4'b1000), B = 11(4'b1011): result = 3 (4'b0011) 
         #20;
         Oper = 2'b10;
         A = 'd8;
         B = 'd11;
     // test 2_4 - logic mode(XNOR).
         // set A = 8(4'b1000), B = 11(4'b1011): result = 12 (4'b1100) 
         #20;
         Oper = 2'b11;
         A = 'd8;
         B = 'd11;
     // End simulation
         #100;
         $stop;
     end
     
     always
     begin
        #10 Clk = ~Clk; // 50MHz
     end
endmodule
