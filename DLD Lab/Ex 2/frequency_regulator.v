module frequency_regulator(input psi, clk, rst, input [7:0] setPerriod, input [3:0] peresentdiv, output reg [3:0] adjusteddiv);
 reg oldpsi;
 reg [7:0] duration;
 reg [7:0] adjustedDiv;
 reg [7:0] peresentDiv;
 reg increment, decrement;
 always@(posedge clk, posedge rst)begin 
  if(rst) begin
   oldpsi<=1'b0;
   peresentDiv <= {4'b1011,  peresentdiv};
  end
  else oldpsi<=psi;
 end
 always@(posedge clk, posedge rst) begin
  if(rst) duration<=8'b0;
  else begin 
   case({oldpsi, psi})
   2'b00: duration <= duration;
   2'b01: duration <= 8'b0;
   2'b10: duration <= duration;
   2'b11: duration <= duration+1;
   endcase
  end
 end
 always@(psi)begin
  if({oldpsi, psi}==2'b10)begin
   //increment <= (setPerriod < duration)?0:1;
   //decrement <= (setPerriod > duration)?0:1;
   if(setPerriod < duration) begin
     increment <= 0;
     decrement <= 1;
   end 
   else if(setPerriod > duration) begin
     increment <= 1;
     decrement <= 0;
   end 
   else if(setPerriod == duration) begin
     increment <= 0;
     decrement <= 0;
   end 
  end
 end
 always@(posedge clk, posedge rst)begin
  if(rst) begin
   adjustedDiv<=0;
  end 
  else begin 
   if({oldpsi, psi}==2'b10)begin
    adjustedDiv <= (increment)?peresentDiv+1:((decrement)?peresentDiv-1:peresentDiv);
   end 
  end
 end
 always@(posedge clk)begin
  adjusteddiv <= adjustedDiv[3:0];
 end
endmodule