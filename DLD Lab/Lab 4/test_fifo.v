module test_fifo();
  parameter DATA_SIZE =8; 
  parameter ADDR_SIZE = 3;
  
  reg clk, rst, rd_en, wr_en; 
  wire full, empty;
  reg [DATA_SIZE-1:0] data_in; 
  wire [DATA_SIZE-1:0] data_out; 
  
  integer i;
  
  FIFO #(DATA_SIZE, ADDR_SIZE) fifoTest(clk, rst, 1'b1, rd_en,  1'b1, wr_en, data_in, data_out, empty, full);
  
  
  initial begin 
    $monitor ("%g wr:%h wr_data:%h rd:%h rd_data:%h", $time, wr_en, data_in, rd_en, data_out);
    
    clk = 0; 
    rst = 0; 
    rd_en = 0; 
    wr_en = 0; 
    data_in = 0;
    #5 rst = 1; 
    #5 rst = 0;
    
    @(negedge clk);
    wr_en = 1;
    
    for(i=0; i<7; i=i+1) begin 
      data_in = i; 
      @(negedge clk);
    end
    
    wr_en = 0;
    
    @(negedge clk);
    rd_en = 1;
    
    for(i=0; i<7; i=i+1) begin 
      @(negedge clk);
    end
    
    rd_en = 0;
    
    #100 $finish;
  end 
  
  always #1 clk = !clk;
  
endmodule