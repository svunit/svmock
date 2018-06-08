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


//----------------
// VOID FUNCTIONS
//----------------

`define SVMOCK_VOIDFUNCTION0(NAME) \
  __mocker __``NAME = new("NAME", __mockers); \
  function NAME(); \
    __``NAME.Called(); \
    super.NAME(); \
  endfunction

`define SVMOCK_VOIDFUNCTION1(NAME,TYPE0,ARG0) \
  function NAME(TYPE0 ARG0); \
    super.NAME(ARG0); \
  endfunction


//--------------------
// NON-VOID FUNCTIONS
//--------------------

`define SVMOCK_FUNCTION0(NAME,RETURN) \
  function RETURN NAME(); \
    return super.NAME(); \
  endfunction

`define SVMOCK_FUNCTION1(NAME,RETURN,TYPE0,ARG0) \
  function RETURN NAME(TYPE0 ARG0); \
    return super.NAME(ARG0); \
  endfunction

//-------------
// EXPECT CALL
//-------------
`define EXPECT_CALL(OBJ,METHOD) \
  OBJ.__``METHOD

package svmock_pkg;
  class __mocker;
    int timesCnt = 0;
    int signed timesExactly = -1;
    int signed timesAtLeast = -1;

    function new(string name, ref __mocker __mockers[$]);
      __mockers.push_back(this);
    endfunction

    function void Called();
      timesCnt += 1;
    endfunction

    function void Exactly(int t);
      timesExactly = t;
    endfunction

    function void AtLeast(int t);
      timesAtLeast = t;
    endfunction

    function bit check();
      check = 1;
      if (timesExactly >= 0) return (timesCnt == timesExactly);
      else if (timesAtLeast >= 0) return (timesCnt >= timesAtLeast);
    endfunction

    function clear();
      timesCnt = 0;
      timesExactly = -1;
      timesAtLeast = -1;
    endfunction
  endclass
endpackage
