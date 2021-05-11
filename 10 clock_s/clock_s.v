`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : clock_s.v
//  Created On    : 2021-05-11
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : Second timer
//  Modification  :
//
//==================================================================================================


module CLOCK_S(
    // INPUTS
        Clk,               // posedge active
        rst_n,             // negedge active
        start,             // posedge active 
        alarm,             // Timing configuration
    // OUTPUTS        
        pluse          // goods output
    );
    parameter SECONDS  = 32'd32767; //32768-1
    
    parameter IDLE    = 4'b0000; 
    parameter TIME    = 4'b0001; 
    
    input              Clk;
    input              rst_n;
    input              start;
    input    [7:0]     alarm;
    
    output             pluse;    
    
    reg     [3:0]      State_current;
    reg     [3:0]      State_next;
    
    reg     [31:0]     cnt;
    reg     [7:0]      cnt_s;
    // 
    always@(posedge Clk or negedge rst_n)begin
        if(!rst_n)
            State_current <= IDLE;
        else
            State_current <= State_next;
    end
    
    always@(*)begin
        case(State_current)
            IDLE:
                if(start)
                    State_next = TIME;
                else
                    State_next = IDLE;
            TIME:
                if(cnt_s == alarm)  
                    State_next = IDLE;
                else
                    State_next = TIME;
            default:State_next = IDLE;
        endcase
    end
    // counter for clk
    always@(posedge Clk or negedge rst_n)
        if(!rst_n)
            cnt <= 32'd0;        
        else if(State_current == TIME)
            if(cnt == SECONDS)
                cnt <= 32'd0;            
            else 
                cnt <= cnt + 1'd1;                                
        else 
            cnt <= 32'd0;         
    
    // counter for seconds
    always@(posedge Clk or negedge rst_n)
        if(!rst_n)
            cnt_s <= 7'd0;        
        else if(State_current == TIME)
            if(cnt == SECONDS)
                cnt_s <= cnt_s + 1'd1;            
            else 
                cnt_s <= cnt_s;                        
        else 
            cnt_s <= 7'd0;         

    assign pluse = (State_current == TIME) && (cnt_s == alarm);
endmodule
