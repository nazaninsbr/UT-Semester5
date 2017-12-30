module multiEcho(
	sound, 
  beta,
  clk, 
  rst, 
  echo
);

	
  parameter SIZE = 8;
  parameter ADDR_SIZE = 8;

  input clk, rst;
  input sound;
  input [1:0] beta;
  output [SIZE-1:0] echo;
  
  wire empty, full;
  wire rd_en, wr_en;
  wire fifo_data_out;
  wire OUT_CLK;
  use_fifo uf(OUT_CLK, rst, empty, full,wr_en,rd_en);
  FD fd(clk, rst, OUT_CLK);
  fifo #(SIZE, ADDR_SIZE) fifoTest(clk, rst, 1'b1, rd_en,  1'b1, wr_en, sound, fifo_data_out, empty, full); 
  mac2 #(SIZE) mac1(sound, beta, fifo_data_out, echo);




endmodule 