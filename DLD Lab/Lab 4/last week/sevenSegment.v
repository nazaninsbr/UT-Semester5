module sevenSegment(input[3:0] data_in, input clk, output segA, segB, segC, segD, segE, segF, segG, segDP);
  
  reg [7:0] segValues=8'b0; 
  always@(posedge clk)begin                //is clock needed? would @data_in work?
    case(data_in)
      4'b0000: segValues <= 8'b11000000;
      4'b0001: segValues <= 8'b11111001;
      4'b0010: segValues <= 8'b10100100;
      4'b0011: segValues <= 8'b10110000;
      4'b0100: segValues <= 8'b10011001;
      4'b0101: segValues <= 8'b10010010;
      4'b0110: segValues <= 8'b10000010;
      4'b0111: segValues <= 8'b11111000;
      4'b1000: segValues <= 8'b10000000;
      4'b1001: segValues <= 8'b10011000;
      4'b1010: segValues <= 8'b10001000;
      4'b1011: segValues <= 8'b10000011;
      4'b1100: segValues <= 8'b11000110;
      4'b1101: segValues <= 8'b10100001;
      4'b1110: segValues <= 8'b10000110;
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