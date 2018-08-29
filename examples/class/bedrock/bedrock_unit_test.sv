`include "svunit_defines.svh"
`include "svmock_defines.svh"

import bedrock_pkg::*;

import svmock_pkg::*;
`include "flintstones_mock.sv"

module bedrock_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "bedrock_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  bedrock uut;
  mock_flintstones mock_f = new();


  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);

    uut = new();
    uut.f = mock_f;
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */

    mock_f.clear();
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

    `FAIL_UNLESS(mock_f.verify());
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

  string betty [int] = '{ 0:"modern", 1:"stone age", 2:"family" }; 
  `SVUNIT_TESTS_BEGIN

  `SVTEST(dino_called_once)
    `EXPECT_CALL(mock_f, dino).exactly(1);

    uut.yabba_dabba_do(betty);
  `SVTEST_END

  `SVTEST(pebbles_called_with_betty)
    `EXPECT_CALL(mock_f, pebbles).with_args(betty.num(), betty);

    uut.yabba_dabba_do(betty);
  `SVTEST_END

  `SVTEST(bam_bam_called_with_pebbles)
    `ON_CALL(mock_f, pebbles).returns(99);
    `EXPECT_CALL(mock_f, bam_bam).with_args(99);

    uut.yabba_dabba_do(betty);
  `SVTEST_END

  `SVTEST(mr_slate_instead_of_dino)
    `ON_CALL(mock_f, dino).will_by_default("mr_slate");

    uut.yabba_dabba_do(betty);

    `FAIL_UNLESS(mock_f.mr_slate_instead)
  `SVTEST_END


  `SVUNIT_TESTS_END

endmodule
