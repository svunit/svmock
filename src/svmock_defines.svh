//-------------------
// MOCK CLASS MACROS
//-------------------

`define SVMOCK(MOCK,ORIGINAL) \
class MOCK extends ORIGINAL; \
  __mocker __mockers [$]; \
  function bit check(); \
    check = 1; \
    foreach (__mockers[i]) begin \
      check &= __mockers[i].check(); \
    end \
  endfunction \
  function bit clear(); \
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
`include "__mocker0.sv"
`include "__mocker1.sv"
`include "__mocker2.sv"
`include "__mocker3.sv"
`include "__mocker4.sv"
`include "__mocker5.sv"
`include "__mocker6.sv"
`include "__mocker7.sv"
`include "__mocker8.sv"
