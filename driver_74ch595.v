

module driver_74ch595(
Clk,
Reset_n,
SEL,
SEG,
DIO,
SRCLK,
RCLK
);

input Clk;
input Reset_n;
input [7:0]SEL;
input [7:0]SEG;
output reg DIO;
output reg SRCLK;
output reg RCLK;

reg [1:0]div_cnt;
reg div_cnt_2;
reg SRCLK_2;
reg [4:0]counter_bits;
parameter CLOCK_FREQ=50_000_000;
parameter SRCLK_FREQ=12_500_000;
parameter MCNT=CLOCK_FREQ/SRCLK_FREQ/2;

//assign DIO={SEG[0], SEG[1], SEG[2], SEG[3], SEG[4], SEG[5], SEG[6], SEG[7], 
//                  SEL[0], SEL[1], SEL[2], SEL[3], SEL[4], SEL[5], SEL[6], SEL[7]};

always@(posedge Clk or negedge Reset_n)
if(!Reset_n)
div_cnt<=0;
else if(div_cnt==MCNT-1)
div_cnt<=0;
else
div_cnt<=div_cnt+1;

always@(posedge Clk or negedge Reset_n)
if(!Reset_n)
SRCLK<=0;
else if(div_cnt==MCNT-1)
SRCLK<=~SRCLK;

//another clock, more small scale, for RCLK
always@(posedge Clk or negedge Reset_n)
if(!Reset_n)
div_cnt_2<=0;
else if(div_cnt_2==MCNT/2-1)
div_cnt_2<=0;
else
div_cnt_2<=div_cnt_2+1;

always@(posedge Clk or negedge Reset_n)
if(!Reset_n)
SRCLK_2<=0;
else if(div_cnt_2==MCNT/2-1)
SRCLK_2<=~SRCLK_2;

always@(negedge SRCLK_2 or negedge Reset_n)
if(!Reset_n)
counter_bits<=0;
else
counter_bits<=counter_bits+1;

always@(negedge SRCLK_2 or negedge Reset_n)
if(!Reset_n)
RCLK<=0;
else if(counter_bits==31)
RCLK<=1;
else 
RCLK<=0;

always@(negedge SRCLK or negedge Reset_n)
if(!Reset_n)
DIO<=0;
else begin
case(counter_bits)
0:DIO<=SEG[7];
1:DIO<=SEG[6];
2:DIO<=SEG[5];
3:DIO<=SEG[4];
4:DIO<=SEG[3];
5:DIO<=SEG[2];
6:DIO<=SEG[1];
7:DIO<=SEG[0];

8:DIO<=SEL[7];
9:DIO<=SEL[6];
10:DIO<=SEL[5];
11:DIO<=SEL[4];
12:DIO<=SEL[3];
13:DIO<=SEL[2];
14:DIO<=SEL[1];
15:DIO<=SEL[0];
endcase
end
endmodule
