module waveGenerator(input [2:0] func, input clk, rst, output reg [7:0]selectedWave); 
	wire [7:0] triWave, squareWave, sinout, rhomWave, sawWave, arbitaryWave;

	triangle tw(clk, rst, triWave);
	square sw(clk, rst, squareWave);
	rhomboid rw(clk, rst, rhomWave);
	sinWave sinw(clk, rst, sinout);
	sawtooth saww(clk, rst, sawWave); 
	assign arbitaryWave = 8'b0;
	
	always@(clk, func)begin
		case(func)
			3'b000: selectedWave <= rhomWave;
			3'b001: selectedWave <= sinout;
			3'b010: selectedWave <= squareWave;
			3'b011: selectedWave <= triWave;
			3'b100: selectedWave <= sawWave;
			3'b101: selectedWave <= arbitaryWave;
			default: selectedWave <= arbitaryWave;
		endcase 
	end

endmodule 