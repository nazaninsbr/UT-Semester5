module mac(
  add_data_1,
  mult_data_1, 
  mult_data_2, 
  data_out
  //done
);
  parameter SIZE = 8;
  input [SIZE-1:0] add_data_1, mult_data_1, mult_data_2;
  output [SIZE-1:0] data_out;
  //output done
  reg [2*SIZE-1:0] mult_result = {(2*SIZE-1){1'b0}}; //should be changed
  
  always@(mult_data_1 or mult_data_2)begin 
	case(mult_data_1)
		2'b00: mult_result <= 0;
		2'b01: mult_result <= mult_data_2 >>2;
		2'b10: mult_result <= mult_data_2 >>3;
		2'b11: mult_result <= mult_data_2 >>4;
		endcase
  end
  
  assign data_out = add_data_1 - mult_result[SIZE-1:0];
  //assign done = 1;
endmodule 