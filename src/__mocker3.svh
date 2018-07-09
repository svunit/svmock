`define SVMOCK_MOCKER_CLASS3(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,MODIFIER=) \
class __``NAME``MODIFIER``__mocker  extends __mocker; \
int parent; \
function new(string name, ref __mocker __mockers[$], input /* PARENT */ int parent, input __``NAME``MODIFIER``__mocker associate = null); \
  super.new(name, __mockers); \
  if (associate != null) associate.possibilities[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
endfunction \
TYPE0 withAct_0 MOD0, withExp_0 MOD0; \
TYPE1 withAct_1 MOD1, withExp_1 MOD1; \
TYPE2 withAct_2 MOD2, withExp_2 MOD2; \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
  timesCnt += 1; \
  withAct_0 = ARG0; \
  withAct_1 = ARG1; \
  withAct_2 = ARG2; \
endfunction \
__``NAME``MODIFIER``__mocker possibilities [string]; \
__``NAME``MODIFIER``__mocker instead; \
function void will_by_default(string i); \
  instead = possibilities[i]; \
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
  checkWith = 1; \
  withExp_0 = ARG0; \
  withExp_1 = ARG1; \
  withExp_2 = ARG2; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? (withExp_0 == withAct_0)  : 1; \
  check &= (checkWith) ? (withExp_1 == withAct_1)  : 1; \
  check &= (checkWith) ? (withExp_2 == withAct_2)  : 1; \
  return check; \
endfunction \
function void clear(); \
  super.clear(); \
  instead = null; \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS3(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`SVMOCK_MOCKER_CLASS3(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input /* PARENT */ int parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, parent, associate); \
endfunction \
RETURNS returnsVal; \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
endclass
