`define SVMOCK_TASK0(NAME) \
`SVMOCK_MOCKER_CLASS0(NAME,void) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(); \
  __``NAME.called(); \
  super.NAME(); \
endtask

`define SVMOCK_VOIDFUNCTION0(NAME) \
`define invoke0_function__``NAME`` virtual function void NAME() \
`SVMOCK_MOCKER_CLASS0(NAME,void) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(); \
  __``NAME.called(); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(); \
  else \
    super.NAME(); \
endfunction

`define SVMOCK_FUNCTION0(NAME,RETURN) \
`define invoke0_function__``NAME`` virtual function RETURN NAME() \
`SVMOCK_FUNCTION_MOCKER_CLASS0(NAME,RETURN) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(); \
  __``NAME.called(); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(); \
endfunction

`define SVMOCK_HOOK_FUNCTION0(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke0_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK1(NAME,TYPE0,ARG0,MOD0) \
`SVMOCK_MOCKER_CLASS1(NAME,void,TYPE0,ARG0,MOD0) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0); \
  __``NAME.called(ARG0); \
  super.NAME(ARG0); \
endtask

`define SVMOCK_VOIDFUNCTION1(NAME,TYPE0,ARG0,MOD0) \
`define invoke1_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0) \
`SVMOCK_MOCKER_CLASS1(NAME,void,TYPE0,ARG0,MOD0) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0); \
  __``NAME.called(ARG0); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0); \
  else \
    super.NAME(ARG0); \
endfunction

`define SVMOCK_FUNCTION1(NAME,RETURN,TYPE0,ARG0,MOD0) \
`define invoke1_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0) \
`SVMOCK_FUNCTION_MOCKER_CLASS1(NAME,RETURN,TYPE0,ARG0,MOD0) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0); \
  __``NAME.called(ARG0); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0); \
endfunction

`define SVMOCK_HOOK_FUNCTION1(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke1_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1); \
  __``NAME.called(ARG0,ARG1); \
  super.NAME(ARG0,ARG1); \
endtask

`define SVMOCK_VOIDFUNCTION2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`define invoke2_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1) \
`SVMOCK_MOCKER_CLASS2(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1); \
  __``NAME.called(ARG0,ARG1); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1); \
  else \
    super.NAME(ARG0,ARG1); \
endfunction

`define SVMOCK_FUNCTION2(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`define invoke2_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1) \
`SVMOCK_FUNCTION_MOCKER_CLASS2(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1); \
  __``NAME.called(ARG0,ARG1); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1); \
endfunction

`define SVMOCK_HOOK_FUNCTION2(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke2_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`SVMOCK_MOCKER_CLASS3(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2); \
  __``NAME.called(ARG0,ARG1,ARG2); \
  super.NAME(ARG0,ARG1,ARG2); \
endtask

`define SVMOCK_VOIDFUNCTION3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`define invoke3_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2) \
`SVMOCK_MOCKER_CLASS3(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2); \
  __``NAME.called(ARG0,ARG1,ARG2); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1,ARG2); \
  else \
    super.NAME(ARG0,ARG1,ARG2); \
endfunction

`define SVMOCK_FUNCTION3(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`define invoke3_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2) \
`SVMOCK_FUNCTION_MOCKER_CLASS3(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2); \
  __``NAME.called(ARG0,ARG1,ARG2); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1,ARG2); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1,ARG2); \
endfunction

`define SVMOCK_HOOK_FUNCTION3(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke3_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK4(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
`SVMOCK_MOCKER_CLASS4(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3); \
  super.NAME(ARG0,ARG1,ARG2,ARG3); \
endtask

`define SVMOCK_VOIDFUNCTION4(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
`define invoke4_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3) \
`SVMOCK_MOCKER_CLASS4(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3); \
  else \
    super.NAME(ARG0,ARG1,ARG2,ARG3); \
endfunction

`define SVMOCK_FUNCTION4(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
`define invoke4_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3) \
`SVMOCK_FUNCTION_MOCKER_CLASS4(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1,ARG2,ARG3); \
endfunction

`define SVMOCK_HOOK_FUNCTION4(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke4_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`SVMOCK_MOCKER_CLASS5(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4); \
  super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4); \
endtask

`define SVMOCK_VOIDFUNCTION5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`define invoke5_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4) \
`SVMOCK_MOCKER_CLASS5(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4); \
  else \
    super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4); \
endfunction

`define SVMOCK_FUNCTION5(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`define invoke5_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4) \
`SVMOCK_FUNCTION_MOCKER_CLASS5(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4); \
endfunction

`define SVMOCK_HOOK_FUNCTION5(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke5_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK6(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
`SVMOCK_MOCKER_CLASS6(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
  super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
endtask

`define SVMOCK_VOIDFUNCTION6(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
`define invoke6_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5) \
`SVMOCK_MOCKER_CLASS6(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
  else \
    super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
endfunction

`define SVMOCK_FUNCTION6(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
`define invoke6_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5) \
`SVMOCK_FUNCTION_MOCKER_CLASS6(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5); \
endfunction

`define SVMOCK_HOOK_FUNCTION6(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke6_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK7(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
`SVMOCK_MOCKER_CLASS7(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
  super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
endtask

`define SVMOCK_VOIDFUNCTION7(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
`define invoke7_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6) \
`SVMOCK_MOCKER_CLASS7(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
  else \
    super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
endfunction

`define SVMOCK_FUNCTION7(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
`define invoke7_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6) \
`SVMOCK_FUNCTION_MOCKER_CLASS7(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6); \
endfunction

`define SVMOCK_HOOK_FUNCTION7(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke7_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`SVMOCK_MOCKER_CLASS8(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
  super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
endtask

`define SVMOCK_VOIDFUNCTION8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`define invoke8_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7) \
`SVMOCK_MOCKER_CLASS8(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
  else \
    super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
endfunction

`define SVMOCK_FUNCTION8(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`define invoke8_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7) \
`SVMOCK_FUNCTION_MOCKER_CLASS8(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7); \
endfunction

`define SVMOCK_HOOK_FUNCTION8(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke8_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

`define SVMOCK_TASK9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`SVMOCK_MOCKER_CLASS9(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
  super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
endtask

`define SVMOCK_VOIDFUNCTION9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`define invoke9_function__``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8) \
`SVMOCK_MOCKER_CLASS9(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
  else \
    super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
endfunction

`define SVMOCK_FUNCTION9(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`define invoke9_function__``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8) \
`SVMOCK_FUNCTION_MOCKER_CLASS9(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
__``NAME``__mocker __``NAME = new("NAME", __mockers); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8); \
  __``NAME.called(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8); \
endfunction

`define SVMOCK_HOOK_FUNCTION9(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input __``ORIGINAL``__mocker parent = null); \
    super.new(name, __mockers, parent); \
  endfunction \
  `invoke9_function__``ORIGINAL;

`define SVMOCK_ENDFUNCTION \
  endfunction \
endclass

