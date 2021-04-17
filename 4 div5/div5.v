`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : div5.v
//  Created On    : 2021-04-17
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : Odd divider
//  Modification  :
//
//==================================================================================================

module DIV5(
    // INPUTS
        Clk,        // posedge active
        rst_n,      // negedge active
    // OUTPUTS        
        clk_div,    // posedge active
        clk_pose,   // posedge of clk
        clk_nege,   // negedge of clk
        coutpose,   // posedge of counter
        coutnege    // negedge of counter
);  
    // N = 5
    // div1 £½ (N - 1) / 2, div2 = N - 1
    parameter div1 = 2 , div2 = 4; 

    input              Clk;
    input              rst_n;
    
    output             clk_div;
    output             clk_pose;
    output             clk_nege;
    output    [2:0]    coutpose;
    output    [2:0]    coutnege;

 

    reg clk_pose;
    reg clk_nege;
    reg [2:0] coutpose;
    reg [2:0] coutnege;
    

    
    // Counter 1
    always@(posedge Clk or negedge rst_n)// posedge trigger 
    begin    
        if(!rst_n)  
            clk_pose = 0;    
        else if(coutpose == div1)    
            clk_pose = ~clk_pose;    
        else if(coutpose == div2)    
            clk_pose = ~clk_pose;    
        else    
            clk_pose = clk_pose;    
    end
           
    always@(negedge Clk or negedge rst_n)// negedge trigger     
    begin    
        if(!rst_n)    
            clk_nege = 0;    
        else if(coutnege == div1)    
            clk_nege = ~clk_nege;    
        else if(coutnege == div2)    
            clk_nege = ~clk_nege;    
        else    
            clk_nege = clk_nege;    
    end   
    
    // Counter 2     
    always@(posedge Clk or negedge rst_n)// posedge trigger   
    begin    
        if(!rst_n)    
            coutpose = 0;    
        else if(coutpose == div2)    
            coutpose = 0;    
        else    
            coutpose = coutpose + 1;    
    end    
         
    always@(negedge Clk or negedge rst_n)// negedge trigger      
    begin    
        if(!rst_n)    
            coutnege = 0;    
        else if(coutnege == div2)    
            coutnege = 0;    
        else    
            coutnege = coutnege + 1;    
    end    
    
    // Get 50% duty cycle through OR operation
    assign clk_div = clk_pose | clk_nege;
    
endmodule