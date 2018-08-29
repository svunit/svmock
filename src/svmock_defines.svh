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
  function bit verify(); \
    verify = 1; \
    foreach (__mockers[i]) begin \
      verify &= __mockers[i].verify(); \
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


`define MOCKER_WITH(FUNCTION,ARG,TYPE,MOD=SCALAR) \
`undef FUNCTION``_``ARG``_SCALAR \
`define FUNCTION``_``ARG``_``MOD \
class ARG``__with extends base__with; \
  bit done; \
`ifdef FUNCTION``_``ARG``_SCALAR \
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
`ifdef FUNCTION``_``ARG``_SCALAR \
`ifdef INCA \
    if      (is_string) $sformat(as_string, "exp:%s act:%s", exp, act); \
`else \
    if      (is_string) $sformat(as_string, "exp:%0d act:%0d", exp, act); \
`endif \
    else if (is_other)  $sformat(as_string, "exp:<unknown> act:<unknown>"); \
    else                $sformat(as_string, "exp:%0d act:%0d", exp, act); \
`else \
    begin \
      string e_str; int e_size; \
      string a_str; int a_size; \
      foreach (exp[i]) begin \
        e_size += 1; \
`ifdef INCA \
        if      (is_string) $sformat(e_str, "%s%s,", e_str, exp[i]); \
`else \
        if      (is_string) $sformat(e_str, "%s%0d,", e_str, exp[i]); \
`endif \
        else if (is_other)  $sformat(e_str, "%s<unknown>,", e_str); \
        else                $sformat(e_str, "%s%0d,", e_str, exp[i]); \
      end \
      foreach (act[i]) begin \
        a_size += 1; \
`ifdef INCA \
        if      (is_string) $sformat(a_str, "%s%s,", a_str, act[i]); \
`else \
        if      (is_string) $sformat(a_str, "%s%0d,", a_str, act[i]); \
`endif \
        else if (is_other)  $sformat(a_str, "%s<unknown>,", a_str); \
        else                $sformat(a_str, "%s%0d,", a_str, act[i]); \
      end \
      if (e_str != "") e_str = e_str.substr(0,e_str.len()-2); \
      if (e_str.len() > 30) begin \
        string e_start, e_end; \
        e_start = e_str.substr(0,14); \
        e_end = e_str.substr(e_str.len()-15,e_str.len()-1); \
        $sformat(e_str, "%s...%s", e_start, e_end); \
      end \
      if (a_str != "") a_str = a_str.substr(0,a_str.len()-2); \
      if (a_str.len() > 30) begin \
        string a_start, a_end; \
        a_start = a_str.substr(0,14); \
        a_end = a_str.substr(a_str.len()-15,a_str.len()-1); \
        $sformat(a_str, "%s...%s", a_start, a_end); \
      end \
      $sformat(as_string, "exp[%0d:0]:{%s} act[%0d:0]:{%s}", e_size-1, e_str, a_size-1, a_str); \
    end \
`endif \
    return as_string; \
  endfunction \
endclass \
`undef FUNCTION``_``ARG``_SCALAR \
`undef FUNCTION``_``ARG``_

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
