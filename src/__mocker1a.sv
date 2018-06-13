`define SVMOCK_MOCKER_CLASS(NAME,TYPE0,ARG0,MOD0) \
class __``NAME``__mocker1  extends __mocker; \
 \
function new(string name, ref __mocker __mockers[$]); \
  super.new(name, __mockers); \
endfunction \
 \
TYPE0 withAct_0 MOD0, withExp_0 MOD0; \
 \
function void Called( \
  TYPE0 ARG0 MOD0); \
  timesCnt += 1; \
  withAct_0 = ARG0; \
endfunction \
 \
function void With( \
  TYPE0 ARG0 MOD0); \
  checkWith = 1; \
  withExp_0 = ARG0; \
endfunction \
 \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? (withExp_0 == withAct_0)  : 1; \
  return check; \
endfunction \
endclass


`define SVMOCK_VOIDFUNCTION1(NAME,TYPE0,ARG0,MOD0) \
`SVMOCK_MOCKER_CLASS(NAME,TYPE0,ARG0,MOD0) \
__``NAME``__mocker1 __``NAME = new("NAME", __mockers); \
function NAME(TYPE0 ARG0 MOD0); \
  __``NAME.Called(ARG0); \
  super.NAME(ARG0); \
endfunction
