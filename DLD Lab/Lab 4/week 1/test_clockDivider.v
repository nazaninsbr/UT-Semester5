module test_clockDivider(); 
  
  reg clkIn; 
  wire clkOut; 
  
  clockDivider clkdiv(clkIn, clkOut); 
  
  initial begin 
    clkIn = 0; 
    
    repeat(1000) #10 clkIn = ~ clkIn; 
  end
  
endmodule 