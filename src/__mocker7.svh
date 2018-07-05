`define SVMOCK_MOCKER_CLASS7(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
class __``NAME``__mocker  extends __mocker; \
function new(string name, ref __mocker __mockers[$], input __``NAME``__mocker parent = null); \
  super.new(name, __mockers); \
  if (parent != null) parent.possibilities[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6); \
endfunction \
TYPE0 withAct_0 MOD0, withExp_0 MOD0; \
TYPE1 withAct_1 MOD1, withExp_1 MOD1; \
TYPE2 withAct_2 MOD2, withExp_2 MOD2; \
TYPE3 withAct_3 MOD3, withExp_3 MOD3; \
TYPE4 withAct_4 MOD4, withExp_4 MOD4; \
TYPE5 withAct_5 MOD5, withExp_5 MOD5; \
TYPE6 withAct_6 MOD6, withExp_6 MOD6; \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6); \
  timesCnt += 1; \
  withAct_0 = ARG0; \
  withAct_1 = ARG1; \
  withAct_2 = ARG2; \
  withAct_3 = ARG3; \
  withAct_4 = ARG4; \
  withAct_5 = ARG5; \
  withAct_6 = ARG6; \
endfunction \
__``NAME``__mocker possibilities [string]; \
__``NAME``__mocker instead; \
function void will_by_default(string i); \
  instead = possibilities[i]; \
endfunction \
RETURNS returnsVal; /* UNUSED FOR VOID FUNCTIONS AND TASKS */ \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6); \
  checkWith = 1; \
  withExp_0 = ARG0; \
  withExp_1 = ARG1; \
  withExp_2 = ARG2; \
  withExp_3 = ARG3; \
  withExp_4 = ARG4; \
  withExp_5 = ARG5; \
  withExp_6 = ARG6; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? (withExp_0 == withAct_0)  : 1; \
  check &= (checkWith) ? (withExp_1 == withAct_1)  : 1; \
  check &= (checkWith) ? (withExp_2 == withAct_2)  : 1; \
  check &= (checkWith) ? (withExp_3 == withAct_3)  : 1; \
  check &= (checkWith) ? (withExp_4 == withAct_4)  : 1; \
  check &= (checkWith) ? (withExp_5 == withAct_5)  : 1; \
  check &= (checkWith) ? (withExp_6 == withAct_6)  : 1; \
  return check; \
endfunction \
function void clear(); \
  super.clear(); \
  instead = null; \
endfunction \
endclass
