`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 22:23:30
// Design Name: 
// Module Name: CLA_adder_4bit_tb
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


module CLA_adder_4bit_tb();
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;
  CLA_adder_4bit CLA_4(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  initial
  begin
  a=4'd12;
  b=4'd13;
  cin=1'd0;
  #5 a=4'd9;
  b=4'd2;
  #5 $finish;
  end
endmodule
