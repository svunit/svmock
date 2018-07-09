`define SVMOCK_MOCKER_CLASS0(NAME,RETURNS,MODIFIER=) \
class __``NAME``MODIFIER``__mocker  extends __mocker; \
int parent; \
function new(string name, ref __mocker __mockers[$], input /* PARENT */ int parent, input __``NAME``MODIFIER``__mocker associate = null); \
  super.new(name, __mockers); \
  if (associate != null) associate.possibilities[name] = this; \
endfunction \
virtual function RETURNS NAME(); \
endfunction \
function void called(); \
  timesCnt += 1; \
endfunction \
__``NAME``MODIFIER``__mocker possibilities [string]; \
__``NAME``MODIFIER``__mocker instead; \
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
`SVMOCK_MOCKER_CLASS0(NAME,RETURNS,_base) \
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
