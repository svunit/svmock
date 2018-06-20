//-------------------
// MOCK CLASS MACROS
//-------------------

`define SVMOCK(MOCK,ORIGINAL) \
class MOCK extends ORIGINAL; \
  __mocker __mockers [$]; \
  function bit check(); \
    check = 1; \
    foreach (__mockers[i]) begin \
      check &= __mockers[i].check(); \
    end \
  endfunction \
  function bit clear(); \
    foreach (__mockers[i]) begin \
      __mockers[i].clear(); \
    end \
  endfunction

`define SVMOCK_END endclass


//----------------------
// MOCK FUNCTION MACROS
//----------------------
`include "svmock_defines.svh"


//-------------
// EXPECT CALL
//-------------
`define EXPECT_CALL(OBJ,METHOD) \
  OBJ.__``METHOD


//-------------
// ON CALL
//-------------
`define ON_CALL(OBJ,METHOD) \
  OBJ.__``METHOD

package svmock_pkg;
  typedef class __mocker;

  `include "__mocker0.sv"
  `include "__mocker1.sv"
  `include "__mocker2.sv"
  `include "__mocker3.sv"
  `include "__mocker4.sv"
  `include "__mocker5.sv"
  `include "__mocker6.sv"
  `include "__mocker7.sv"
  `include "__mocker8.sv"
  `include "__mocker9.sv"

  class __mocker;
    int timesCnt = 0;
    int signed timesExactlyExp = -1;
    int signed timesAtLeastExp = -1;
    int signed timesAtMostExp = -1;

    bit checkWith = 0;
    bit overrideReturn = 0;
    int returnValue;

    function new(string name, ref __mocker __mockers[$]);
      __mockers.push_back(this);
    endfunction


    //-------
    // Times
    //-------

    function void exactly(int t);
      timesExactlyExp = t;
    endfunction

    function void at_least(int t);
      timesAtLeastExp = t;
    endfunction

    function void at_most(int t);
      timesAtMostExp = t;
    endfunction

    function void between(int min, int max);
      timesAtLeastExp = min;
      timesAtMostExp = max;
    endfunction


    //---------
    // returns
    //---------

    virtual function void returns(int i);
      overrideReturn = 1;
      returnValue = i;
    endfunction


    //----------
    // checking
    //----------

    virtual function bit check();
      check = 1;

      check &= (timesExactlyExp >= 0) ? (timesCnt == timesExactlyExp) : 1;
      check &= (timesAtLeastExp >= 0) ? (timesCnt >= timesAtLeastExp) : 1;
      check &= (timesAtMostExp  >= 0) ? (timesCnt <= timesAtMostExp)  : 1;

      return check;
    endfunction

    //-------------
    // clear state
    //-------------

    virtual function clear();
      timesCnt = 0;
      timesExactlyExp = -1;
      timesAtLeastExp = -1;
      timesAtMostExp = -1;
      overrideReturn = 0;

      checkWith = 0;
    endfunction
  endclass

endpackage
