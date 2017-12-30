module CharacterPointer (input [9:0] PixelRow, PixelCol, output [12:0] CharPntr);

   wire [6:0] ScreenLine, ScreenPos;
   assign ScreenLine = PixelRow [9:3]; 
          // 60 Lines=480/8 (8 is Character Pixel Hight)
   assign ScreenPos = PixelCol [9:3];  
          // 80 Positions=640/8 (8 is Character Pixel Width)
   assign CharPntr =  ScreenLine*80 + ScreenPos;
endmodule 