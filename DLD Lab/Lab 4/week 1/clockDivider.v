module clockDivider(
  clockIn, 
  clockOut
); 

  input clockIn; 
  output clockOut; 
  reg [19:0] counter = 20'd0; 
  parameter DIVISOR = 20'd20; 
  
  always@(posedge clockIn)begin 
    counter <= counter + 20'd1; 
    if(counter >=(DIVISOR-1)) counter <= 20'd0;
  end 
  
  assign clockOut = (counter <DIVISOR/2)? 1'b0: 1'b1; 
  
endmodule 