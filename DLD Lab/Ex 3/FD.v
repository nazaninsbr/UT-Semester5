module FD(input clk, rst,input[1:0]load,output reg OUT_CLK, output clkOut);
reg [12:0]counter;
always@(posedge clk, posedge rst)begin
	if(rst)
		counter <= 13'b0;
	else begin
		counter <= counter+1;
		case(load)
		2'b00: OUT_CLK <= counter[9];
		2'b01: OUT_CLK <= counter[10];
		2'b10: OUT_CLK <= counter[11];
		2'b11: OUT_CLK <= counter[12];
		endcase
	end
end
assign clkOut = clk;
endmodule
