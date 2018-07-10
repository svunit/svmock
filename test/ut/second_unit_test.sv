`include "svunit_defines.svh"
`include "svmock_defines.svh"

import ut_pkg::*;

module second_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "second_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  mock_second ut;

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

  string o;
  `SVUNIT_TESTS_BEGIN

  // unit tests for on_call. here's a template from
  // googlemock as a guide...
  //
  //   ON_CALL(mock_object, Method(argument-matchers))
  //       .With(multi-argument-matcher)
  //       .WillByDefault(action);


  //---------------------------------
  //        will_by_default
  //---------------------------------

  `SVTEST(willByDefault_functionNoArgReturnString)
    `ON_CALL(ut, functionNoArgReturnString).will_by_default("option3");

    o = "functionNoArgReturnString::option3";
    `FAIL_UNLESS(ut.functionNoArgReturnString() == o);
  `SVTEST_END

  `SVTEST(willByDefault_functionIntArgReturnVoid)
    `ON_CALL(ut, functionIntArgReturnVoid).will_by_default("option4");
 
    ut.functionIntArgReturnVoid(99);
    `FAIL_UNLESS(ut.wayne == 99);
  `SVTEST_END

  `SVTEST(willByDefault_taskNoArg)
    `ON_CALL(ut, taskNoArg).will_by_default("option5");
 
    ut.taskNoArg();
    `FAIL_UNLESS(ut.mario == 66);
  `SVTEST_END
 
 
  //---------------------------------
  //             misc
  //---------------------------------
  `SVTEST(parent_is_assigned)
    `FAIL_IF(ut.__functionIntArgReturnVoid.parent == null);
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
