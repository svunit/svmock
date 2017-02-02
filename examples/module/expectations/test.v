module test(
  input            clk,
  input            rst_n,

  input            bit_i,
  input      [7:0] byte_i,
  output reg       bit_o,
  output reg [7:0] byte_o
);

import svmock_pkg::*;

catcher bit_o_catcher = new();
initial begin
  svmock_pkg::_catcher.push_back(bit_o_catcher);
end

endmodule
