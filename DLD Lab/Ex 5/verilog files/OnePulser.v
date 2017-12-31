module OnePulser (input clk, LongPulse, output reg SinglePulse);
  reg [1:0] p_state, n_state;
  
  always @(posedge clk) p_state <= n_state;
  
  always @(p_state, LongPulse) begin
    n_state = 2'b0;
    SinglePulse = 1'b1;
    case (p_state)
      2'd00: n_state = (LongPulse) ? 2'd00 : 2'd01;
      2'd01: begin
                n_state = 2'd02;
                SinglePulse = 1'b0;
             end
      2'd02: n_state = (~LongPulse) ? 2'd02 : 2'd00;
      default: n_state = 2'd00;
    endcase
  end
endmodule 