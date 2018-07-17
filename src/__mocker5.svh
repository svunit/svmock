`define SVMOCK_MOCKER_CLASS5(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,MODIFIER=) \
class __``NAME``MODIFIER``__mocker #(type PARENT=int) extends __mocker; \
PARENT parent; \
function new(string name, ref __mocker __mockers[$], input PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME``ARG0, TYPE0, MOD0) \
NAME``ARG0``__with __with_0 [$]; \
`MOCKER_WITH(NAME``ARG1, TYPE1, MOD1) \
NAME``ARG1``__with __with_1 [$]; \
`MOCKER_WITH(NAME``ARG2, TYPE2, MOD2) \
NAME``ARG2``__with __with_2 [$]; \
`MOCKER_WITH(NAME``ARG3, TYPE3, MOD3) \
NAME``ARG3``__with __with_3 [$]; \
`MOCKER_WITH(NAME``ARG4, TYPE4, MOD4) \
NAME``ARG4``__with __with_4 [$]; \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4); \
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
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4); \
  begin \
    NAME``ARG0``__with __w = new(); \
    __w.exp = ARG0; \
    __with_0.push_back(__w); \
  end \
  begin \
    NAME``ARG1``__with __w = new(); \
    __w.exp = ARG1; \
    __with_1.push_back(__w); \
  end \
  begin \
    NAME``ARG2``__with __w = new(); \
    __w.exp = ARG2; \
    __with_2.push_back(__w); \
  end \
  begin \
    NAME``ARG3``__with __w = new(); \
    __w.exp = ARG3; \
    __with_3.push_back(__w); \
  end \
  begin \
    NAME``ARG4``__with __w = new(); \
    __w.exp = ARG4; \
    __with_4.push_back(__w); \
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
  for (int i=0; i<__with_0.size(); i+=1) begin \
    if (error_signature[i] != "") $display(error_signature[i]); \
  end \
  __with_0.delete(); \
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
  for (int i=0; i<__with_1.size(); i+=1) begin \
    if (error_signature[i] != "") $display(error_signature[i]); \
  end \
  __with_1.delete(); \
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
  for (int i=0; i<__with_2.size(); i+=1) begin \
    if (error_signature[i] != "") $display(error_signature[i]); \
  end \
  __with_2.delete(); \
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
  for (int i=0; i<__with_3.size(); i+=1) begin \
    if (error_signature[i] != "") $display(error_signature[i]); \
  end \
  __with_3.delete(); \
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
  for (int i=0; i<__with_4.size(); i+=1) begin \
    if (error_signature[i] != "") $display(error_signature[i]); \
  end \
  __with_4.delete(); \
  return check; \
endfunction \
function void clear(); \
  super.clear; \
  __with_0.delete(); \
  __with_1.delete(); \
  __with_2.delete(); \
  __with_3.delete(); \
  __with_4.delete(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS5(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`SVMOCK_MOCKER_CLASS5(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4); \
  return NAME; \
endfunction \
RETURNS returnsVal; \
function void returns(RETURNS r); \
  overrideReturn = 1; \
  returnsVal = r; \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`SVMOCK_MOCKER_CLASS5(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4); \
endfunction \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass

`define SVMOCK_TASK_MOCKER_CLASS5(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4) \
`SVMOCK_MOCKER_CLASS5(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4); \
endtask \
__``NAME``__mocker #(PARENT) map [string]; \
__``NAME``__mocker #(PARENT) override; \
function void will_by_default(string i); \
  override = map[i]; \
endfunction \
function void clear(); \
  super.clear(); \
  override = null; \
endfunction \
endclass
