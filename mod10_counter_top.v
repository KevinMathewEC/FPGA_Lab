`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 17:46:16
// Design Name: 
// Module Name: mod10_counter_top
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


module mod10_counter_top(sys_clk,rst_n,ctrl,inp,thermo_count);
    input sys_clk;
    input rst_n;
    input [2:0]ctrl;
    input [3:0]inp;
    output [15:0]thermo_count;
    
/* clk_wiz_0 clk_inst
   (
    // Clock out ports
    .sys_clk(sys_clk),     // output sys_clk
    // Status and control signals
    .reset(rst_n), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk)      // input clk_in1
);*/
//    output  [3:0]cntr;
    wire clk;
    wire [3:0]cntr;
   clk_divider clk_div(.sys_clk(sys_clk),.rst_n(rst_n),.clk(clk));
   mod10_counter mod10_cnt(.clk(clk),.rst_n(rst_n),.ctrl(ctrl),.count(cntr),.inp(inp));
   decimal_thermometer_conv therm_conv(.count(cntr),.thermo_count(thermo_count));
endmodule
