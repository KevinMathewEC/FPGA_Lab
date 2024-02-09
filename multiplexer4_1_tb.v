`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2024 01:14:30
// Design Name: 
// Module Name: mux4_1_tb
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


module mux4_1_tb();
   
    reg [3:0]A,B,C,D;
    reg [1:0]Sel;
    wire [3:0]Y_out;
    
    mux4_1 mux(.A(A),.B(B),.C(C),.D(D),.Sel(Sel),.Y_out(Y_out));
    initial    
    begin
      A=4'd1;
      B=4'd2;
      C=4'd3;
      D=4'd4;
      Sel=2'd0;
      
      #5 Sel=2'd1;
      #5 Sel=2'd2;
      #5 Sel=2'd3;
      
      #10 $finish;
    end
endmodule

