`include "svunit_defines.svh"

import ut_pkg::*;

module with_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "with_ut";
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
  //         With Discrete
  //---------------------------------

  `SVTEST(WithOneArg)
    `EXPECT_CALL(ut, functionIntArgReturnVoid).With(3);

    ut.functionIntArgReturnVoid(3);
    `FAIL_UNLESS(ut.check());

    ut.functionIntArgReturnVoid(2);
    `FAIL_IF(ut.check());
  `SVTEST_END

  `SVTEST(WithTwoArgs)
    `EXPECT_CALL(ut, functionIntStringArgsReturnVoid).With(3, "heck");

    ut.functionIntStringArgsReturnVoid(3, "heck");
    `FAIL_UNLESS(ut.check());

    ut.functionIntStringArgsReturnVoid(3, "whack");
    `FAIL_IF(ut.check());

    ut.functionIntStringArgsReturnVoid(2, "heck");
    `FAIL_IF(ut.check());
  `SVTEST_END

  `SVTEST(WithThreeArgs)
    objtype dt = new();
 
    `EXPECT_CALL(ut, functionObjBitLogicArgsReturnVoid).With(dt, 0, 27);
 
    ut.functionObjBitLogicArgsReturnVoid(dt, 0, 27);
    `FAIL_UNLESS(ut.check());
 
    ut.functionObjBitLogicArgsReturnVoid(null, 0, 27);
    `FAIL_IF(ut.check());
  `SVTEST_END


  //---------------------------------
  //         With Array
  //---------------------------------

  `SVTEST(WithOneAssocArg)
    int peter [string] = '{ "Peter":20 };
    `EXPECT_CALL(ut, functionAssocArgReturnVoid).With(peter);
 
    ut.functionAssocArgReturnVoid(peter);
    `FAIL_UNLESS(ut.check());

    peter["Peter"] = 21; 
    ut.functionAssocArgReturnVoid(peter);
    `FAIL_IF(ut.check());
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
