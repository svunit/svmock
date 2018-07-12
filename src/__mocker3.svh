`define SVMOCK_MOCKER_CLASS3(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,MODIFIER=) \
class __``NAME``MODIFIER``__mocker  extends __mocker; \
`PARENT parent; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME0, TYPE0, MOD0) \
NAME0``__with __with_0 = new(); \
`MOCKER_WITH(NAME1, TYPE1, MOD1) \
NAME1``__with __with_1 = new(); \
`MOCKER_WITH(NAME2, TYPE2, MOD2) \
NAME2``__with __with_2 = new(); \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
  timesCnt += 1; \
  __with_0.act = ARG0; \
  __with_1.act = ARG1; \
  __with_2.act = ARG2; \
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
  checkWith = 1; \
  __with_0.exp = ARG0; \
  __with_1.exp = ARG1; \
  __with_2.exp = ARG2; \
endfunction \
function bit check(); \
  check = super.check(); \
  check &= (checkWith) ? __with_0.compare() : 1; \
  check &= (checkWith) ? __with_1.compare() : 1; \
  check &= (checkWith) ? __with_2.compare() : 1; \
  return check; \
endfunction \
function void clear(); \
  super.clear; \
  __with_0 = new(); \
  __with_1 = new(); \
  __with_2 = new(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS3(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`SVMOCK_MOCKER_CLASS3(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
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

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`SVMOCK_MOCKER_CLASS3(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
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

`define SVMOCK_TASK_MOCKER_CLASS3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`SVMOCK_MOCKER_CLASS3(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2); \
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
