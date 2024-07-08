# 74ch595_driving
This design is to drive 2 pieces 74hc595, via 74hc595 control  8-digit 7-segment display with 8 segments each 

Purpose
The driver_74ch595 module is designed to control two 74HC595 shift registers, enabling 16-bit serial-to-parallel conversion to manage an 8-digit 7-segment display with 8 segments each. By utilizing two 74HC595 chips, this design aims to save FPGA GPIO resources while effectively controlling the display.

Functionality
Clock Division: The module generates a lower frequency clock (SRCLK) from the main clock (Clk) to synchronize the data shifting process.
Data Shifting: The module shifts the data for the 7-segment display segments (SEG) and select lines (SEL) through the two 74HC595 shift registers.
Latch Control: The module controls the latch (RCLK) to update the output of the 74HC595 registers at appropriate intervals.
Ports
Inputs:

Clk: Main clock signal.
Reset_n: Active-low reset signal.
SEL[7:0]: 8-bit select lines for the 7-segment display digits.
SEG[7:0]: 8-bit segment data for the 7-segment display.
Outputs:

DIO: Serial data output to the 74HC595 shift registers.
SRCLK: Shift register clock output.
RCLK: Latch clock output.
