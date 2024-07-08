
`timescale 10ns/1ps

module driver_74ch595_tb();
reg Clk;
reg Reset_n;
reg [7:0]SEL;
reg [7:0]SEG;
wire DIO;
wire SRCLK;
wire RCLK;

driver_74ch595 driver_74ch595_Ins(
.Clk(Clk),
.Reset_n(Reset_n),
.SEL(SEL),
.SEG(SEG),
.DIO(DIO),
.SRCLK(SRCLK),
.RCLK(RCLK)
);

initial begin
SEL=8'b0010_1110;
SEG=8'b1110_1110;
Clk=0;
Reset_n=0;
#17;
Reset_n=1;
#2000;
$stop;
end

always #10 Clk=!Clk;
endmodule


