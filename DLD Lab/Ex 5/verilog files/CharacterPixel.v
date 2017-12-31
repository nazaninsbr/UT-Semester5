module CharacterPixel(
	input [7:0] CharacterRow,
	input [2:0] CharColPntr, output Pixel);
	wire [2:0] indx = {CharColPntr[2], CharColPntr[1], CharColPntr[0]};
	wire [7:0] Vector = {
		CharacterRow[0], CharacterRow[1],
		CharacterRow[2], CharacterRow[3],
		CharacterRow[4], CharacterRow[5],
		CharacterRow[6], CharacterRow[7]
	};
	
	assign Pixel = Vector[indx];
	
endmodule 