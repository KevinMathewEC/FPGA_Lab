`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2024 23:11:22
// Design Name: 
// Module Name: mod10_counter_tb
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


module mod10_counter_tb(    );
    parameter CLK_PERIOD =3;
    reg sys_clk;
    reg rst_n;
    reg [2:0]ctrl;
    reg [3:0]inp;
    wire [15:0]thermo_count;
   // wire [3:0]cntr;
    mod10_counter_top mod10(.sys_clk(sys_clk),.rst_n(rst_n),.ctrl(ctrl),.inp(inp),.thermo_count(thermo_count));

    initial
    begin
        sys_clk=0;
        inp =4'd8;
        #2 rst_n=1'b0;
        #8 rst_n=1'b1;
        #8 ctrl=3'd4;
        #5 ctrl =3'd0;
        #9 ctrl =3'd3;
        #20 ctrl =3'd5;
        #8 ctrl = 3'd2;
        #30 $finish;
    end
        initial
    begin
    sys_clk=0;
    forever #CLK_PERIOD sys_clk=~sys_clk;
    end
endmodule
