`timescale 1ns / 1ps

module test;

 // Inputs

 reg CLK;
 reg RST;
 reg [7:0]DATA_INPUT;
 reg BTN_WRITE;
 reg BTN_READ;
 wire [7:0]DATA_OUT;
 wire EMPTY;
 wire FULL;

 // Instantiate the Unit Under Test (UUT)

FIFO uut(
.CLK(CLK),
.RST(RST),
.DATA_INPUT(DATA_INPUT),
.BTN_WRITE(BTN_WRITE),
.BTN_READ(BTN_READ),
.DATA_OUT(DATA_OUT),
.EMPTY(EMPTY),
.FULL(FULL)
);

 initial begin

  // Initialize Inputs

  CLK  = 1'b0;
  DATA_INPUT  = 8'b00000000;
  BTN_READ  = 1'b0;
  BTN_WRITE  = 1'b0;
  RST  = 1'b1;

  // Wait 100 ns for global reset to finish

  #100;        

  // Add stimulus here
  RST  = 1'b1;

  #20;
  RST  = 1'b0;
  BTN_WRITE  = 1'b1;
  DATA_INPUT  = 8'b00000001;

  #20;
   BTN_WRITE = 1'b0;
	#20;
 
  DATA_INPUT  = 8'b00000010;
  BTN_WRITE = 1'b1;
   #20;
  BTN_WRITE = 1'b0;
	#20;
  DATA_INPUT  = 8'b00000100;
  BTN_WRITE = 1'b1;
  #20;
  BTN_WRITE = 1'b0;
  #20;
  DATA_INPUT  = 8'b00001000;
  BTN_WRITE = 1'b1;
  #20;
  BTN_WRITE = 1'b0;
  #20;
  BTN_READ = 1'b1;
  #20;
  BTN_READ = 1'b0;
  #20;
  BTN_READ = 1'b1;
  #20;
  BTN_READ = 1'b0;
  #20;
  DATA_INPUT  = 8'b00010000;
  BTN_WRITE = 1'b1;
  #20;
  BTN_WRITE = 1'b0;
  #20;
  DATA_INPUT  = 8'b00100000;
  BTN_WRITE = 1'b1;
  #20;
  BTN_WRITE = 1'b0;
  #20;
  $stop;
 end 

   always #10 CLK = ~CLK;    

endmodule