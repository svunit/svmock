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

  `SVTEST(TimesExactly)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).exactly(2);

    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.check());

    ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.check());

    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.check());
  `SVTEST_END

  `SVTEST(TimesAtLeast)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_least(2);

    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.check());

    ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.check());

    ut.functionNoArgReturnVoid();
    `FAIL_UNLESS(ut.check());
  `SVTEST_END

  `SVTEST(TimesAtMost)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).at_most(2);

    repeat (2) begin
      ut.functionNoArgReturnVoid();
      `FAIL_UNLESS(ut.check());
    end

    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.check());
  `SVTEST_END

  `SVTEST(TimesBetween)
    `EXPECT_CALL(ut, functionNoArgReturnVoid).between(2, 4);

    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.check());

    repeat (3) begin
      ut.functionNoArgReturnVoid();
      `FAIL_UNLESS(ut.check());
    end

    ut.functionNoArgReturnVoid();
    `FAIL_IF(ut.check());
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
