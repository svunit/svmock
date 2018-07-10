`define SVMOCK_MOCKER_CLASS0(NAME,RETURNS,MODIFIER=) \
class __``NAME``MODIFIER``__mocker  extends __mocker; \
`PARENT parent; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
function void called(); \
  timesCnt += 1; \
endfunction \
function void with_args(); \
  checkWith = 1; \
endfunction \
function bit check(); \
  check = super.check(); \
  return check; \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS0(NAME,RETURNS) \
`SVMOCK_MOCKER_CLASS0(NAME,RETURNS,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(); \
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

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS0(NAME) \
`SVMOCK_MOCKER_CLASS0(NAME,RETURNS,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(); \
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

`define SVMOCK_TASK_MOCKER_CLASS0(NAME) \
`SVMOCK_MOCKER_CLASS0(NAME,void,_base) \
class __``NAME``__mocker  extends __``NAME``_base__mocker; \
function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(); \
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
