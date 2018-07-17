//-------------------
// MOCK CLASS MACROS
//-------------------

`define SVMOCK(MOCK,ORIGINAL=HAS_NO_PARENT) \
`define MOCK``_``ORIGINAL \
`define MOCKTYPE MOCK``_``ORIGINAL \
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
`undef MOCKTYPE \
`undef MOCKTYPE_HAS_NO_PARENT


`define MOCKER_WITH(CLASS,FUNCTION,ARG,TYPE,MOD=SCALAR) \
`define CLASS``_``FUNCTION``_``ARG``_``MOD \
class ARG``__with extends base__with; \
  bit done; \
`ifdef CLASS``_``FUNCTION``_``ARG``_SCALAR \
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
`ifdef CLASS``_``FUNCTION``_``ARG``_SCALAR \
    if      (is_string) $sformat(as_string, "exp:%s act:%s", exp, act); \
    else if (is_other)  $sformat(as_string, "exp:<unknown> act:<unknown>"); \
    else                $sformat(as_string, "exp:%0d act:%0d", exp, act); \
`else \
    begin \
      string e_str; int e_size; \
      string a_str; int a_size; \
      foreach (exp[i]) begin \
        e_size += 1; \
        if (is_string) $sformat(e_str, "%s%s,", e_str, exp[i]); \
        else           $sformat(e_str, "%s%0d,", e_str, exp[i]); \
      end \
      foreach (act[i]) begin \
        a_size += 1; \
        if (is_string) $sformat(a_str, "%s%s,", a_str, act[i]); \
        else           $sformat(a_str, "%s%0d,", a_str, act[i]); \
      end \
      if (e_str != "") e_str = e_str.substr(0,e_str.len()-2); \
      if (a_str != "") a_str = a_str.substr(0,a_str.len()-2); \
      $sformat(as_string, "exp[%0d:0]:{%s} act[%0d:0]:{%s}", e_size-1, e_str, a_size-1, a_str); \
    end \
`endif \
    return as_string; \
  endfunction \
endclass \
`undef CLASS``_``FUNCTION``_``ARG``_SCALAR \
`undef CLASS``_``FUNCTION``_``ARG``_

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
