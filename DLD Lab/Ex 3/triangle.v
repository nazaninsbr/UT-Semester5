module triangle(input clk, rst, output reg [7:0]wave); 
	reg [7:0] counter; 
	always@(posedge clk, posedge rst)begin
		if(rst) counter <=0;
		else if(counter<8'd128) wave <= counter+counter; 
		else wave <= 8'd255 - 2*(counter-8'd128);
		
		counter <=counter+1;
	end
endmodule 