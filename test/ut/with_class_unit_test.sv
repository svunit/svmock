`include "svunit_defines.svh"
`include "svmock_defines.svh"

import ut_pkg::*;
import svmock_pkg::*;

module with_class_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "with_class_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  `MOCKER_WITH(,,_int,int,)
  _int__with _int__with_ut;

  `MOCKER_WITH(,,_intq,int,[$])
  _intq__with _intq__with_ut;

  `MOCKER_WITH(,,_logicq,logic [31:0],[$])
  _logicq__with _logicq__with_ut;

  `MOCKER_WITH(,,_bit,bit [31:0],)
  _bit__with _bit__with_ut;

  `MOCKER_WITH(,,_objtype,objtype,)
  _objtype__with _objtype__with_ut;


  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);

    _int__with_ut = new();
    _intq__with_ut = new();
    _logicq__with_ut = new();
    _bit__with_ut = new();
    _objtype__with_ut = new();
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */

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
  string exp;

  `SVUNIT_TESTS_BEGIN

  `SVTEST(_int__with_as_string)
    exp = "exp:1 act:0";
    _int__with_ut.exp = 1;

    `FAIL_UNLESS(_int__with_ut.as_string() == exp)
  `SVTEST_END

  `SVTEST(_intq__with_as_string)
    exp = "exp[0:0]:{0} act[0:0]:{1}";
    _intq__with_ut.exp = {0};
    _intq__with_ut.act = {1};

    `FAIL_UNLESS(_intq__with_ut.as_string() == exp)
  `SVTEST_END

  `SVTEST(_logicq__with_as_string)
    exp = "exp[1:0]:{0,1} act[1:0]:{1,0}";
    _logicq__with_ut.exp = {0, 1};
    _logicq__with_ut.act = {1, 0};

    `FAIL_UNLESS(_logicq__with_ut.as_string() == exp)
  `SVTEST_END

  `SVTEST(_bit__with_as_string)
    exp = "exp:5 act:0";
    _bit__with_ut.exp = 5;

    `FAIL_UNLESS(_bit__with_ut.as_string() == exp)
  `SVTEST_END

  `SVTEST(_objtype__with_as_string)
    exp = "exp:<unknown> act:<unknown>";
    _objtype__with_ut.exp = new();

    `FAIL_UNLESS(_objtype__with_ut.as_string() == exp)
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
