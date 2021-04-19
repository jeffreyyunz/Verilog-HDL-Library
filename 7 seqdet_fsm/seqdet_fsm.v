`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : fsm_s3.v
//  Created On    : 2021-04-19
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : Use FSM for sequence detection
//  Modification  :
//
//==================================================================================================

module SEQDET_FSM(
    // INPUTS
        Clk,        // posedge active
        rst_n,      // negedge active
        x,          // sequence input
    // OUTPUTS        
        y           // detection "10010"
    );
    
    // Number of states = 6
    parameter Idle    = 4'b0000; 
    parameter State_1 = 4'b0001; // 1
    parameter State_2 = 4'b0010; // 10
    parameter State_3 = 4'b0011; // 100
    parameter State_4 = 4'b0100; // 1001
    parameter State_5 = 4'b0101; // 10010
    
    input              Clk;
    input              rst_n;
    input              x;
    
    output             y;

    reg                y;
    reg     [3:0]      State_current;
    reg     [3:0]      State_next;
    
    // Synchronous timing always module, describing state transition
    always@(posedge Clk or negedge rst_n)
    begin
        if(!rst_n)
            State_current <= Idle;
        else
            State_current <= State_next;
    end
    
    // Combinational logic always module, judging state transition
    always@(State_current or x)
    begin
        case(State_current)
            Idle:
            begin
                if(x)
                    State_next = State_1;       // detect 1
                else
                    State_next = State_current;
            end
            State_1:
            begin
                if(!x)
                    State_next = State_2;       // detect 10
                else
                    State_next = State_1;       // detect 1
            end
            State_2:
            begin
                if(!x)
                    State_next = State_3;       // detect 100
                else
                    State_next = State_1;       // detect 1
            end
            State_3:
            begin
                if(x)
                    State_next = State_4;       // detect 1001
                else
                    State_next = Idle;          // detect 0
            end
            State_4:
            begin
                if(!x)
                    State_next = State_5;       // detect 10010
                else
                    State_next = State_1;       // detect 1
            end
            State_5:
            begin
                if(x)
                    State_next = State_1;       // detect 1
                else
                    State_next = State_3;       // detect 100
            end
            default:State_next = Idle;
        endcase
    end
    // next_state output
    always@(posedge Clk or negedge rst_n)
    begin
        if(!rst_n)
            y <= 1'b0; // reset
        else begin
            case(State_next)
                Idle:
                    y <= 1'b0;                        
                State_1:
                    y <= 1'b0;   
                State_2:
                    y <= 1'b0;    
                State_3:
                    y <= 1'b0;                
                State_4:
                    y <= 1'b0;    
                State_5:
                    y <= 1'b1;              // detect 10010            
                default:
                    y <= 1'b0;
            endcase
        end
    end
endmodule
