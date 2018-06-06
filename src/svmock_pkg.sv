`define SVMOCK_VOIDFUNCTION0(NAME) \
  function NAME(); \
    super.NAME(); \
  endfunction

`define SVMOCK_VOIDFUNCTION1(NAME,TYPE0,ARG0) \
  function NAME(TYPE0 ARG0); \
    super.NAME(ARG0); \
  endfunction



`define SVMOCK_FUNCTION0(NAME,RETURN) \
  function RETURN NAME(); \
    return super.NAME(); \
  endfunction

`define SVMOCK_FUNCTION1(NAME,RETURN,TYPE0,ARG0) \
  function RETURN NAME(TYPE0 ARG0); \
    return super.NAME(ARG0); \
  endfunction

package svmock_pkg;
endpackage
