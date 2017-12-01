module sevenSegment(input[3:0] data_in, input clk, output segA, segB, segC, segD, segE, segF, segG, segDP);
  
  reg [7:0] segValues=8'b0; 
  always@(posedge clk)begin 
    case(data_in)
      4'b0000: segValues <= 8'b11111100;
      4'b0001: segValues <= 8'b01100000;
      4'b0010: segValues <= 8'b11011010;
      4'b0011: segValues <= 8'b11110010;
      4'b0100: segValues <= 8'b01100110;
      4'b0101: segValues <= 8'b10110110;
      4'b0110: segValues <= 8'b10111110;
      4'b0111: segValues <= 8'b11100000;
      4'b1000: segValues <= 8'b11111110;
      4'b1001: segValues <= 8'b11100110;
      4'b1010: segValues <= 8'b11101110;
      4'b1011: segValues <= 8'b00111110;
      4'b1100: segValues <= 8'b10011100;
      4'b1101: segValues <= 8'b01111010;
      4'b1110: segValues <= 8'b10011110;
      4'b1111: segValues <= 8'b10001110;
    endcase
  end 
  assign segA = segValues[0];
  assign segB = segValues[1];
  assign segC = segValues[2];
  assign segD = segValues[3];
  assign segE = segValues[4];
  assign segF = segValues[5];
  assign segG = segValues[6];
  assign segDP = segValues[7];
  
endmodule