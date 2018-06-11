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
  __mocker __``NAME = new("NAME", __mockers); \
  function NAME(TYPE0 ARG0); \
    __``NAME.Called(ARG0); \
    super.NAME(ARG0); \
  endfunction

`define SVMOCK_VOIDFUNCTION2(NAME,TYPE0,ARG0,TYPE1,ARG1) \
  __mocker __``NAME = new("NAME", __mockers); \
  function NAME(TYPE0 ARG0, TYPE1 ARG1); \
    __``NAME.Called(ARG0, ARG1); \
    super.NAME(ARG0, ARG1); \
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
    int signed timesExactlyExp = -1;
    int signed timesAtLeastExp = -1;
    int signed timesAtMostExp = -1;

    __mocker Times;

    function new(string name, ref __mocker __mockers[$]);
      __mockers.push_back(this);
      Times = this;
    endfunction


    //-------
    // Times
    //-------

    int withAct_i = -1;
    string withAct_s = "";
    function void Called(int i = 0, string s = "");
      timesCnt += 1;

      withAct_i = i;
      withAct_s = s;
    endfunction

    function void Exactly(int t);
      timesExactlyExp = t;
    endfunction

    function void AtLeast(int t);
      timesAtLeastExp = t;
    endfunction

    function void AtMost(int t);
      timesAtMostExp = t;
    endfunction

    function void Between(int min, int max);
      timesAtLeastExp = min;
      timesAtMostExp = max;
    endfunction


    //------
    // With
    //------
    bit checkWith = 0;
    int withExp_i = -1;
    string withExp_s = "";
    function void With(int i, string s);
      checkWith = 1;
      withExp_i = i;
      withExp_s = s;
    endfunction

    function bit check();
      check = 1;

      check &= (timesExactlyExp >= 0) ? (timesCnt == timesExactlyExp) : 1;
      check &= (timesAtLeastExp >= 0) ? (timesCnt >= timesAtLeastExp) : 1;
      check &= (timesAtMostExp  >= 0) ? (timesCnt <= timesAtMostExp)  : 1;

      check &= (checkWith) ? (withExp_i == withAct_i)  : 1;
      check &= (checkWith) ? (withExp_s == withAct_s)  : 1;

      return check;
    endfunction

    function clear();
      timesCnt = 0;
      timesExactlyExp = -1;
      timesAtLeastExp = -1;
      timesAtMostExp = -1;

      checkWith = 0;
      withExp_i = -1;
      withExp_s = "";
    endfunction
  endclass
endpackage
