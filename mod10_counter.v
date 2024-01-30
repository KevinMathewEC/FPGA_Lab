`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2024 23:17:16
// Design Name: 
// Module Name: mod10_counter
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


module mod10_counter(clk,rst_n,ctrl,count,inp

    );
    input clk;
    input rst_n;
    input [2:0]ctrl;
    input [3:0]inp;
    output reg [3:0]count;
    reg cnt_dir;
    wire clk;
  
    parameter mod_N =10;
    initial
    begin
    cnt_dir=1;
    end
    always@(posedge clk)
    begin
        if(!rst_n)
        begin
            count<=4'd0;
        end
        else
        begin
            case(ctrl)
                3'b000 : count<=count;
                3'b001 : 
                begin
                if(count < mod_N)
                count<=count+1;
                end
                3'b010 :
                begin
                if((count <= mod_N) && (count >= 0))
                 count<=count-1;
                 end
                3'b011 : 
                begin
                   if((count<mod_N)&&(cnt_dir))
                       begin  
                       count<=count+1;
                       if(count == mod_N)
                            cnt_dir<=0;
                       end
                   else if (!cnt_dir)
                   begin
                        count<=count-1;
                        if(count == mod_N)
                            cnt_dir<=1;
                    end
                end
                3'b100 : count<=inp;
                3'b101 : count<=4'd0;
                default : count <= count;
        endcase 
        end
    end
     
endmodule

module clk_divider(sys_clk,rst_n,clk);
   input sys_clk,rst_n;
   output clk;
   reg [25:0]cnt;
   assign clk=cnt[23];
  // assign clk=sys_clk;
   always@(posedge sys_clk)
   begin
    if(!rst_n)
    begin
        cnt<=7'd0;
    end
    else
    begin
        cnt<=cnt+7'd1;
    end
   end
endmodule

module decimal_thermometer_conv(count,thermo_count);
input [3:0]count;
output [15:0] thermo_count;
  parameter tmp = 16'b0000_0000_0000_0001;
assign thermo_count = (count == 4'b0000) ? tmp :(count == 4'b0001) ? tmp<<1: (count == 4'b0010) ? tmp<<2:(count == 4'b0011) ? tmp<<3: (count == 4'b0100) ? tmp<<4:(count == 4'b0101) ? tmp<<5:(count == 4'b0110) ? tmp<<6:(count == 4'b0111) ? tmp<<7:(count == 4'b1000) ? tmp<<8:(count == 4'b1001) ? tmp<<9:(count == 4'b1010) ? tmp<<10:(count == 4'b1011) ? tmp<<11:(count == 4'b1100) ? tmp<<12:(count == 4'b1101) ? tmp<<13:(count == 4'b1110) ? tmp<<14:(count == 4'b1111) ? tmp<<15: 16'bxxxx_xxxx_xxxx_xxxx;
  

endmodule
