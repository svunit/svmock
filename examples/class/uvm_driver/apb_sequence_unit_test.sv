`include "uvm_macros.svh"
import uvm_pkg::*;

`include "svmock_defines.svh"
`include "svunit_defines.svh"

import apb_pkg::*;
import svmock_pkg::*;

`include "apb_sequence_mock.sv"

module apb_sequence_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "apb_sequence_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  apb_sequence_mock uut;
  apb_item req;


  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);

    uut = new(/* New arguments if needed */);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */
    `ON_CALL(uut, start).will_by_default("_start");

    uut.randomize();
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

    `FAIL_UNLESS(uut.check())
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

  `SVTEST(start)
    `EXPECT_CALL(uut, start_item).exactly(uut.num_transactions);
    `EXPECT_CALL(uut, start_item).at_most(10);
    `EXPECT_CALL(uut, start_item).at_least(7);

    `EXPECT_CALL(uut, finish_item).exactly(uut.num_transactions);

    uut.start(uut.sqr);
  `SVTEST_END

  `SVTEST(req_constraints)
    uut.start(uut.sqr);

    repeat (uut.num_transactions) begin
      uut.get_response(req);

      `FAIL_UNLESS(req.addr < uut.max_addr)
      if (req.write) begin
        `FAIL_UNLESS(req.data[0] === 1)
      end
    end
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
