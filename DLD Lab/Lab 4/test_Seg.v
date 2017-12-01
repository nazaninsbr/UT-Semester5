module test_Seg();
  
  reg [3:0] data_in = 4'd4; 
  reg clk;
  wire segA, segB, segC, segD, segE, segF, segG, segDP;
  
  sevenSegment ss(data_in, clk, segA, segB, segC, segD, segE, segF, segG, segDP);
  
  initial begin 
    clk = 0;
    repeat(100)#(10) clk = ~ clk;
  end 
  
endmodule 