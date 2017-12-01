module PWM(input clk , rst ,input [7:0] amplitude, output reg OUT);
reg [7:0]Vth; 
reg [7:0]counter;
 always @(posedge clk, posedge rst) begin
 if (rst) begin
 Vth <= 128;
 counter <= 8'b00000000;
			end
 else begin
   if(clk)
     counter<=counter +1;
		end
	end
  always@(posedge clk)
  if(counter>amplitude)
  OUT <=0 ;
  else OUT <= 1 ;
endmodule 
     