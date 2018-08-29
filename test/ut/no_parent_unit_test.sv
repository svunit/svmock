`include "svunit_defines.svh"
`include "svmock_defines.svh"

import ut_pkg::*;

module no_parent_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "no_parent_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  mock_no_parent ut;


  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);

    ut = new(/* New arguments if needed */);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */

    ut.clear();
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

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

  //-----------
  // Functions
  //-----------

  `SVTEST(vfunc0)
    `EXPECT_CALL(ut, vfunc0).exactly(1);

    ut.vfunc0();
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(vfunc1)
    `EXPECT_CALL(ut, vfunc1).exactly(1);

    ut.vfunc1(1);
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(func0)
    `EXPECT_CALL(ut, func0).exactly(1);

    void'(ut.func0());
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(func1)
    int x [$];
    `EXPECT_CALL(ut, func1).exactly(1);

    void'(ut.func1(x));
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
