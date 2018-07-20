`include "uvm_macros.svh"
import uvm_pkg::*;
`include "clk_and_reset.svh"

`include "svmock_defines.svh"
`include "svunit_defines.svh"

import apb_pkg::*;
import svmock_pkg::*;
`include "uvm_seq_item_port_mock.sv"

module apb_driver_unit_test;
  import svunit_pkg::svunit_testcase;
  import svunit_uvm_mock_pkg::*;

  string name = "apb_driver_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  `CLK_RESET_FIXTURE(5, 11)

  apb_driver uut;
  uvm_seq_item_pull_port_mock mock_seq_item_port;
  apb_item _item;

  apb_if _if(.clk(clk), .rst_n(rst_n));

  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);

    uut = new("uut");
    mock_seq_item_port = new("mock_seq_item_port", null);
    uut.seq_item_port = mock_seq_item_port;

    uvm_config_db#(virtual apb_if.master)::set(null, "uut", "vif", _if);

    svunit_deactivate_uvm_component(uut);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */

    `ON_CALL(mock_seq_item_port, get_next_item).will_by_default("_get_next_item");
    `ON_CALL(mock_seq_item_port, item_done).will_by_default("_item_done");

    _item = new();

    svunit_activate_uvm_component(uut);
    svunit_uvm_test_start();

    reset();
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

    `FAIL_UNLESS(mock_seq_item_port.check());

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

  `SVTEST(vif_connected)
    `FAIL_IF(uut.vif == null);
  `SVTEST_END

  `SVTEST(get_next_item_is_req)
    mock_seq_item_port.item_mb.put(_item);

    `EXPECT_CALL(mock_seq_item_port, get_next_item).at_least(2);

    #1 `FAIL_UNLESS(uut.req == _item);
  `SVTEST_END

  `SVTEST(seq_item_port_item_done)
    mock_seq_item_port.item_mb.put(_item);

    `EXPECT_CALL(mock_seq_item_port, item_done).at_least(1);
    #1;
  `SVTEST_END


  `SVUNIT_TESTS_END

endmodule
