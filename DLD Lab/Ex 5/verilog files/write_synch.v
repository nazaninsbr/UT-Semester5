module write_synch (input clk, wrt, slc, output en_n, busy);
   // slc: slow clock; en_n: active low enable
   reg [1:0] p_state, n_state;
   always @(posedge clk) p_state <= n_state;
   always @(p_state, wrt, slc)
      case (p_state)
         2'b00: if (wrt) n_state = 2'b01; else n_state = 2'b00; 
         2'b01: if (slc) n_state = 2'b10; else n_state = 2'b01;
         2'b10: if (slc) n_state = 2'b10; else n_state = 2'b11;
         2'b11: if (wrt) n_state = 2'b11; else n_state = 2'b00;
         default: n_state = 2'b00;
      endcase
   assign busy = (p_state != 2'b00) ? 1 : 0;//((p_state != 2'b00) | wrt) ? 1 : 0; works but with comb. feedback
   assign en_n = (p_state == 2'b10) ? 0 : 1;
endmodule

         