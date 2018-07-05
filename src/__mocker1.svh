`define SVMOCK_MOCKER_CLASS1(NAME,RETURNS,TYPE0,ARG0,MOD0) \
class __``NAME``__mocker  extends __mocker; \
function new(string name, ref __mocker __mockers[$], input __``NAME``__mocker parent = null); \
  super.new(name, __mockers); \
  if (parent != null) parent.possibilities[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0); \
endfunction \
TYPE0 withAct_0 MOD0, withExp_0 MOD0; \
function void called(TYPE0 ARG0 MOD0); \
  timesCnt += 1; \
  withAct_0 = ARG0; \
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
function void with_args(TYPE0 ARG0 MOD0); \
  checkWith = 1; \
  withExp_0 = ARG0; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? (withExp_0 == withAct_0)  : 1; \
  return check; \
endfunction \
function void clear(); \
  super.clear(); \
  instead = null; \
endfunction \
endclass
