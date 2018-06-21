`define SVMOCK_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1)\
class __``NAME``__mocker  extends __mocker; \
function new(string name, ref __mocker __mockers[$]); \
  super.new(name, __mockers); \
endfunction \
TYPE0 withAct_0 MOD0, withExp_0 MOD0; \
TYPE1 withAct_1 MOD1, withExp_1 MOD1; \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  timesCnt += 1; \
  withAct_0 = ARG0; \
  withAct_1 = ARG1; \
endfunction \
RETURNS returnsVal; /* UNUSED FOR VOID FUNCTIONS */ \
function RETURNS returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  checkWith = 1; \
  withExp_0 = ARG0; \
  withExp_1 = ARG1; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? (withExp_0 == withAct_0)  : 1; \
  check &= (checkWith) ? (withExp_1 == withAct_1)  : 1; \
  return check; \
endfunction \
endclass
