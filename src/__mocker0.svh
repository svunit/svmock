`define SVMOCK_MOCKER_CLASS0(NAME,RETURNS) \
class __``NAME``__mocker  extends __mocker; \
function new(string name, ref __mocker __mockers[$], input __``NAME``__mocker parent = null); \
  super.new(name, __mockers); \
  if (parent != null) parent.possibilities[name] = this; \
endfunction \
virtual function RETURNS NAME(); \
endfunction \
function void called(); \
  timesCnt += 1; \
endfunction \
__``NAME``__mocker possibilities [string]; \
__``NAME``__mocker instead; \
function void will_by_default(string i); \
  instead = possibilities[i]; \
endfunction \
function void with_args(); \
  checkWith = 1; \
endfunction \
function bit check(); \
  check = super.check(); \
  return check; \
endfunction \
function void clear(); \
  super.clear(); \
  instead = null; \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS0(NAME,RETURNS) \
`SVMOCK_MOCKER_CLASS0(NAME,RETURNS) \
class __``NAME``__function_mocker  extends __``NAME``__mocker; \
function new(string name, ref __mocker __mockers[$], input __``NAME``__mocker parent = null); \
  super.new(name, __mockers, parent); \
endfunction \
RETURNS returnsVal; \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
endclass
