`define SVMOCK_MOCKER_CLASS1(NAME,RETURNS,TYPE0,ARG0,MOD0,MODIFIER=) \
class __``NAME``MODIFIER``__mocker  extends __mocker; \
`PARENT parent; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME0, TYPE0, MOD0) \
NAME0``__with __with_0 = new(); \
function void called(TYPE0 ARG0 MOD0); \
  timesCnt += 1; \
  __with_0.act = ARG0; \
endfunction \
function void with_args(TYPE0 ARG0 MOD0); \
  checkWith = 1; \
  __with_0.exp = ARG0; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? __with_0.compare() : 1; \
  return check; \
endfunction \
function void clear(); \
  super.clear; \
  __with_0 = new(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS1(NAME,RETURNS,TYPE0,ARG0,MOD0) \
`SVMOCK_MOCKER_CLASS1(NAME,RETURNS,TYPE0,ARG0,MOD0,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0); \
endfunction \
RETURNS returnsVal; \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
__``NAME``__mocker map [string]; \
__``NAME``__mocker override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS1(NAME,TYPE0,ARG0,MOD0) \
`SVMOCK_MOCKER_CLASS1(NAME,RETURNS,TYPE0,ARG0,MOD0,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(TYPE0 ARG0 MOD0); \
endfunction \
__``NAME``__mocker map [string]; \
__``NAME``__mocker override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_TASK_MOCKER_CLASS1(NAME,TYPE0,ARG0,MOD0) \
`SVMOCK_MOCKER_CLASS1(NAME,void,TYPE0,ARG0,MOD0,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(TYPE0 ARG0 MOD0); \
endtask \
__``NAME``__mocker map [string]; \
__``NAME``__mocker override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass
