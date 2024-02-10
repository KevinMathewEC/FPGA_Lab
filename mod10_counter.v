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


module mod10_counter(clk,rst_n,ctrl,count,inp,clk_en

    );
    input clk;
    input clk_en;
    input rst_n;
    input [2:0]ctrl;
    input [3:0]inp;
    output reg [3:0]count;
    reg cnt_dir;
    wire clk;
  
    parameter mod_N =10;
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            count<=4'd0;
            cnt_dir=1;
        end
        else if(clk_en)
        begin
            case(ctrl)
                3'b000 : count<=count;
                3'b001 : 
                begin
                count<=(count < (mod_N-1))? (count+4'd1):4'd0;
        /*        if(count < (mod_N-1))
                count<=count+1;
                else
                count<=4'd0;*/
                end
                3'b010 :
                begin
                count<=(count == 4'd0)? (mod_N-1):(count-4'd1);
              /*  if((count < mod_N) && (count > 0))
                 count<=count-1;
                 else
                 count<=(mod_N - 1);*/
                 end
                3'b011 : 
                begin
                   if((cnt_dir))
                       begin  
                       count<=count+1;
                      // cnt_dir<=cnt_dir&&(count < (mod_N-1));
                       if(count == (mod_N-2))
                            cnt_dir=0;
                       end
                   else if (!cnt_dir)
                   begin
                        count<=count-1;
                        cnt_dir<=(cnt_dir || (count==1));
                      //  if(count == 0)
                        //    cnt_dir=1;
                    end
                end
                3'b100 : count<=inp;
                3'b101 : count<=4'd0;
                default : count <= count;
        endcase 
        end
        else
          count<=count;
    end
     
endmodule

module clk_divider(sys_clk,rst_n,clk_en);
   input sys_clk,rst_n;
   output reg clk_en;
   reg [25:0]cnt;
 //  assign clk_en=cnt[25];
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
       // if(cnt == 26'd33554432)
       if(cnt[0])//for simulation
            clk_en<=1'b1;
        else
            clk_en<=1'b0;
        end
    end
   
endmodule

module decimal_thermometer_conv(count,thermo_count);
input [3:0]count;
output [15:0] thermo_count;
  parameter tmp = 16'b0000_0000_0000_0000;
assign thermo_count = (count == 4'b0000) ? tmp :(count == 4'b0001) ? {tmp[15:1],1'b1}: (count == 4'b0010) ? {tmp[15:2],{2{1'b1}}}:(count == 4'b0011) ? {tmp[15:3],{3{1'b1}}}: (count == 4'b0100) ? {tmp[15:4],{4{1'b1}}}:(count == 4'b0101) ? {tmp[15:5],{5{1'b1}}}:(count == 4'b0110) ? {tmp[15:6],{6{1'b1}}}:(count == 4'b0111) ? {tmp[15:7],{7{1'b1}}}:(count == 4'b1000) ? {tmp[15:8],{8{1'b1}}}:(count == 4'b1001) ? {tmp[15:9],{9{1'b1}}}:(count == 4'b1010) ? {tmp[15:10],{10{1'b1}}}:(count == 4'b1011) ? {tmp[15:11],{11{1'b1}}}:(count == 4'b1100) ? {tmp[15:12],{12{1'b1}}}:(count == 4'b1101) ? {tmp[15:13],{13{1'b1}}}:(count == 4'b1110) ? {tmp[15:14],{14{1'b1}}}:(count == 4'b1111) ? {tmp[15:15],{15{1'b1}}}: 16'bxxxx_xxxx_xxxx_xxxx;
  

endmodule


