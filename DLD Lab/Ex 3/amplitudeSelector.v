module amplitudeSelector(input [1:0] func, input clk, input [7:0] inWave, output reg [7:0] outWave);

	always@(func)begin 
			case(func)
				2'b00: outWave <= inWave;
				2'b01: outWave <= (inWave >> 1);
				2'b10: outWave <= (inWave >> 2);
				2'b11: outWave <= (inWave >> 3);
				default: outWave <= inWave;
			endcase 
	end

endmodule 