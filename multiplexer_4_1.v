`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 18:23:59
// Design Name: 
// Module Name: multiplexer_4_1
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


module multiplexer_4_1(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [1:0] Sel,
    output reg [3:0] Y_out
    );
    always@(*)
        begin
        case(Sel)
        2'b00 : Y_out = A;
        2'b01 : Y_out = B;
        2'b10 : Y_out = C;
        2'b11 : Y_out = D;
        default : Y_out = 4'b0000;
        endcase 
        end
endmodule
