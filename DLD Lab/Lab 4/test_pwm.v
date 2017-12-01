module test_pwm(); 
  
  reg clk; 
  reg [9:0] pwm_in = 10'd128; 
  wire pwm_out; 
  
  pwm #(10) P(clk, pwm_in, pwm_out); 
  
  initial begin 
    clk = 0; 
    
    repeat(100000) #10 clk = ~ clk; 
  end
  
endmodule 