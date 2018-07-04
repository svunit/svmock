`define SVMOCK_MOCKER_CLASS0(NAME,RETURNS)\
class __``NAME``__mocker  extends __mocker; \
function new(string name, ref __mocker __mockers[$]); \
  super.new(name, __mockers); \
endfunction \
function void called(); \
  timesCnt += 1; \
endfunction \
RETURNS returnsVal; /* UNUSED FOR VOID FUNCTIONS AND TASKS */ \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
function void with_args(); \
  checkWith = 1; \
endfunction \
function bit check(); \
  check = super.check(); \
  return check; \
endfunction \
__mocker_hooks hooks [string];
function void will_by_default(string instead); \
  default = hooks[instead]; \
endfunction \
endclass
