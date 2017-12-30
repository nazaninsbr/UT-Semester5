module ramModule(
  address_0, 
  data_0, 
  cs_0, 
  we_0, 
  oe_0, 
  address_1, 
  data_1, 
  cs_1, 
  we_1, 
  oe_1,
);
  
  parameter DATA_SIZE = 32; 
  parameter ADDR_SIZE = 32; 
  parameter RAM_SIZE = 1 << ADDR_SIZE; 
  
  input [ADDR_SIZE-1:0] address_0, address_1; 
  input cs_0, we_0, oe_0, cs_1, we_1, oe_1;
  
  
  inout [DATA_SIZE-1:0] data_0, data_1; 
  
  reg [DATA_SIZE-1:0] data_0_out, data_1_out;
  reg [DATA_SIZE-1:0] mem [0:RAM_SIZE-1];
  
  //memory write 
  always@(address_0 or cs_0 or data_0 or we_0 or we_1 or address_1 or cs_1 or data_1)begin 
    if(cs_0 && we_0)begin 
      mem[address_0] <= data_0;
    end else if(cs_1 && we_1)begin
      mem[address_1] <= data_1;
    end
  end
  
  //memory read 0 
  always@(address_0 or cs_0 or we_0 or oe_0)begin 
    if(cs_0 && !we_0 && oe_0)begin 
      data_0_out <= mem[address_0];
    end else begin 
      data_0_out <= 0;
    end 
  end
  
  //memory read 1
  always@(address_1 or cs_1 or we_1 or oe_1)begin 
    if(cs_1 && !we_1 && oe_1)begin 
      data_1_out <= mem[address_1];
    end else begin 
      data_1_out <= 0;
    end 
  end
  
  //tri state output 
  assign data_0 = (cs_0 && oe_0 && !we_0)? data_0_out:8'bz;
  assign data_1 = (cs_1 && oe_1 && !we_1)? data_1_out:8'bz;
  
endmodule