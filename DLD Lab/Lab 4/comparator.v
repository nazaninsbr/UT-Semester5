module comparator(
  A, B, 
  A_ls_B, 
  A_gt_B, 
  A_eq_B
); 
  parameter SIZE=16; 
  input [SIZE-1:0] A, B;
  output A_ls_B, A_gt_B, A_eq_B; 
  
  
  assign A_ls_B = (A<B)? 1:0;
  assign A_gt_B = (A>B)? 1: 0;
  assign A_eq_B = (A==B)? 1: 0;
  
  
endmodule 