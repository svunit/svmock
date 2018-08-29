`include "svunit_defines.svh"
`include "svmock_defines.svh"

import ut_pkg::*;

module times_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "times_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  mock_call ut;


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

  // unit tests for expect_call. here's a template from
  // googlemock as a guide...
  //
  // EXPECT_CALL(mock_object, Method(argument-matchers))
  //     .With(multi-argument-matchers)
  //     .Times(cardinality) // AtLeast, AtMost, Between, Exactly
  //     .InSequence(sequences)
  //     .After(expectations)
  //     .WillOnce(action)
  //     .WillRepeatedly(action)
  //     .RetiresOnSaturation();


  //---------------------------------
  //             Times
  //---------------------------------

  //-----------
  // Functions
  //-----------

  `SVTEST(functionTimesExactly)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).exactly(2);
    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).exactly(2);
    repeat (2) ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).exactly(2);
    repeat (3) ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(functionTimesAtLeast)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_least(2);
    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_least(2);
    repeat (2) ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_least(2);
    repeat (3) ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(functionTimesAtMost)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_most(2);
    ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_most(2);
    repeat (2) ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_most(2);
    repeat (3) ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(functionTimesBetween)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).between(2, 4);
    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).between(2, 4);
    repeat (2) ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).between(2, 4);
    repeat (3) ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).between(2, 4);
    repeat (4) ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionNoArgReturnVoid).between(2, 4);
    repeat (5) ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.verify());
  `SVTEST_END


  //-------
  // Tasks
  //-------

  `SVTEST(taskTimesExactly)
    `EXPECT_CALL(ut, taskNoArg).exactly(2);
    ut.taskNoArg();
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).exactly(2);
    repeat (2) ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).exactly(2);
    repeat (3) ut.taskNoArg();
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(taskTimesAtLeast)
    `EXPECT_CALL(ut, taskNoArg).at_least(2);
    ut.taskNoArg();
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).at_least(2);
    repeat (2) ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).at_least(2);
    repeat (3) ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(taskTimesAtMost)
    `EXPECT_CALL(ut, taskNoArg).at_most(2);
    ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).at_most(2);
    repeat (2) ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).at_most(2);
    repeat (3) ut.taskNoArg();
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(taskTimesBetween)
    `EXPECT_CALL(ut, taskNoArg).between(2, 4);
    ut.taskNoArg();
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).between(2, 4);
    repeat (2) ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).between(2, 4);
    repeat (3) ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).between(2, 4);
    repeat (4) ut.taskNoArg();
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, taskNoArg).between(2, 4);
    repeat (5) ut.taskNoArg();
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
