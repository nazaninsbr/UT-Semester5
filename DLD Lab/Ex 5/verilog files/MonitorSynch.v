module MonitorSynch (input PixelOn,
                     input RedIn, GreenIn, BlueIn, Reset, SynchClock, 
                     output Red, Green, Blue,
                     output Hsynch, Vsynch,
                     output [9:0] PixelRow, PixelCol);
   reg [9:0] Hcount, Vcount;
	reg [9:0] counter = 10'd0;
   always @(posedge SynchClock) begin
      if (~Reset) Hcount = 0;
      else 
         if (Hcount == 799) Hcount =0; else Hcount <= Hcount + 1;
   end
   always @(posedge SynchClock) begin
      if (~Reset) Vcount = 0;
      else 
         if (Vcount >= 525 && Hcount >= 756) Vcount = 0;
         else if (Hcount == 756) Vcount <= Vcount + 1;
   end
	
   assign Hsynch = (Hcount >= 661 && Hcount <= 756) ? 0 : 1;
   assign Vsynch = (Vcount >= 491 && Vcount <= 493) ? 0 : 1;
   assign {Red, Green, Blue} = (Hcount <= 640 && Vcount < 480) ? 
          {PixelOn & RedIn, PixelOn & GreenIn, PixelOn & BlueIn} : 0;
   assign PixelCol = (Hcount <= 640) ? (Hcount>>2) : 0;
   assign PixelRow = (Vcount <= 480) ? (Vcount>>2) : 0;
	
endmodule
