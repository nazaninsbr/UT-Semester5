module PWM2(input clk , rst, output reg OUT);
reg [7:0]Vth = 8'd67; 
reg [7:0]counter;
always @(posedge clk, posedge rst) begin
 	if (rst) begin
		OUT <= 1'b0;
 		Vth <= 8'd67;
 		counter <= 8'b00000000;
	end
	else begin 
		if(counter<Vth) OUT <= 1;
		else OUT <= 0;
	end 
 	counter <= counter + 1;
end
endmodule 