`define SVMOCK_MOCKER_CLASS9(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT,DIR8,TYPE8,ARG8,MOD8,DEF8=NODEFAULT,MODIFIER=) \
class __``NAME``MODIFIER``__mocker #(type PARENT=int) extends __mocker; \
PARENT parent; \
function new(string name, ref __mocker __mockers[$], input PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME,ARG0,TYPE0,MOD0) \
ARG0``__with __with_0 [$]; \
`MOCKER_WITH(NAME,ARG1,TYPE1,MOD1) \
ARG1``__with __with_1 [$]; \
`MOCKER_WITH(NAME,ARG2,TYPE2,MOD2) \
ARG2``__with __with_2 [$]; \
`MOCKER_WITH(NAME,ARG3,TYPE3,MOD3) \
ARG3``__with __with_3 [$]; \
`MOCKER_WITH(NAME,ARG4,TYPE4,MOD4) \
ARG4``__with __with_4 [$]; \
`MOCKER_WITH(NAME,ARG5,TYPE5,MOD5) \
ARG5``__with __with_5 [$]; \
`MOCKER_WITH(NAME,ARG6,TYPE6,MOD6) \
ARG6``__with __with_6 [$]; \
`MOCKER_WITH(NAME,ARG7,TYPE7,MOD7) \
ARG7``__with __with_7 [$]; \
`MOCKER_WITH(NAME,ARG8,TYPE8,MOD8) \
ARG8``__with __with_8 [$]; \
function void called(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
  timesCnt += 1; \
  for (int i=0; i<__with_0.size(); i+=1) begin \
    if (!__with_0[i].done) begin \
      __with_0[i].act = ARG0; \
      __with_0[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_1.size(); i+=1) begin \
    if (!__with_1[i].done) begin \
      __with_1[i].act = ARG1; \
      __with_1[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_2.size(); i+=1) begin \
    if (!__with_2[i].done) begin \
      __with_2[i].act = ARG2; \
      __with_2[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_3.size(); i+=1) begin \
    if (!__with_3[i].done) begin \
      __with_3[i].act = ARG3; \
      __with_3[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_4.size(); i+=1) begin \
    if (!__with_4[i].done) begin \
      __with_4[i].act = ARG4; \
      __with_4[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_5.size(); i+=1) begin \
    if (!__with_5[i].done) begin \
      __with_5[i].act = ARG5; \
      __with_5[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_6.size(); i+=1) begin \
    if (!__with_6[i].done) begin \
      __with_6[i].act = ARG6; \
      __with_6[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_7.size(); i+=1) begin \
    if (!__with_7[i].done) begin \
      __with_7[i].act = ARG7; \
      __with_7[i].done = 1; \
      break; \
    end \
  end \
  for (int i=0; i<__with_8.size(); i+=1) begin \
    if (!__with_8[i].done) begin \
      __with_8[i].act = ARG8; \
      __with_8[i].done = 1; \
      break; \
    end \
  end \
endfunction \
function void with_args(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
  begin \
    ARG0``__with __w = new(); \
    __w.exp = ARG0; \
    __with_0.push_back(__w); \
  end \
  begin \
    ARG1``__with __w = new(); \
    __w.exp = ARG1; \
    __with_1.push_back(__w); \
  end \
  begin \
    ARG2``__with __w = new(); \
    __w.exp = ARG2; \
    __with_2.push_back(__w); \
  end \
  begin \
    ARG3``__with __w = new(); \
    __w.exp = ARG3; \
    __with_3.push_back(__w); \
  end \
  begin \
    ARG4``__with __w = new(); \
    __w.exp = ARG4; \
    __with_4.push_back(__w); \
  end \
  begin \
    ARG5``__with __w = new(); \
    __w.exp = ARG5; \
    __with_5.push_back(__w); \
  end \
  begin \
    ARG6``__with __w = new(); \
    __w.exp = ARG6; \
    __with_6.push_back(__w); \
  end \
  begin \
    ARG7``__with __w = new(); \
    __w.exp = ARG7; \
    __with_7.push_back(__w); \
  end \
  begin \
    ARG8``__with __w = new(); \
    __w.exp = ARG8; \
    __with_8.push_back(__w); \
  end \
endfunction \
function bit check(); \
  string error_signature [int]; \
  check = super.check(); \
  for (int i=0; i<__with_0.size(); i+=1) begin \
    bit comp = __with_0[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG0`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_0[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_0[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_1.size(); i+=1) begin \
    bit comp = __with_1[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG1`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_1[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_1[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_2.size(); i+=1) begin \
    bit comp = __with_2[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG2`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_2[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_2[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_3.size(); i+=1) begin \
    bit comp = __with_3[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG3`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_3[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_3[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_4.size(); i+=1) begin \
    bit comp = __with_4[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG4`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_4[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_4[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_5.size(); i+=1) begin \
    bit comp = __with_5[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG5`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_5[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_5[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_6.size(); i+=1) begin \
    bit comp = __with_6[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG6`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_6[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_6[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_7.size(); i+=1) begin \
    bit comp = __with_7[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG7`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_7[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_7[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_8.size(); i+=1) begin \
    bit comp = __with_8[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG8`"; \
      if (!error_signature.exists(i)) \
        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_8[i].as_string()); \
      else \
        $sformat(error_signature[i], "%s\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_8[i].as_string()); \
    end \
    check &= comp; \
  end \
  foreach (error_signature[i]) $display(error_signature[i]); \
  clear(); \
  return check; \
endfunction \
virtual function void clear(); \
  super.clear; \
  __with_0.delete(); \
  __with_1.delete(); \
  __with_2.delete(); \
  __with_3.delete(); \
  __with_4.delete(); \
  __with_5.delete(); \
  __with_6.delete(); \
  __with_7.delete(); \
  __with_8.delete(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS9(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT,DIR8,TYPE8,ARG8,MOD8,DEF8=NODEFAULT) \
`SVMOCK_MOCKER_CLASS9(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0,DIR1,TYPE1,ARG1,MOD1,DEF1,DIR2,TYPE2,ARG2,MOD2,DEF2,DIR3,TYPE3,ARG3,MOD3,DEF3,DIR4,TYPE4,ARG4,MOD4,DEF4,DIR5,TYPE5,ARG5,MOD5,DEF5,DIR6,TYPE6,ARG6,MOD6,DEF6,DIR7,TYPE7,ARG7,MOD7,DEF7,DIR8,TYPE8,ARG8,MOD8,DEF8,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
  return NAME; \
endfunction \
RETURN returnsVal; \
function void returns(RETURN r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
virtual function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS9(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT,DIR8,TYPE8,ARG8,MOD8,DEF8=NODEFAULT) \
`SVMOCK_MOCKER_CLASS9(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0,DIR1,TYPE1,ARG1,MOD1,DEF1,DIR2,TYPE2,ARG2,MOD2,DEF2,DIR3,TYPE3,ARG3,MOD3,DEF3,DIR4,TYPE4,ARG4,MOD4,DEF4,DIR5,TYPE5,ARG5,MOD5,DEF5,DIR6,TYPE6,ARG6,MOD6,DEF6,DIR7,TYPE7,ARG7,MOD7,DEF7,DIR8,TYPE8,ARG8,MOD8,DEF8,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
virtual function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_TASK_MOCKER_CLASS9(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,DIR2,TYPE2,ARG2,MOD2,DEF2=NODEFAULT,DIR3,TYPE3,ARG3,MOD3,DEF3=NODEFAULT,DIR4,TYPE4,ARG4,MOD4,DEF4=NODEFAULT,DIR5,TYPE5,ARG5,MOD5,DEF5=NODEFAULT,DIR6,TYPE6,ARG6,MOD6,DEF6=NODEFAULT,DIR7,TYPE7,ARG7,MOD7,DEF7=NODEFAULT,DIR8,TYPE8,ARG8,MOD8,DEF8=NODEFAULT) \
`SVMOCK_MOCKER_CLASS9(NAME,void,DIR0,TYPE0,ARG0,MOD0,DEF0,DIR1,TYPE1,ARG1,MOD1,DEF1,DIR2,TYPE2,ARG2,MOD2,DEF2,DIR3,TYPE3,ARG3,MOD3,DEF3,DIR4,TYPE4,ARG4,MOD4,DEF4,DIR5,TYPE5,ARG5,MOD5,DEF5,DIR6,TYPE6,ARG6,MOD6,DEF6,DIR7,TYPE7,ARG7,MOD7,DEF7,DIR8,TYPE8,ARG8,MOD8,DEF8,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1,DIR2 TYPE2 ARG2 MOD2,DIR3 TYPE3 ARG3 MOD3,DIR4 TYPE4 ARG4 MOD4,DIR5 TYPE5 ARG5 MOD5,DIR6 TYPE6 ARG6 MOD6,DIR7 TYPE7 ARG7 MOD7,DIR8 TYPE8 ARG8 MOD8); \
endtask \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
virtual function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass
