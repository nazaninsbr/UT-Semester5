module part2(
  clk, 
  rst,
  beta, 
  Vin,
  segA, segB, segC, segD, segE, segF, segG, segDP,
  segA1, segB1, segC1, segD1, segE1, segF1, segG1, segDP1,
	segA2, segB2, segC2, segD2, segE2, segF2, segG2, segDP2,
  segA3, segB3, segC3, segD3, segE3, segF3, segG3, segDP3, 
  pwm_out,
  binary_out
);
  parameter SIZE = 8;
  output binary_out;
  input clk, rst, Vin;
  input [1:0] beta;
  output segA, segB, segC, segD, segE, segF, segG, segDP;
  output  segA1, segB1, segC1, segD1, segE1, segF1, segG1, segDP1;
  output  segA2, segB2, segC2, segD2, segE2, segF2, segG2, segDP2;
  output  segA3, segB3, segC3, segD3, segE3, segF3, segG3, segDP3;
  
  output pwm_out;
  wire [SIZE-1:0] data_out; 
  wire [SIZE-1:0] echo;
  
  pwm #(SIZE) P(clk, echo, pwm_out); 
  singleEcho #(SIZE) processor(data_out, beta, clk, rst, echo);
  part1_analog #(SIZE) p1a(clk, 1'b0, Vin, data_out, binary_out);
  display d1(clk, data_out, segA, segB, segC, segD, segE, segF, segG, segDP,
  segA1, segB1, segC1, segD1, segE1, segF1, segG1, segDP1,
	segA2, segB2, segC2, segD2, segE2, segF2, segG2, segDP2,
  segA3, segB3, segC3, segD3, segE3, segF3, segG3, segDP3);
  
endmodule 