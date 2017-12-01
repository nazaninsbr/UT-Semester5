module rhomboid(input clk, rst, output reg [7:0]wave); 
	reg [7:0] counter; 
	always@(posedge clk, posedge rst)begin 
		if(rst) counter<=0;
		else begin 
			if(counter < 8'd128) begin
				if(counter[0]==1) wave <= 8'd127+counter;
				else wave <= 8'd127-counter;
			end
			else begin
				if(counter[0]) wave <= 8'd255 -(counter-8'd127);
				else wave <=(counter - 8'd127);
			end
		end
		counter <= counter+1;
	end
endmodule 