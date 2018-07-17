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


`define MOCKER_WITH(NAME,TYPE,MOD=SCALAR) \
`define NAME``_``MOD \
class NAME``__with extends base__with; \
  bit done; \
`ifdef NAME``_SCALAR \
  TYPE exp; \
  TYPE act; \
`else \
  TYPE exp MOD; \
  TYPE act MOD; \
`endif \
  function bit compare(); \
    return exp == act; \
  endfunction \
  function string as_string(); \
    classify($typename(exp)); \
    if (is_other) begin \
    end \
    else begin \
`ifdef NAME``_SCALAR \
        if (is_string) $sformat(as_string, "exp:%s act:%s", exp, act); \
        else           $sformat(as_string, "exp:%0d act:%0d", exp, act); \
`else \
        if (is_string) $sformat(as_string, "exp:%s act:%s", exp[0], act[0]); \
        else           $sformat(as_string, "exp:%0d act:%0d", exp[0], act[0]); \
`endif \
        $display("%s", as_string); \
        return as_string; \
    end \
  endfunction \
endclass \
`undef NAME``_SCALAR \
`undef NAME``_

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
