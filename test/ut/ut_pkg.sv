`include "svmock_pkg.sv"

package ut_pkg;
  import svmock_pkg::*;

  `include "call.sv"
  `include "mock_no_parent.sv"
  `include "mock_call.sv"
  `include "mock_second_no_parent.sv"
  `include "mock_second.sv"
endpackage
