`timescale 1ns / 1ps
//==================================================================================================
//  Filename      : vending_machine.v
//  Created On    : 2021-04-20
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : Designing a vending machine based on FSM
//  Modification  :
//
//==================================================================================================

module VENDING_MACHINE(
    // INPUTS
        Clk,               // posedge active
        rst_n,             // negedge active
        money_in,          // money input
    // OUTPUTS        
        change,            // change output
        goods_out          // goods output
    );
    // Number of states = 5
    parameter IDLE    = 4'b0000; 
    parameter GET_0_5 = 4'b0001; // get 0.5
    parameter GET_1_0 = 4'b0010; // get 1
    parameter GET_1_5 = 4'b0100; // get 1.5
    parameter GET_2_0 = 4'b1000; // get 2

    input              Clk;
    input              rst_n;
    input    [2:0]     money_in;    // 3'b000->0   3'b001->0.5   3'b010->1    3'b100->2
    
    output   [1:0]     change;      // 2'b00->0   2'b01->0.5   2'b10->1   2'b11->1.5
    output             goods_out;
    
    reg     [1:0]      change;
    reg                goods_out;
    
    reg     [3:0]      State_current;
    reg     [3:0]      State_next;

   
    // State transition module
    always@(posedge Clk or negedge rst_n)
    begin
        if(!rst_n)
            State_current <= IDLE;
        else
            State_current <= State_next;
    end
    
    // State identification module
    always@(State_current or State_next or money_in)
    begin
        case(State_current)
            IDLE:
                case(money_in)
                    3'd1:State_next = GET_0_5;
                    3'd2:State_next = GET_1_0;
                    3'd4:State_next = GET_2_0;   
                    default:State_next = State_current;
                endcase
            GET_0_5:
                case(money_in)
                    3'd1:State_next = GET_1_0;
                    3'd2:State_next = GET_1_5;
                    3'd4:State_next = IDLE;
                    default:State_next = State_current;
                endcase
            GET_1_0:
                case(money_in)
                    3'd1:State_next = GET_1_5;
                    3'd2:State_next = GET_2_0;
                    3'd4:State_next = IDLE;   
                    default:State_next = State_current;
                endcase
            GET_1_5:
                case(money_in)
                    3'd1:State_next = GET_2_0;
                    3'd2:State_next = IDLE; 
                    3'd4:State_next = IDLE; 
                    default:State_next = State_current;
                endcase
            GET_2_0:
                case(money_in)
                    3'd1:State_next = IDLE;
                    3'd2:State_next = IDLE;
                    3'd4:State_next = IDLE;   
                    default:State_next = State_current;
                endcase
            default:State_next = IDLE;
        endcase
    end

    // Output determination module
    always@(posedge Clk or negedge rst_n)
    begin
        goods_out  <= 1'd0; 
        change     <= 2'd0;
        if(!rst_n)begin
            goods_out  <= 1'd0; // reset
            change     <= 2'd0;
        end
        else begin
            case(State_current)
            IDLE:
                case(money_in)
                    3'd1:begin end
                    3'd2:begin end
                    3'd4:begin end   
                endcase
            GET_0_5:
                case(money_in)
                    3'd1:begin end
                    3'd2:begin end
                    3'd4:begin goods_out  <= 1'd1;end
                endcase
            GET_1_0:
                case(money_in)
                    3'd1:begin end
                    3'd2:begin end
                    3'd4:begin goods_out <= 1'd1;  change <= 2'd1;end   
                endcase
            GET_1_5:
                case(money_in)
                    3'd1:begin end
                    3'd2:begin goods_out  <= 1'd1;end 
                    3'd4:begin goods_out <= 1'd1;  change <= 2'd2;end  
                endcase
            GET_2_0:
                case(money_in)
                    3'd1:begin goods_out  <= 1'd1;end
                    3'd2:begin goods_out <= 1'd1;  change <= 2'd1;end
                    3'd4:begin goods_out <= 1'd1;  change <= 2'd3;end   
                endcase
            endcase
        end
    end


endmodule
