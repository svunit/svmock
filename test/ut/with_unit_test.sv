`include "svunit_defines.svh"
`include "svmock_defines.svh"

import ut_pkg::*;

module has_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "with_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  mock_call ut;

  int assocPeter [string] = '{ "Peter":20 };
  int queueHank [$] = { 14, 15, 16 };
  string fixedGlenn [10] = '{10{"clank"}};
  objtype dynamicFred [];


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
    set_defaults();

    ut.clear();
  endtask

  function void set_defaults();
    assocPeter = '{ "Peter":20 };
    queueHank = { 14, 15, 16 };
    fixedGlenn = '{10{"clank"}};
    dynamicFred = new[10];
    foreach (dynamicFred[i]) dynamicFred[i] = new();
  endfunction


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
  //        Queuing Checks
  //---------------------------------
  `SVTEST(WithArgsAppliedOnce)
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);
    ut.functionIntArgReturnVoid(3);
    `FAIL_UNLESS(ut.verify());

    ut.functionIntArgReturnVoid(2);
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(MultipleExpectCallsOneFailure)
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);

    ut.functionIntArgReturnVoid(3);
    ut.functionIntArgReturnVoid(2);
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(MultipleExpectCallsMultipleFailures)
    `EXPECT_CALL(ut, functionIntStringArgsReturnVoid).with_args(2, "red");
    `EXPECT_CALL(ut, functionIntStringArgsReturnVoid).with_args(2, "green");
    `EXPECT_CALL(ut, functionIntStringArgsReturnVoid).with_args(3, "blue");

    ut.functionIntStringArgsReturnVoid(1, "red");
    ut.functionIntStringArgsReturnVoid(2, "green");
    ut.functionIntStringArgsReturnVoid(4, "green");
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(MultipleExpectCallsWithMoreActual)
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(4);

    ut.functionIntArgReturnVoid(3);
    ut.functionIntArgReturnVoid(3);
    ut.functionIntArgReturnVoid(4);
    ut.functionIntArgReturnVoid(1);
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  //---------------------------------
  //         With Discrete
  //---------------------------------

  `SVTEST(WithOneArg)
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);
    ut.functionIntArgReturnVoid(3);
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);
    ut.functionIntArgReturnVoid(2);
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(WithTwoArgs)
    `EXPECT_CALL(ut, functionIntStringArgsReturnVoid).with_args(3, "heck");
    ut.functionIntStringArgsReturnVoid(3, "heck");
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionIntStringArgsReturnVoid).with_args(3, "heck");
    ut.functionIntStringArgsReturnVoid(3, "whack");
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, functionIntStringArgsReturnVoid).with_args(3, "heck");
    ut.functionIntStringArgsReturnVoid(2, "heck");
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(WithThreeArgs)
    objtype dt = new();
 
    `EXPECT_CALL(ut, functionObjBitLogicArgsReturnVoid).with_args(dt, 0, 27);
    ut.functionObjBitLogicArgsReturnVoid(dt, 0, 27);
    `FAIL_UNLESS(ut.verify());
 
    `EXPECT_CALL(ut, functionObjBitLogicArgsReturnVoid).with_args(dt, 0, 27);
    ut.functionObjBitLogicArgsReturnVoid(null, 0, 27);
    `FAIL_IF(ut.verify());
  `SVTEST_END


  //---------------------------------
  //      With Aggregate Types
  //---------------------------------

  `SVTEST(WithAssocArg)
    `EXPECT_CALL(ut, functionAssocArgReturnVoid).with_args(assocPeter);
    ut.functionAssocArgReturnVoid(assocPeter);
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionAssocArgReturnVoid).with_args(assocPeter);
    assocPeter["Peter"] = 21; 
    ut.functionAssocArgReturnVoid(assocPeter);
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(WithQueueArg)
    `EXPECT_CALL(ut, functionQueueArgReturnVoid).with_args(queueHank);
    ut.functionQueueArgReturnVoid(queueHank);
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionQueueArgReturnVoid).with_args(queueHank);
    queueHank[0] = 21; 
    ut.functionQueueArgReturnVoid(queueHank);
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, functionQueueArgReturnVoid).with_args(queueHank);
    set_defaults();
    queueHank.push_back(99);
    ut.functionQueueArgReturnVoid(queueHank);
    `FAIL_IF(ut.verify());

    void'(queueHank.pop_back());
    `EXPECT_CALL(ut, functionQueueArgReturnVoid).with_args(queueHank);
    ut.functionQueueArgReturnVoid(queueHank);
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(WithAssocQueueArg)
    `EXPECT_CALL(ut, functionAssocQueueArgReturnVoid).with_args(assocPeter, queueHank);
    ut.functionAssocQueueArgReturnVoid(assocPeter, queueHank);
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionAssocQueueArgReturnVoid).with_args(assocPeter, queueHank);
    queueHank[0] = 21; 
    ut.functionAssocQueueArgReturnVoid(assocPeter, queueHank);
    `FAIL_IF(ut.verify());

    `EXPECT_CALL(ut, functionAssocQueueArgReturnVoid).with_args(assocPeter, queueHank);
    set_defaults();
    assocPeter["Peter"] = 21; 
    ut.functionAssocQueueArgReturnVoid(assocPeter, queueHank);
    `FAIL_IF(ut.verify());

    set_defaults();
    `EXPECT_CALL(ut, functionAssocQueueArgReturnVoid).with_args(assocPeter, queueHank);
    ut.functionAssocQueueArgReturnVoid(assocPeter, queueHank);
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVTEST(WithFixedArrayArg)
    `EXPECT_CALL(ut, functionFixedArrayArgReturnVoid).with_args(fixedGlenn, 8);
    ut.functionFixedArrayArgReturnVoid(fixedGlenn, 8);
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionFixedArrayArgReturnVoid).with_args(fixedGlenn, 8);
    fixedGlenn[0] = "feathers"; 
    ut.functionFixedArrayArgReturnVoid(fixedGlenn, 8);
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(WithDynamicArrayArg)
    `EXPECT_CALL(ut, functionDynamicArrayArgReturnVoid).with_args("what", dynamicFred, 44);
    ut.functionDynamicArrayArgReturnVoid("what", dynamicFred, 44);
    `FAIL_UNLESS(ut.verify());

    `EXPECT_CALL(ut, functionDynamicArrayArgReturnVoid).with_args("what", dynamicFred, 44);
    dynamicFred[8] = new();
    ut.functionDynamicArrayArgReturnVoid("what", dynamicFred, 44);
    `FAIL_IF(ut.verify());
  `SVTEST_END

  `SVTEST(exp_and_act_are_cleared)
    `EXPECT_CALL(ut, functionIntArgReturnVoid).with_args(3);

    `FAIL_UNLESS(ut.__functionIntArgReturnVoid.__with_0.size() == 1);
    ut.clear();
    `FAIL_UNLESS(ut.__functionIntArgReturnVoid.__with_0.size() == 0);
  `SVTEST_END

  
  //---------------------------------
  //      default args
  //---------------------------------
  `SVTEST(OneDefault)
    `EXPECT_CALL(ut, functionIntArgReturnInt).with_args(14);
    void'(ut.functionIntArgReturnInt());
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
