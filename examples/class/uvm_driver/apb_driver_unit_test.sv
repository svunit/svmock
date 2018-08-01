`include "uvm_macros.svh"
import uvm_pkg::*;
`include "clk_and_reset.svh"

`include "svmock_defines.svh"
`include "svunit_defines.svh"

import apb_pkg::*;
import svmock_pkg::*;
`include "uvm-mock/uvm_seq_item_port_mock.sv"

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
  apb_item _item, rsp;

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
    `ON_CALL(mock_seq_item_port, put_response).will_by_default("_put_response");

    rsp = null;
    _item = new();
    void'(_item.randomize());

    svunit_activate_uvm_component(uut);
    svunit_uvm_test_start();

    _if.pready = 0;
    _if.prdata = 0;
    reset();

    fuse(200);
  endtask


  //===================================
  // Here we deconstruct anything we 
  // need after running the Unit Tests
  //===================================
  event stop_fuse;
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

    `FAIL_UNLESS(mock_seq_item_port.check());

    ->stop_fuse;

    svunit_uvm_test_finish();
    svunit_deactivate_uvm_component(uut);

    mock_seq_item_port.flush();
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
    put_item();

    `EXPECT_CALL(mock_seq_item_port, get_next_item).at_least(1);

    #1 `FAIL_UNLESS(uut.req == _item);
  `SVTEST_END

  `SVTEST(seq_item_port_item_done)
    put_item();

    `EXPECT_CALL(mock_seq_item_port, item_done).at_least(1);

    step(10);
  `SVTEST_END


  //--------
  // WRITES
  //--------

  `SVTEST(write_setup)
    put_write();

    wait_for_psel();
    check_write_cycle();
  `SVTEST_END

  `SVTEST(write_enable)
    put_write();

    wait_for_psel();
    check_write_cycle();

    step();
    check_write_cycle(.enable(1));
  `SVTEST_END

  `SVTEST(write_enable_hold_for_wait_states)
    put_write();

    wait_for_psel();
    check_write_cycle();

    repeat(5) begin
      step();
      check_write_cycle(.enable(1));
    end
  `SVTEST_END

  `SVTEST(write_without_wait_states)
    do_xaction(.write(1), .waits(0));
  `SVTEST_END

  `SVTEST(write_with_wait_states)
    do_xaction(.write(1), .waits(20));
  `SVTEST_END


  //--------
  // READS
  //--------

  `SVTEST(read_without_wait_states)
    do_xaction(.write(0), .waits(0));
  `SVTEST_END

  `SVTEST(read_with_wait_states)
    do_xaction(.write(0), .waits(20));
  `SVTEST_END


  `SVTEST(put_read_response)
    `EXPECT_CALL(mock_seq_item_port, put_response).exactly(1);

    do_xaction(.write(0), .waits(20), .rdata('h33));
    mock_seq_item_port.rsp_mb.get(rsp);

    _item.data = 'h33;
    `FAIL_UNLESS(_item.compare(rsp));
  `SVTEST_END

  `SVUNIT_TESTS_END


  //---------
  //---------
  // helpers
  //---------
  //---------

  task do_xaction(bit write = 1, int waits = 0, bit[31:0] rdata = 0);
    if (write) put_write();
    else       put_read();

    wait_for_psel();
    if (write) check_write_cycle(.enable(0));
    else       check_read_cycle(.enable(0));

    step();
    if (write) check_write_cycle(.enable(1));
    else       check_read_cycle(.enable(1));

    repeat (waits) begin
      step();
      if (write) check_write_cycle(.enable(1));
      else       check_read_cycle(.enable(1));
    end
    set_pready();
    if (!write) _if.prdata = rdata;

    step();
    check_idle_cycle();
    set_pready(0);
    _if.prdata = 0;
  endtask

  task check_idle_cycle();
    nextSamplePoint();

    `FAIL_UNLESS(_if.psel === 0);
    `FAIL_UNLESS(_if.pwrite === 0);
    `FAIL_UNLESS(_if.penable === 0);
    `FAIL_UNLESS(_if.paddr === 0);
    `FAIL_UNLESS(_if.pwdata === 0);
  endtask

  task check_write_cycle(bit enable = 0);
    nextSamplePoint();

    `FAIL_UNLESS(_if.pwrite === 1);
    `FAIL_UNLESS(_if.penable === enable);
    `FAIL_UNLESS(_item.addr === _if.paddr);
    `FAIL_UNLESS(_item.data === _if.pwdata);
  endtask

  task check_read_cycle(bit enable = 0);
    nextSamplePoint();

    `FAIL_UNLESS(_if.pwrite === 0);
    `FAIL_UNLESS(_if.penable === enable);
    `FAIL_UNLESS(_if.paddr === _item.addr);
    `FAIL_UNLESS(_if.pwdata === 0);
  endtask

  function void put_read();
    _item.write = 0;
    put_item();
  endfunction

  function void put_write();
    _item.write = 1;
    put_item();
  endfunction

  function void put_item();
    void'(mock_seq_item_port.item_mb.try_put(_item));
  endfunction

  function void set_pready(bit ready = 1);
    _if.pready <= 1;
  endfunction

  task wait_for_psel();
    step();
    nextSamplePoint();
    while (_if.psel !== 1) begin
      step();
      nextSamplePoint();
    end
  endtask

  task wait_for_penable();
    step();
    nextSamplePoint();
    while (_if.penable !== 1) begin
      step();
      nextSamplePoint();
    end
  endtask

  task fuse(int length);
    automatic bit _fuse = 1;
    fork
      begin
        fork
          begin
            repeat (length) @(posedge clk);
            `FAIL_IF(_fuse);
          end
          begin
            @(stop_fuse);
          end
        join_any
        disable fork;
      end
    join_none
  endtask

endmodule
