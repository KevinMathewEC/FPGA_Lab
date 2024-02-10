module mod10_counter_top(sys_clk,rst_n,ctrl,inp,thermo_count);
    input sys_clk;
    input rst_n;
    input [2:0]ctrl;
    input [3:0]inp;
    output [15:0]thermo_count;

    wire clk_en;
    wire [3:0]cntr;
   clk_divider clk_div(.sys_clk(sys_clk),.rst_n(rst_n),.clk_en(clk_en));
   mod10_counter mod10_cnt(.clk(sys_clk),.rst_n(rst_n),.ctrl(ctrl),.count(cntr),.inp(inp),.clk_en(clk_en));
   decimal_thermometer_conv therm_conv(.count(cntr),.thermo_count(thermo_count));
endmodule
