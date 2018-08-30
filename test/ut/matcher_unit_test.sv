`include "svunit_defines.svh"
`include "svmock_defines.svh"

import ut_pkg::*;

module match_unit_test;
  import svunit_pkg::svunit_testcase;
  import svmock_pkg::*;

  string name = "match_ut";
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
  //          eq matches
  //---------------------------------
  `SVTEST(WithArgsAppliedOnce)
    `EXPECT_CALL(ut, functionIntArgReturnVoid).match_args(int_eq(3));
    ut.functionIntArgReturnVoid(3);
    `FAIL_UNLESS(ut.verify());
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
