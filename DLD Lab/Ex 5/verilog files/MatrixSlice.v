module MatrixSlice (input [2:0] PixelRow, input [6:0] Char, 
                    output [8:0] MtxPntr);
	
	reg [1:0] counter = 2'b0;					  
	reg [2:0] newRow;
	reg [8:0] mtxnew;

	always@(PixelRow, Char)begin
		counter <= counter +1; 
		mtxnew = {Char - 32, PixelRow}; 
	end
	
	assign MtxPntr = (counter==2'b01) ? mtxnew: mtxnew;
endmodule
