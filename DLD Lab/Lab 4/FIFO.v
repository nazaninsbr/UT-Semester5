module FIFO (
 clk, 
 rst, 
 rd_cs,
 rd_en,  
 wr_cs,
 wr_en, 
 data_in, 
 data_out, 
 empty, 
 full);
  
  parameter DATA_SIZE = 32; 
  parameter ADDR_SIZE = 32; 
  parameter RAM_SIZE = 1 << ADDR_SIZE; 
  
  input clk, rst, rd_cs, rd_en, wr_cs, wr_en; 
  
  output empty, full; 
  
  input [DATA_SIZE-1:0] data_in;  
  
  output [DATA_SIZE-1:0] data_out;
  
  
  reg [ADDR_SIZE-1: 0] wr_pointer; 
  reg [ADDR_SIZE-1: 0] rd_pointer; 
  reg [ADDR_SIZE: 0] status_cnt; 
  reg [DATA_SIZE-1: 0] data_out; 
  wire [DATA_SIZE-1: 0] data_ram; 
  
  ramModule #(DATA_SIZE, ADDR_SIZE, RAM_SIZE) fifoRam(wr_pointer, data_in, wr_cs, wr_en, 1'b0, rd_pointer, data_ram, rd_cs, 1'b0, rd_en);
  
  
  assign full = (status_cnt==(RAM_SIZE-1));
  assign empty = (status_cnt==0);
  
  //write pointer
  always@(posedge clk or posedge rst)begin 
    if(rst)begin 
      wr_pointer <= 0;
    end else if(wr_cs && wr_en)begin 
      wr_pointer <= wr_pointer +1;
    end
  end
  
  //read pointer
  always@(posedge clk or posedge rst)begin 
    if(rst)begin 
      rd_pointer <= 0;
    end else if(rd_cs && rd_en)begin 
      rd_pointer <= rd_pointer +1;
    end
  end
  
  //read data
  always@(posedge clk or posedge rst)begin 
    if(rst)begin 
      data_out <= 0;
    end else if(rd_cs && rd_en)begin 
      data_out <= data_ram;
    end
  end
  
  //status counter 
  always@(posedge clk or posedge rst)begin 
    if(rst)begin 
      status_cnt <= 0;
    end else if((rd_cs && rd_en) && !(wr_cs && wr_en) && (status_cnt!=0))begin 
      status_cnt <= status_cnt -1;
    end  else if( !(rd_cs && rd_en) && (wr_cs && wr_en) && (status_cnt!= RAM_SIZE))begin 
      status_cnt <= status_cnt +1;
    end
  end
  
  
endmodule 