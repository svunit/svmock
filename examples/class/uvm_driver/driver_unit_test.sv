`include "uvm_macros.svh"
import uvm_pkg::*;

`include "svmock_defines.svh"
`include "svunit_defines.svh"

import driver_pkg::*;
import svmock_pkg::*;
`include "uvm_seq_item_port_mock.sv"

module driver_unit_test;
  import svunit_pkg::svunit_testcase;
  import svunit_uvm_mock_pkg::*;

  string name = "driver_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  driver uut;
  //uvm_seq_item_pull_port_mock mock_seq_item_port;

  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);

    uut = new("uut");
    //mock_seq_item_port = new("mock_seq_item_port", null);
    //uut.seq_item_port = mock_seq_item_port;

    svunit_deactivate_uvm_component(uut);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */

    svunit_activate_uvm_component(uut);
    svunit_uvm_test_start();
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

    svunit_uvm_test_finish();
    svunit_deactivate_uvm_component(uut);
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

  `SVTEST(connectivity)
    #10;
  `SVTEST_END


  `SVUNIT_TESTS_END

endmodule
