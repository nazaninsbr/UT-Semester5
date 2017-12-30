module singleEcho(
  sound, 
  beta,
  clk, 
  rst, 
  echo
);

  parameter SIZE = 8;
  parameter ADDR_SIZE = 11;

  input clk, rst;
  input [SIZE-1:0] sound;
  input [1:0] beta;
  output [SIZE-1:0] echo;
  
  wire empty, full;
  wire rd_en, wr_en;
  wire [SIZE-1:0] fifo_data_out;
  wire OUT_CLK;
  use_fifo uf(OUT_CLK, rst, empty, full,wr_en,rd_en);
  FD fd(clk, rst, OUT_CLK);
  //fifo #(SIZE, ADDR_SIZE) fifoTest(OUT_CLK, rst, 1'b1, rd_en,  1'b1, wr_en, sound, fifo_data_out, empty, full); 
  fifo #(SIZE, ADDR_SIZE) fifoTest(OUT_CLK, rst, 1'b1, rd_en,  1'b1, wr_en, echo, fifo_data_out, empty, full);
  mac #(SIZE) mac1(sound, beta, fifo_data_out, echo);

  //mac #(SIZE) mac1(sound, beta, fifo_data_out, echo);
  
endmodule