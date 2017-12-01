module sawtooth(input clk, rst, output reg [7:0]wave); 
	reg [7:0] counter;
	reg [7:0] counter2 = 8'b0;
	always@(posedge clk, posedge rst)begin
		if(rst) begin 
			counter <=0;
		end
		else wave <= counter;
		counter <=counter+1;
	end
	always@(counter) begin	
		if(counter==8'd128) counter2 <= counter2 +1;
	end
endmodule 