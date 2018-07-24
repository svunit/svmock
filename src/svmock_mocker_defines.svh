`define SVMOCK_TASK0(NAME) \
`define invoke0_``NAME`` virtual task NAME(); \
`define args0_``NAME``  \
`SVMOCK_TASK_MOCKER_CLASS0(NAME) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(); \
  __``NAME.called(); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(); \
`endif \
endtask

`define SVMOCK_MAP_TASK0(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke0_``ORIGINAL \
    parent.INSTEAD(`args0_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC0(NAME) \
`define invoke0_``NAME`` virtual function void NAME(); \
`define args0_``NAME``  \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS0(NAME) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(); \
  __``NAME.called(); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC0(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke0_``ORIGINAL \
    parent.INSTEAD(`args0_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC0(NAME,RETURN) \
`define invoke0_``NAME`` virtual function RETURNS NAME(); \
`define args0_``NAME``  \
`SVMOCK_FUNCTION_MOCKER_CLASS0(NAME,RETURN) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(); \
  __``NAME.called(); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC0(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke0_``ORIGINAL \
    return parent.INSTEAD(`args0_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK1(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`define invoke1_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0); \
`define args1_``NAME`` ARG0 \
`SVMOCK_TASK_MOCKER_CLASS1(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0); \
  __``NAME.called(ARG0); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0); \
`endif \
endtask

`define SVMOCK_MAP_TASK1(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke1_``ORIGINAL \
    parent.INSTEAD(`args1_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC1(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`define invoke1_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0); \
`define args1_``NAME`` ARG0 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS1(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0); \
  __``NAME.called(ARG0); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC1(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke1_``ORIGINAL \
    parent.INSTEAD(`args1_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC1(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`define invoke1_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0); \
`define args1_``NAME`` ARG0 \
`SVMOCK_FUNCTION_MOCKER_CLASS1(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0); \
  __``NAME.called(ARG0); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC1(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke1_``ORIGINAL \
    return parent.INSTEAD(`args1_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK2(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`define invoke2_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
`define args2_``NAME`` ARG0, ARG1 \
`SVMOCK_TASK_MOCKER_CLASS2(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1); \
  __``NAME.called(ARG0, ARG1); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1); \
`endif \
endtask

`define SVMOCK_MAP_TASK2(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke2_``ORIGINAL \
    parent.INSTEAD(`args2_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC2(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`define invoke2_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
`define args2_``NAME`` ARG0, ARG1 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS2(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1); \
  __``NAME.called(ARG0, ARG1); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC2(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke2_``ORIGINAL \
    parent.INSTEAD(`args2_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC2(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`define invoke2_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
`define args2_``NAME`` ARG0, ARG1 \
`SVMOCK_FUNCTION_MOCKER_CLASS2(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1); \
  __``NAME.called(ARG0, ARG1); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC2(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke2_``ORIGINAL \
    return parent.INSTEAD(`args2_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK3(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`define invoke3_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2); \
`define args3_``NAME`` ARG0, ARG1, ARG2 \
`SVMOCK_TASK_MOCKER_CLASS3(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2); \
  __``NAME.called(ARG0, ARG1, ARG2); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2); \
`endif \
endtask

`define SVMOCK_MAP_TASK3(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke3_``ORIGINAL \
    parent.INSTEAD(`args3_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC3(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`define invoke3_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2); \
`define args3_``NAME`` ARG0, ARG1, ARG2 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS3(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2); \
  __``NAME.called(ARG0, ARG1, ARG2); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC3(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke3_``ORIGINAL \
    parent.INSTEAD(`args3_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC3(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`define invoke3_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2); \
`define args3_``NAME`` ARG0, ARG1, ARG2 \
`SVMOCK_FUNCTION_MOCKER_CLASS3(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2); \
  __``NAME.called(ARG0, ARG1, ARG2); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1, ARG2); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1, ARG2); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC3(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke3_``ORIGINAL \
    return parent.INSTEAD(`args3_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK4(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`define invoke4_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3); \
`define args4_``NAME`` ARG0, ARG1, ARG2, ARG3 \
`SVMOCK_TASK_MOCKER_CLASS4(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3); \
`endif \
endtask

`define SVMOCK_MAP_TASK4(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke4_``ORIGINAL \
    parent.INSTEAD(`args4_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC4(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`define invoke4_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3); \
`define args4_``NAME`` ARG0, ARG1, ARG2, ARG3 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS4(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC4(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke4_``ORIGINAL \
    parent.INSTEAD(`args4_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC4(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`define invoke4_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3); \
`define args4_``NAME`` ARG0, ARG1, ARG2, ARG3 \
`SVMOCK_FUNCTION_MOCKER_CLASS4(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC4(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke4_``ORIGINAL \
    return parent.INSTEAD(`args4_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK5(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`define invoke5_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4); \
`define args5_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4 \
`SVMOCK_TASK_MOCKER_CLASS5(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
`endif \
endtask

`define SVMOCK_MAP_TASK5(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke5_``ORIGINAL \
    parent.INSTEAD(`args5_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC5(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`define invoke5_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4); \
`define args5_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS5(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC5(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke5_``ORIGINAL \
    parent.INSTEAD(`args5_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC5(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`define invoke5_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4); \
`define args5_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4 \
`SVMOCK_FUNCTION_MOCKER_CLASS5(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC5(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke5_``ORIGINAL \
    return parent.INSTEAD(`args5_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK6(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`define invoke6_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5); \
`define args6_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5 \
`SVMOCK_TASK_MOCKER_CLASS6(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
`endif \
endtask

`define SVMOCK_MAP_TASK6(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke6_``ORIGINAL \
    parent.INSTEAD(`args6_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC6(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`define invoke6_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5); \
`define args6_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS6(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC6(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke6_``ORIGINAL \
    parent.INSTEAD(`args6_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC6(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`define invoke6_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5); \
`define args6_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5 \
`SVMOCK_FUNCTION_MOCKER_CLASS6(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC6(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke6_``ORIGINAL \
    return parent.INSTEAD(`args6_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK7(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`define invoke7_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6); \
`define args7_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6 \
`SVMOCK_TASK_MOCKER_CLASS7(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
`endif \
endtask

`define SVMOCK_MAP_TASK7(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke7_``ORIGINAL \
    parent.INSTEAD(`args7_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC7(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`define invoke7_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6); \
`define args7_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS7(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC7(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke7_``ORIGINAL \
    parent.INSTEAD(`args7_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC7(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`define invoke7_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6); \
`define args7_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6 \
`SVMOCK_FUNCTION_MOCKER_CLASS7(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC7(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke7_``ORIGINAL \
    return parent.INSTEAD(`args7_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK8(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`undef ARG7``_NODEFAULT \
`undef ARG7``_``DEF7 \
`undef NAME``_``ARG7``_``DEF7 \
`define ARG7``_``DEF7 \
`ifdef ARG7``_NODEFAULT \
  `define NAME``_``ARG7``_``DEF7 \
`else \
  `define NAME``_``ARG7``_``DEF7 =DEF7 \
`endif \
`define invoke8_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7); \
`define args8_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7 \
`SVMOCK_TASK_MOCKER_CLASS8(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6,DIR7,TYPE7,ARG7,MOD7,`NAME``_``ARG7``_``DEF7) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6, DIR7 TYPE7 ARG7 MOD7 `NAME``_``ARG7``_``DEF7); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
`endif \
endtask

`define SVMOCK_MAP_TASK8(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke8_``ORIGINAL \
    parent.INSTEAD(`args8_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC8(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`undef ARG7``_NODEFAULT \
`undef ARG7``_``DEF7 \
`undef NAME``_``ARG7``_``DEF7 \
`define ARG7``_``DEF7 \
`ifdef ARG7``_NODEFAULT \
  `define NAME``_``ARG7``_``DEF7 \
`else \
  `define NAME``_``ARG7``_``DEF7 =DEF7 \
`endif \
`define invoke8_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7); \
`define args8_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS8(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6,DIR7,TYPE7,ARG7,MOD7,`NAME``_``ARG7``_``DEF7) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6, DIR7 TYPE7 ARG7 MOD7 `NAME``_``ARG7``_``DEF7); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC8(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke8_``ORIGINAL \
    parent.INSTEAD(`args8_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC8(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`undef ARG7``_NODEFAULT \
`undef ARG7``_``DEF7 \
`undef NAME``_``ARG7``_``DEF7 \
`define ARG7``_``DEF7 \
`ifdef ARG7``_NODEFAULT \
  `define NAME``_``ARG7``_``DEF7 \
`else \
  `define NAME``_``ARG7``_``DEF7 =DEF7 \
`endif \
`define invoke8_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7); \
`define args8_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7 \
`SVMOCK_FUNCTION_MOCKER_CLASS8(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6,DIR7,TYPE7,ARG7,MOD7,`NAME``_``ARG7``_``DEF7) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6, DIR7 TYPE7 ARG7 MOD7 `NAME``_``ARG7``_``DEF7); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC8(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke8_``ORIGINAL \
    return parent.INSTEAD(`args8_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_TASK9(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT,DIR8,TYPE8,ARG8,MOD8,DEF8=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`undef ARG7``_NODEFAULT \
`undef ARG7``_``DEF7 \
`undef NAME``_``ARG7``_``DEF7 \
`define ARG7``_``DEF7 \
`ifdef ARG7``_NODEFAULT \
  `define NAME``_``ARG7``_``DEF7 \
`else \
  `define NAME``_``ARG7``_``DEF7 =DEF7 \
`endif \
`undef ARG8``_NODEFAULT \
`undef ARG8``_``DEF8 \
`undef NAME``_``ARG8``_``DEF8 \
`define ARG8``_``DEF8 \
`ifdef ARG8``_NODEFAULT \
  `define NAME``_``ARG8``_``DEF8 \
`else \
  `define NAME``_``ARG8``_``DEF8 =DEF8 \
`endif \
`define invoke9_``NAME`` virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
`define args9_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8 \
`SVMOCK_TASK_MOCKER_CLASS9(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6,DIR7,TYPE7,ARG7,MOD7,`NAME``_``ARG7``_``DEF7,DIR8,TYPE8,ARG8,MOD8,`NAME``_``ARG8``_``DEF8) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6, DIR7 TYPE7 ARG7 MOD7 `NAME``_``ARG7``_``DEF7, DIR8 TYPE8 ARG8 MOD8 `NAME``_``ARG8``_``DEF8); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
`endif \
endtask

`define SVMOCK_MAP_TASK9(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke9_``ORIGINAL \
    parent.INSTEAD(`args9_``ORIGINAL); \
  endtask \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_VFUNC9(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT,DIR8,TYPE8,ARG8,MOD8,DEF8=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`undef ARG7``_NODEFAULT \
`undef ARG7``_``DEF7 \
`undef NAME``_``ARG7``_``DEF7 \
`define ARG7``_``DEF7 \
`ifdef ARG7``_NODEFAULT \
  `define NAME``_``ARG7``_``DEF7 \
`else \
  `define NAME``_``ARG7``_``DEF7 =DEF7 \
`endif \
`undef ARG8``_NODEFAULT \
`undef ARG8``_``DEF8 \
`undef NAME``_``ARG8``_``DEF8 \
`define ARG8``_``DEF8 \
`ifdef ARG8``_NODEFAULT \
  `define NAME``_``ARG8``_``DEF8 \
`else \
  `define NAME``_``ARG8``_``DEF8 =DEF8 \
`endif \
`define invoke9_``NAME`` virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
`define args9_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8 \
`SVMOCK_VOID_FUNCTION_MOCKER_CLASS9(NAME,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6,DIR7,TYPE7,ARG7,MOD7,`NAME``_``ARG7``_``DEF7,DIR8,TYPE8,ARG8,MOD8,`NAME``_``ARG8``_``DEF8) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6, DIR7 TYPE7 ARG7 MOD7 `NAME``_``ARG7``_``DEF7, DIR8 TYPE8 ARG8 MOD8 `NAME``_``ARG8``_``DEF8); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  if (__``NAME.override != null) \
    __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
`ifdef MOCKTYPE_HAS_NO_PARENT \
`else \
  else \
    super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
`endif \
endfunction

`define SVMOCK_MAP_VFUNC9(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke9_``ORIGINAL \
    parent.INSTEAD(`args9_``ORIGINAL); \
  endfunction \
endclass \
__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

`define SVMOCK_FUNC9(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT,DIR8,TYPE8,ARG8,MOD8,DEF8=NODEFAULT) \
`undef ARG0``_NODEFAULT \
`undef ARG0``_``DEF0 \
`undef NAME``_``ARG0``_``DEF0 \
`define ARG0``_``DEF0 \
`ifdef ARG0``_NODEFAULT \
  `define NAME``_``ARG0``_``DEF0 \
`else \
  `define NAME``_``ARG0``_``DEF0 =DEF0 \
`endif \
`undef ARG1``_NODEFAULT \
`undef ARG1``_``DEF1 \
`undef NAME``_``ARG1``_``DEF1 \
`define ARG1``_``DEF1 \
`ifdef ARG1``_NODEFAULT \
  `define NAME``_``ARG1``_``DEF1 \
`else \
  `define NAME``_``ARG1``_``DEF1 =DEF1 \
`endif \
`undef ARG2``_NODEFAULT \
`undef ARG2``_``DEF2 \
`undef NAME``_``ARG2``_``DEF2 \
`define ARG2``_``DEF2 \
`ifdef ARG2``_NODEFAULT \
  `define NAME``_``ARG2``_``DEF2 \
`else \
  `define NAME``_``ARG2``_``DEF2 =DEF2 \
`endif \
`undef ARG3``_NODEFAULT \
`undef ARG3``_``DEF3 \
`undef NAME``_``ARG3``_``DEF3 \
`define ARG3``_``DEF3 \
`ifdef ARG3``_NODEFAULT \
  `define NAME``_``ARG3``_``DEF3 \
`else \
  `define NAME``_``ARG3``_``DEF3 =DEF3 \
`endif \
`undef ARG4``_NODEFAULT \
`undef ARG4``_``DEF4 \
`undef NAME``_``ARG4``_``DEF4 \
`define ARG4``_``DEF4 \
`ifdef ARG4``_NODEFAULT \
  `define NAME``_``ARG4``_``DEF4 \
`else \
  `define NAME``_``ARG4``_``DEF4 =DEF4 \
`endif \
`undef ARG5``_NODEFAULT \
`undef ARG5``_``DEF5 \
`undef NAME``_``ARG5``_``DEF5 \
`define ARG5``_``DEF5 \
`ifdef ARG5``_NODEFAULT \
  `define NAME``_``ARG5``_``DEF5 \
`else \
  `define NAME``_``ARG5``_``DEF5 =DEF5 \
`endif \
`undef ARG6``_NODEFAULT \
`undef ARG6``_``DEF6 \
`undef NAME``_``ARG6``_``DEF6 \
`define ARG6``_``DEF6 \
`ifdef ARG6``_NODEFAULT \
  `define NAME``_``ARG6``_``DEF6 \
`else \
  `define NAME``_``ARG6``_``DEF6 =DEF6 \
`endif \
`undef ARG7``_NODEFAULT \
`undef ARG7``_``DEF7 \
`undef NAME``_``ARG7``_``DEF7 \
`define ARG7``_``DEF7 \
`ifdef ARG7``_NODEFAULT \
  `define NAME``_``ARG7``_``DEF7 \
`else \
  `define NAME``_``ARG7``_``DEF7 =DEF7 \
`endif \
`undef ARG8``_NODEFAULT \
`undef ARG8``_``DEF8 \
`undef NAME``_``ARG8``_``DEF8 \
`define ARG8``_``DEF8 \
`ifdef ARG8``_NODEFAULT \
  `define NAME``_``ARG8``_``DEF8 \
`else \
  `define NAME``_``ARG8``_``DEF8 =DEF8 \
`endif \
`define invoke9_``NAME`` virtual function RETURNS NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
`define args9_``NAME`` ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8 \
`SVMOCK_FUNCTION_MOCKER_CLASS9(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,`NAME``_``ARG0``_``DEF0,DIR1,TYPE1,ARG1,MOD1,`NAME``_``ARG1``_``DEF1,DIR2,TYPE2,ARG2,MOD2,`NAME``_``ARG2``_``DEF2,DIR3,TYPE3,ARG3,MOD3,`NAME``_``ARG3``_``DEF3,DIR4,TYPE4,ARG4,MOD4,`NAME``_``ARG4``_``DEF4,DIR5,TYPE5,ARG5,MOD5,`NAME``_``ARG5``_``DEF5,DIR6,TYPE6,ARG6,MOD6,`NAME``_``ARG6``_``DEF6,DIR7,TYPE7,ARG7,MOD7,`NAME``_``ARG7``_``DEF7,DIR8,TYPE8,ARG8,MOD8,`NAME``_``ARG8``_``DEF8) \
__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0 `NAME``_``ARG0``_``DEF0, DIR1 TYPE1 ARG1 MOD1 `NAME``_``ARG1``_``DEF1, DIR2 TYPE2 ARG2 MOD2 `NAME``_``ARG2``_``DEF2, DIR3 TYPE3 ARG3 MOD3 `NAME``_``ARG3``_``DEF3, DIR4 TYPE4 ARG4 MOD4 `NAME``_``ARG4``_``DEF4, DIR5 TYPE5 ARG5 MOD5 `NAME``_``ARG5``_``DEF5, DIR6 TYPE6 ARG6 MOD6 `NAME``_``ARG6``_``DEF6, DIR7 TYPE7 ARG7 MOD7 `NAME``_``ARG7``_``DEF7, DIR8 TYPE8 ARG8 MOD8 `NAME``_``ARG8``_``DEF8); \
  __``NAME.called(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  if (__``NAME.override != null) \
    return __``NAME.override.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
  else if (__``NAME.overrideReturn) \
    return __``NAME.returnsVal; \
`ifdef MOCKTYPE_HAS_NO_PARENT \
  else \
    begin \
      RETURN bogus; \
      return bogus; \
    end \
`else \
  else \
    return super.NAME(ARG0, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8); \
`endif \
endfunction

`define SVMOCK_MAP_FUNC9(ORIGINAL,INSTEAD) \
class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \
  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \
    super.new(name, __mockers, _parent, associate); \
  endfunction \
  `invoke9_``ORIGINAL \
    return parent.INSTEAD(`args9_``ORIGINAL); \
  endfunction \
endclass \
 __``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); 

