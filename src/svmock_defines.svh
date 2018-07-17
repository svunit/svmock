//-------------------
// MOCK CLASS MACROS
//-------------------

`define SVMOCK(MOCK,ORIGINAL=HAS_NO_PARENT) \
`define MOCK``_``ORIGINAL \
`ifdef MOCK``_HAS_NO_PARENT \
`define MOCKTYPE_HAS_NO_PARENT \
class MOCK; \
`else \
class MOCK extends ORIGINAL; \
`endif \
  typedef MOCK PARENT; \
  __mocker __mockers [$]; \
  function bit check(); \
    check = 1; \
    foreach (__mockers[i]) begin \
      check &= __mockers[i].check(); \
    end \
  endfunction \
  function void clear(); \
    foreach (__mockers[i]) begin \
      __mockers[i].clear(); \
    end \
  endfunction

`define SVMOCK_END \
endclass \
`undef MOCKTYPE_HAS_NO_PARENT

`define MOCKER_WITH(NAME,TYPE,MOD) \
class NAME``__with extends base__with; \
  bit done; \
  TYPE exp MOD; \
  TYPE act MOD; \
  function bit compare(); \
    return exp == act; \
  endfunction \
  function string as_string(); \
    classify($typename(exp)); \
    if (is_other) begin \
\
    end \
    else begin \
      if (is_aggregate) begin \
        $sformat(as_string, "exp:<array> act:<array>"); \
      end \
      else begin \
        if      (is_string) $sformat(as_string, "exp:%s act:%s", exp, act); \
        else if (is_numeric) $sformat(as_string, "exp:%0d act:%0d", exp, act); \
      end \
      return as_string; \
    end \
  endfunction \
endclass

//-------------
// EXPECT CALL
//-------------
`define EXPECT_CALL(OBJ,METHOD) \
  OBJ.__``METHOD


//-------------
// ON CALL
//-------------
`define ON_CALL(OBJ,METHOD) \
  OBJ.__``METHOD


//----------------------
// MOCK FUNCTION MACROS
//----------------------
`include "svmock_mocker_defines.svh"
`include "__mocker0.svh"
`include "__mocker1.svh"
`include "__mocker2.svh"
`include "__mocker3.svh"
`include "__mocker4.svh"
`include "__mocker5.svh"
`include "__mocker6.svh"
`include "__mocker7.svh"
`include "__mocker8.svh"
