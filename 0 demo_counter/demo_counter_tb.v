//==================================================================================================
//  Filename      : demo_counter_tb.v
//  Created On    : 2021-03-23 14:15:50
//  Last Modified : 2021-03-23 14:23:21
//  Revision      : 1.0
//  Author        : Rongye
//
//  Description   : testbench for demo_counter
//
//
//==================================================================================================

module demo_counter_tb;

// Inputs
reg Clk;
reg rst_n;
reg En;

// Outputs
wire [7:0] Count;

// Instantiate the Unit Under Test (UUT)
DEMO_COUNTER DEMO_COUNTER_inst (
    .Clk(Clk),  
    .rst_n(rst_n),
    .En(En),
    .Count(Count)
 );

 
initial
begin
// Initialize Inputs
    Clk = 0;
    rst_n = 0;
    En = 0;
    #100;
    rst_n = 1;
    #100;
    En = 1;
    #2000;
    $stop;
end

//Create clock
always #10 Clk = ~ Clk; //50M

endmodule