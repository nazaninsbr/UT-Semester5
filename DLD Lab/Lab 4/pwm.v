module pwm (
  clk, 
  pwm_in, 
  pwm_out
);

  parameter SIZE = 10; 
  input clk; 
  input [SIZE-1:0] pwm_in; 
  output pwm_out; 
  
  reg [SIZE-1:0] counter = {(SIZE){1'b0}}; 
  
  always@(posedge clk) counter <= counter +1'b1;

  
  assign pwm_out = (pwm_in > counter); 

endmodule 