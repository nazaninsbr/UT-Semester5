module test_comparator();
  
  reg clk; 
  reg [4:0] d1 = 5'b11000;
  reg [4:0] d2 = 5'b11001; 
  
  wire A_ls_B, A_gt_B, A_eq_B;
  
  comparator #(5) c1( d1, d2, A_ls_B, A_gt_B, A_eq_B); 

  initial begin 
    clk = 0;
    repeat(100)#(10) clk = ~ clk;
  end 
  
endmodule 