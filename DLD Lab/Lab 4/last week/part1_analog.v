module part1_analog(clk, rst, V_gt_bi, data_out, pwm_out);
  
  parameter SIZE = 8;
  input clk, rst;
  input V_gt_bi;
  output [SIZE-1:0] data_out;
  output pwm_out;
  //wire V_ls_bi, V_gt_bi, V_eq_bi, pwm_out;
  wire [SIZE-1:0] binary_out;
  wire OUT_CLK;
  //comparator #(1) cp(Vin, pwm_out, V_ls_bi, V_gt_bi, V_eq_bi); 
  FD fd(clk, rst, OUT_CLK);
  pwm #(8) P(clk, binary_out, pwm_out); 
  binarySearchADC bs(V_gt_bi, 1'b0, OUT_CLK, 1'b0, data_out, binary_out);
  
endmodule



