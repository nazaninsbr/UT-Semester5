module PWM(input clk , rst ,input [7:0] amplitude, output reg OUT);
reg [7:0]Vth; 
reg [7:0]counter;
always @(posedge clk, posedge rst) begin
 	if (rst) begin
		OUT = 1'b0;
 		Vth = amplitude;
 		counter = 8'b00000000;
	end
 	else if(counter<amplitude) OUT = 1;
 	else OUT = 0;
 	counter = counter + 1;	
end
endmodule 