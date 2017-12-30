module binarySearchADC(comp_gt, comp_eq, clk, rst, out_val, mid);
  
  input comp_gt, comp_eq, clk, rst; 
  output reg [7:0] mid;
  output [7:0] out_val;
  reg [7:0]temp=0;
  reg [8:0] sum = 9'b0;
  reg [3:0] counter = 4'd0;
  reg [7:0] first = 8'd0;
  reg [7:0] last = 8'b11111111;
 
  always@(posedge clk)begin 
	counter <= counter+1;
    if(counter==4'd9) begin 
      first <= 8'd0;
      last <= 8'b11111111;
		counter <= 4'd0;
    end
	 /*if((temp+1 == mid) || (temp -1 == mid))begin
	 first = 8'd0;
	 last = 8'b11111111;
	 end*/
    else begin
      if(~comp_eq)begin 
        if(comp_gt)begin 
          first <= mid;
        end else begin 
          last <= mid;
        end
      end
    end
    
  end
  
  always@(negedge clk) begin
    sum <= ((first+last)>>1);
    mid <= sum[7:0];
  end
  
  assign out_val =  mid;
  
  
  
endmodule 
