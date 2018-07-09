//-------------------
// MOCK CLASS MACROS
//-------------------

`define SVMOCK(MOCK,ORIGINAL) \
class MOCK extends ORIGINAL; \
  `define PARENT MOCK \
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

`define SVMOCK_END endclass


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
