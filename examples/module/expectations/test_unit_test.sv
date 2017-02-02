`include "svmock_pkg.sv"
`include "svunit_defines.svh"
`include "test.v"
`include "clk_and_reset.svh"

module test_unit_test;
  import svunit_pkg::svunit_testcase;
  import svmock_pkg::*;

  string name = "test_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  logic       bit0_i, bit1_i;
  logic [7:0] byte_i;
  wire       bit0_o, bit1_o;
  wire [7:0] byte_o;

  `CLK_RESET_FIXTURE(5, 11)

  test my_test(.clk(clk),
               .rst_n(rst_n),
               .bit0_i(bit0_i),
               .bit1_i(bit1_i),
               .bit0_o(bit0_o),
               .bit1_o(bit1_o),
               .byte_o(byte_o),
               .byte_i(byte_i));


  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */
    bit0_i = 1;
    bit1_i = 1;
    byte_i = 0;
    reset();
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */
    `EVALUATE
  endtask


  //===================================
  // All tests are defined between the
  // SVUNIT_TESTS_BEGIN/END macros
  //
  // Each individual test must be
  // defined between `SVTEST(_NAME_)
  // `SVTEST_END
  //
  // i.e.
  //   `SVTEST(mytest)
  //     <test code>
  //   `SVTEST_END
  //===================================
  `SVUNIT_TESTS_BEGIN

  //  Value: LT(), NEQ(), EQ(), GT(), BETWEEN(a,b), WITHIN([a..b])
  //  When: AT(a), AFTER(a), BEFORE(b), WITHIN(a,b), BECAUSE_OF(expr)
  //  Repeated: ONCE, TIMES(n), `CONSECUTIVELY()

  // Temporal expectation
  `SVTEST(immediate_failed_expect_x)
    `EXPECT(my_test,bit0_o)
    step();
  `SVTEST_END

  `SVTEST(immediate_failed_expect_w_expr)
    `EXPECT(my_test,bit0_o)
      `EQ(0)
    step();
  `SVTEST_END

  `SVTEST(immediate_passed_expect_w_expr)
    `EXPECT(my_test,bit1_o)
      `EQ(1)
    step();
  `SVTEST_END

  `SVTEST(at_failed_expect)
    `EXPECT(my_test,bit1_o)
      `EQ(0)
      `AT(2)

    step(1);
    nextSamplePoint();
    bit1_i = 0;

    step(2);
  `SVTEST_END

// `SVTEST(at_expectation)
//   `EXPECT(my_test, bit_o)
//     `EQ(0)
//     `AT(8)
//
//   step(9);
// `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
