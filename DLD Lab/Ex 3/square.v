module square(input clk, rst, output reg [7:0]wave); 
	reg [7:0] counter; 
	always@(posedge clk, posedge rst)begin
		if(rst) counter <=0;
		else counter <=counter+1;
	end
	always@(posedge clk)begin 
		if(clk) begin 
			if(counter < 8'd128) wave =8'd255; 
			else wave = 8'd0;
		end
	end
endmodule 