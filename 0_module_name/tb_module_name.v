`timescale  1ns / 1ps
//======================================================================================================
//  Filename      : tb_module_name.v   //[文件名小写]
//  Created On    : 2021-05-21
//  Version       : V 1.0
//  Author        : Rongye
//  Description   : 
//  Modification  : 
//
//======================================================================================================
module tb_MODULE_NAME;

    //---------------------------------------< Parameter >----------------------------------------------
    parameter                           PERIOD = 10                ;//[时钟周期设置，默认为100MHz]
    parameter                           N  = 2                     ;

    //---------------------------------------< Port Name >----------------------------------------------
    // INPUTS
    reg                                 Clk                        ;
    reg                                 rst_n                      ;
    reg                                 ena                        ;
    reg                [N-1:0]          Din                        ;

    // OUTPUTS        
    wire                                Dout                       ;

    //---------------------------------------< Clock block >--------------------------------------------
    initial begin
        forever #(PERIOD/2)  Clk=~Clk;
    end

    //---------------------------------------< Reset block >--------------------------------------------  
    initial begin                                                   //[初始复位]
        #(PERIOD*1) reset_1;
    end

    task reset_1;                                                   //[任务：复位一个时钟]
        begin
            rst_n = 0;
            #(PERIOD*1)
            rst_n = 1;
        end
    endtask
    //---------------------------------------< Module Instance >----------------------------------------
    MODULE_NAME #(
    .N                                 (N                         ) 
    )
    u_MODULE_NAME (
    .Clk                               (Clk                       ),
    .rst_n                             (rst_n                     ),
    .ena                               (ena                       ),
    .Din                               (Din    [N-1:0]            ),

    .Dout                              (Dout                      ) 
    );

    //---------------------------------------< Design Input >----------------------------------------
    initial begin
        // Initial data in
        Din = 'd0;

        // Test case 1
        #(PERIOD*10)
        Din = 'd1;
        #(PERIOD*1)
        Din = 'd2;
        #(PERIOD*1)
        Din = 'd3;
        #(PERIOD*1)
        Din = 'd0;
        #(PERIOD*1)
        reset_1;

        // Test case 2
        #(PERIOD*10)
        Din = 'd0;
        #(PERIOD*1)
        Din = 'd2;
        #(PERIOD*1)
        Din = 'd1;
        #(PERIOD*1)
        Din = 'd3;
        #(PERIOD*1)
        reset_1;

        // Test case 
        // ...
        $stop;
    end

endmodule