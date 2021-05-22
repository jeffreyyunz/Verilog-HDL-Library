`timescale 1ns / 1ps
//======================================================================================================
//  Filename      : module_name.v   //[文件名小写]
//  Created On    : 2021-05-21
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : 
//  Modification  : 
//
//======================================================================================================
module MODULE_NAME #(                                               //[模块名对应文件名大写]
    //---------------------------------------< Parameter >----------------------------------------------
    parameter                           N  = 2                      // N bits   //[位宽通过变量来设定][变量大写]

) (
    //---------------------------------------< Port Name >----------------------------------------------
    // INPUTS
    input                               Clk                        ,// clock            - posedge active    //[时钟/控制信号标明什么有效]
    input                               rst_n                      ,// sequential reset - negedge active
    input                               ena                        ,// enable           - high active
    input              [N-1:0]          Din                        ,// data in 

    // OUTPUTS        
    output reg                          Dout                        // data out

);
    //---------------------------------------< Variable >-----------------------------------------------
    // wire
    wire               [N-1:0]          Variable_w                 ;
    
    // reg
    reg                [N-1:0]          Variable_r                 ;

    //---------------------------------------< Always block >-------------------------------------------
    // Combinational logic  
    //[写明功能]
    always @(*) begin

    end

    // Sequential logic
    //[写明功能]
    always @(posedge Clk) begin //[使用同步复位]
        if(!rst_n)begin
            
        end
        else begin
            
        end
    end

    //---------------------------------------< Function Block >-----------------------------------------
    // Function 1
    function [N:0] functionName;
    input              [N-1:0]          functionInput              ;
    reg                [N:0]            functionVariable           ;    
        begin

            functionName = functionVariable;
        end
    endfunction

    //---------------------------------------< Assign >-------------------------------------------------
    // Assign 1
    assign Variable_w = Din;

    //---------------------------------------< Instance >-----------------------------------------------
    // Instance 1
    InstModule #(
    .N                                 (N                         ) 
    )
    u_InstModule (
    .Clk                               (Clk                       ),
    .rst_n                             (rst_n                     ),
    .ena                               (ena                       ),
    .Din                               (Din                       ),

    .Dout                              (Dout                      ) 
    );

    
endmodule
