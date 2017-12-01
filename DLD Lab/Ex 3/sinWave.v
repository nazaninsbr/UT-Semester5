module sinWave(input clk, rst, output [7:0] sinout);
	reg [15:0] cosprev, sinprev;
	reg[15:0] sinwave, coswave;
	always@(posedge rst, posedge clk)begin
		if(rst)begin
			sinprev <= 0;
			cosprev <= 16'd30000;
		end
		else begin 
			sinprev <= sinwave;
			if(~(coswave==0)) cosprev <= coswave;
		end 
	end
	always@(posedge clk, posedge rst)begin
		if(rst) begin
			sinwave <=0; 
			coswave <=0;
		end
		else begin 
			sinwave <= sinprev + {{(6){cosprev[15]}}, cosprev[15:6]};
			coswave <= cosprev - {{(6){sinwave[15]}}, sinwave[15:6]};
		end
	end
	assign sinout = sinwave[15:8]+8'd127;
endmodule
