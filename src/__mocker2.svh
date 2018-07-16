`define SVMOCK_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,MODIFIER=) \
class __``NAME``MODIFIER``__mocker #(type PARENT=int) extends __mocker; \
PARENT parent; \
function new(string name, ref __mocker __mockers[$], input PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME0, TYPE0, MOD0) \
NAME0``__with __with_0 [$]; \
`MOCKER_WITH(NAME1, TYPE1, MOD1) \
NAME1``__with __with_1 [$]; \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  timesCnt += 1; \
  for (int i=0; i<__with_0.size(); i+=1) begin \
    if (!__with_0[i].done) begin \
      __with_0[i].act = ARG0; \
      __with_0[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_1.size(); i+=1) begin \
    if (!__with_1[i].done) begin \
      __with_1[i].act = ARG1; \
      __with_1[i].done = 1; \
      break; \
    end \
  end \
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  begin \
    NAME0``__with __w = new(); \
    __w.exp = ARG0; \
    __with_0.push_back(__w); \
  end \
  begin \
    NAME1``__with __w = new(); \
    __w.exp = ARG1; \
    __with_1.push_back(__w); \
  end \
endfunction \
function bit check(); \
  check = super.check(); \
  while (__with_0.size() > 0) begin \
    check &= __with_0[0].compare(); \
    __with_0.pop_front(); \
  end \
  while (__with_1.size() > 0) begin \
    check &= __with_1[0].compare(); \
    __with_1.pop_front(); \
  end \
  return check; \
endfunction \
function void clear(); \
  super.clear; \
  __with_0.delete(); \
  __with_1.delete(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
  return NAME; \
endfunction \
RETURNS returnsVal; \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_TASK_MOCKER_CLASS2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1); \
endtask \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass
