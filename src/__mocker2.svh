`define SVMOCK_MOCKER_CLASS2(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT,MODIFIER=) \
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
function void called(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
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
endfunction \
function void with_args(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
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
endfunction \
function bit check(); \
  string error_signature [int]; \
  check = super.check(); \
  for (int i=0; i<__with_0.size(); i+=1) begin \
    bit comp = __with_0[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG0`"; \
      if (!error_signature.exists(i)) begin \
        string es; \
        $sformat(es, "EXPECT_CALL::with_args[%0d].miscompare %s::%s: (%s)", i, _name, _arg, __with_0[i].as_string()); \
        error_signature[i] = es; \
      end \
      else \
        $sformat(error_signature[i], "%s\n                                     %s::%s: (%s)", error_signature[i], _name, _arg, __with_0[i].as_string()); \
    end \
    check &= comp; \
  end \
  for (int i=0; i<__with_1.size(); i+=1) begin \
    bit comp = __with_1[i].compare(); \
    if (!comp) begin \
      string _name = `"NAME`"; \
      string _arg = `"ARG1`"; \
      if (!error_signature.exists(i)) begin \
        string es; \
        $sformat(es, "EXPECT_CALL::with_args[%0d].miscompare %s::%s: (%s)", i, _name, _arg, __with_1[i].as_string()); \
        error_signature[i] = es; \
      end \
      else \
        $sformat(error_signature[i], "%s\n                                     %s::%s: (%s)", error_signature[i], _name, _arg, __with_1[i].as_string()); \
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
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS2(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT) \
`SVMOCK_MOCKER_CLASS2(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0,DIR1,TYPE1,ARG1,MOD1,DEF1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURN NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
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

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS2(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT) \
`SVMOCK_MOCKER_CLASS2(NAME,RETURN,DIR0,TYPE0,ARG0,MOD0,DEF0,DIR1,TYPE1,ARG1,MOD1,DEF1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
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

`define SVMOCK_TASK_MOCKER_CLASS2(NAME,DIR0,TYPE0,ARG0,MOD0,DEF0=NODEFAULT,DIR1,TYPE1,ARG1,MOD1,DEF1=NODEFAULT) \
`SVMOCK_MOCKER_CLASS2(NAME,void,DIR0,TYPE0,ARG0,MOD0,DEF0,DIR1,TYPE1,ARG1,MOD1,DEF1,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(DIR0 TYPE0 ARG0 MOD0,DIR1 TYPE1 ARG1 MOD1); \
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
