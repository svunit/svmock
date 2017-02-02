module test(
  input            clk,
  input            rst_n,

  input            bit0_i,
  input            bit1_i,
  input      [7:0] byte_i,

  output reg       bit0_o,
  output reg       bit1_o,
  output reg [7:0] byte_o
);

import svmock_pkg::*;

catcher bit0_o_catcher = new();
catcher bit1_o_catcher = new();
initial begin
  svmock_pkg::_catcher.push_back(bit0_o_catcher);
  svmock_pkg::_catcher.push_back(bit1_o_catcher);
end

always @(rst_n or posedge clk) begin
  if (!rst_n) begin
    bit0_o <= 0;
    bit1_o <= 0;
  end
  else begin
    bit0_o <= bit0_i;
    bit1_o <= bit1_i;
  end
end

always @(posedge clk) begin
  if (rst_n) begin
    #0 bit0_o_catcher.sample(bit0_o);
       bit1_o_catcher.sample(bit1_o);
  end
end


endmodule
