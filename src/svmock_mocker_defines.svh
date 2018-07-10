`define SVMOCK_TASK0(NAME) \
`define invoke0_``NAME`` virtual task NAME() \
`define args0_``NAME``  \
`SVMOCK_TASK_MOCKER_CLASS0(NAME) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(); \
  __``NAME.called(); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(); \
  else \
    super.NAME(); \
endtask

`define SVMOCK_MAP_TASK0(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke0_``ORIGINAL; \
    parent.INSTEAD(`args0_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC0(NAME) \
`define invoke0_``NAME`` virtual function void NAME() \
`define args0_``NAME``  \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS0(NAME) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(); \
  __``NAME.called(); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(); \
  else \
    super.NAME(); \
endfunction

`define SVMOCK_MAP_VFUNC0(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke0_``ORIGINAL; \
    parent.INSTEAD(`args0_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC0(NAME,RETURN) \
`define invoke0_``NAME`` virtual function RETURN NAME() \
`define args0_``NAME``  \
`SVMOCK_FUNCTION_MOCKER_CLASS0(NAME,RETURN) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(); \
  __``NAME.called(); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(); \
endfunction

`define SVMOCK_MAP_FUNC0(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke0_``ORIGINAL; \
    return parent.INSTEAD(`args0_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK1(NAME,TYPE0,ARG0,MOD0) \
`define invoke1_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0) \
`define args1_``NAME`` ARG0 \
`SVMOCK_TASK_MOCKER_CLASS1(NAME,TYPE0,ARG0,MOD0) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0); \
  __``NAME.called(ARG0); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0); \
  else \
    super.NAME(ARG0); \
endtask

`define SVMOCK_MAP_TASK1(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke1_``ORIGINAL; \
    parent.INSTEAD(`args1_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC1(NAME,TYPE0,ARG0,MOD0) \
`define invoke1_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0) \
`define args1_``NAME`` ARG0 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS1(NAME,TYPE0,ARG0,MOD0) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0); \
  __``NAME.called(ARG0); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0); \
  else \
    super.NAME(ARG0); \
endfunction

`define SVMOCK_MAP_VFUNC1(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke1_``ORIGINAL; \
    parent.INSTEAD(`args1_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC1(NAME,RETURN,TYPE0,ARG0,MOD0) \
`define invoke1_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0) \
`define args1_``NAME`` ARG0 \
`SVMOCK_FUNCTION_MOCKER_CLASS1(NAME,RETURN,TYPE0,ARG0,MOD0) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0); \
  __``NAME.called(ARG0); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0); \
endfunction

`define SVMOCK_MAP_FUNC1(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke1_``ORIGINAL; \
    return parent.INSTEAD(`args1_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`define invoke2_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1) \
`define args2_``NAME`` ARG0, ARG1 \
`SVMOCK_TASK_MOCKER_CLASS2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1); \
  __``NAME.called(ARG0, ARG1); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1); \
  else \
    super.NAME(ARG0, ARG1); \
endtask

`define SVMOCK_MAP_TASK2(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke2_``ORIGINAL; \
    parent.INSTEAD(`args2_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`define invoke2_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1) \
`define args2_``NAME`` ARG0, ARG1 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS2(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1); \
  __``NAME.called(ARG0, ARG1); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1); \
  else \
    super.NAME(ARG0, ARG1); \
endfunction

`define SVMOCK_MAP_VFUNC2(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke2_``ORIGINAL; \
    parent.INSTEAD(`args2_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC2(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
`define invoke2_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1) \
`define args2_``NAME`` ARG0, ARG1 \
`SVMOCK_FUNCTION_MOCKER_CLASS2(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1); \
  __``NAME.called(ARG0, ARG1); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1); \
endfunction

`define SVMOCK_MAP_FUNC2(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke2_``ORIGINAL; \
    return parent.INSTEAD(`args2_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`define invoke3_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2) \
`define args3_``NAME`` ARG0, ARG1, ARG2 \
`SVMOCK_TASK_MOCKER_CLASS3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2); \
  __``NAME.called(ARG0, ARG1, ARG2); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2); \
  else \
    super.NAME(ARG0, ARG1, ARG2); \
endtask

`define SVMOCK_MAP_TASK3(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke3_``ORIGINAL; \
    parent.INSTEAD(`args3_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`define invoke3_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2) \
`define args3_``NAME`` ARG0, ARG1, ARG2 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS3(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2); \
  __``NAME.called(ARG0, ARG1, ARG2); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2); \
  else \
    super.NAME(ARG0, ARG1, ARG2); \
endfunction

`define SVMOCK_MAP_VFUNC3(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke3_``ORIGINAL; \
    parent.INSTEAD(`args3_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC3(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
`define invoke3_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2) \
`define args3_``NAME`` ARG0, ARG1, ARG2 \
`SVMOCK_FUNCTION_MOCKER_CLASS3(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2); \
  __``NAME.called(ARG0, ARG1, ARG2); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1, ARG2); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1, ARG2); \
endfunction

`define SVMOCK_MAP_FUNC3(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke3_``ORIGINAL; \
    return parent.INSTEAD(`args3_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK4(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
`define invoke4_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3) \
`define args4_``NAME`` ARG0, ARG1, ARG2, ARG3 \
`SVMOCK_TASK_MOCKER_CLASS4(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3); \
endtask

`define SVMOCK_MAP_TASK4(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke4_``ORIGINAL; \
    parent.INSTEAD(`args4_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC4(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
`define invoke4_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3) \
`define args4_``NAME`` ARG0, ARG1, ARG2, ARG3 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS4(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3); \
endfunction

`define SVMOCK_MAP_VFUNC4(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke4_``ORIGINAL; \
    parent.INSTEAD(`args4_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC4(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
`define invoke4_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3) \
`define args4_``NAME`` ARG0, ARG1, ARG2, ARG3 \
`SVMOCK_FUNCTION_MOCKER_CLASS4(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3); \
endfunction

`define SVMOCK_MAP_FUNC4(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke4_``ORIGINAL; \
    return parent.INSTEAD(`args4_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`define invoke5_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4) \
`define args5_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4 \
`SVMOCK_TASK_MOCKER_CLASS5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
endtask

`define SVMOCK_MAP_TASK5(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke5_``ORIGINAL; \
    parent.INSTEAD(`args5_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`define invoke5_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4) \
`define args5_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
endfunction

`define SVMOCK_MAP_VFUNC5(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke5_``ORIGINAL; \
    parent.INSTEAD(`args5_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC5(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`define invoke5_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4) \
`define args5_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4 \
`SVMOCK_FUNCTION_MOCKER_CLASS5(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
endfunction

`define SVMOCK_MAP_FUNC5(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke5_``ORIGINAL; \
    return parent.INSTEAD(`args5_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK6(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
`define invoke6_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5) \
`define args6_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5 \
`SVMOCK_TASK_MOCKER_CLASS6(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
endtask

`define SVMOCK_MAP_TASK6(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke6_``ORIGINAL; \
    parent.INSTEAD(`args6_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC6(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
`define invoke6_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5) \
`define args6_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS6(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
endfunction

`define SVMOCK_MAP_VFUNC6(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke6_``ORIGINAL; \
    parent.INSTEAD(`args6_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC6(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
`define invoke6_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5) \
`define args6_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5 \
`SVMOCK_FUNCTION_MOCKER_CLASS6(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
endfunction

`define SVMOCK_MAP_FUNC6(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke6_``ORIGINAL; \
    return parent.INSTEAD(`args6_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK7(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
`define invoke7_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6) \
`define args7_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6 \
`SVMOCK_TASK_MOCKER_CLASS7(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
endtask

`define SVMOCK_MAP_TASK7(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke7_``ORIGINAL; \
    parent.INSTEAD(`args7_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC7(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
`define invoke7_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6) \
`define args7_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS7(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
endfunction

`define SVMOCK_MAP_VFUNC7(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke7_``ORIGINAL; \
    parent.INSTEAD(`args7_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC7(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
`define invoke7_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6) \
`define args7_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6 \
`SVMOCK_FUNCTION_MOCKER_CLASS7(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
endfunction

`define SVMOCK_MAP_FUNC7(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke7_``ORIGINAL; \
    return parent.INSTEAD(`args7_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`define invoke8_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7) \
`define args8_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7 \
`SVMOCK_TASK_MOCKER_CLASS8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
endtask

`define SVMOCK_MAP_TASK8(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke8_``ORIGINAL; \
    parent.INSTEAD(`args8_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`define invoke8_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7) \
`define args8_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
endfunction

`define SVMOCK_MAP_VFUNC8(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke8_``ORIGINAL; \
    parent.INSTEAD(`args8_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC8(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`define invoke8_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7) \
`define args8_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7 \
`SVMOCK_FUNCTION_MOCKER_CLASS8(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
endfunction

`define SVMOCK_MAP_FUNC8(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke8_``ORIGINAL; \
    return parent.INSTEAD(`args8_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_TASK9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`define invoke9_``NAME`` virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8) \
`define args9_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8 \
`SVMOCK_TASK_MOCKER_CLASS9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual task NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
endtask

`define SVMOCK_MAP_TASK9(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke9_``ORIGINAL; \
    parent.INSTEAD(`args9_``ORIGINAL); \
  endtask \
endclass

`define SVMOCK_VFUNC9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`define invoke9_``NAME`` virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8) \
`define args9_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS9(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  if (__``NAME.instead != null) \
    __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
endfunction

`define SVMOCK_MAP_VFUNC9(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke9_``ORIGINAL; \
    parent.INSTEAD(`args9_``ORIGINAL); \
  endfunction \
endclass

`define SVMOCK_FUNC9(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
`define invoke9_``NAME`` virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8) \
`define args9_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8 \
`SVMOCK_FUNCTION_MOCKER_CLASS9(NAME,RETURN,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,TYPE8,ARG8,MOD8) \
__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(TYPE0 ARG0 MOD0, TYPE1 ARG1 MOD1, TYPE2 ARG2 MOD2, TYPE3 ARG3 MOD3, TYPE4 ARG4 MOD4, TYPE5 ARG5 MOD5, TYPE6 ARG6 MOD6, TYPE7 ARG7 MOD7, TYPE8 ARG8 MOD8); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  if (__``NAME.instead != null) \
    return __``NAME.instead.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
endfunction

`define SVMOCK_MAP_FUNC9(ORIGINAL,INSTEAD) \
typedef class __``INSTEAD``__mocker; \
__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \
class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \
  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke9_``ORIGINAL; \
    return parent.INSTEAD(`args9_``ORIGINAL); \
  endfunction \
endclass

