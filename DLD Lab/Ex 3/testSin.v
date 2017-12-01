module testSin(); 
  reg clk, rst; 
  wire [7:0] sinWave; 
  sinWave swg(clk, rst, sinWave);
  initial begin 
    rst=0; 
    clk = 0; 
    #10
    clk = 1; 
    #10 
    rst = 1; 
    clk = 0; 
    #10 
    clk= 1; 
    #10
    rst = 0; 
    clk = 0; 
    repeat (1000) begin 
      #10 clk = ~clk; 
    end
  end
endmodule 