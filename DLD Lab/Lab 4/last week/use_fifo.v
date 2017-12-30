module use_fifo(
  clk, 
  rst, 
  empty, 
  full,
  wr_en,
  rd_en
);

  parameter ADDR_SIZE = 8;

  input clk, rst;
  input empty, full;
  output wr_en, rd_en;
  
  assign wr_en = (rst)? 1: ((~full && ~rd_en)?1:0);
  assign rd_en = (rst)? 0: ((~empty && ~wr_en)? 1:0);
  
endmodule 