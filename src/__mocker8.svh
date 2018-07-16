`define SVMOCK_MOCKER_CLASS8(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,MODIFIER=) \
class __``NAME``MODIFIER``__mocker #(type PARENT=int) extends __mocker; \
PARENT parent; \
function new(string name, ref __mocker __mockers[$], input PARENT _parent); \
  super.new(name, __mockers); \
  parent = _parent; \
endfunction \
`MOCKER_WITH(NAME0, TYPE0, MOD0) \
NAME0``__with __with_0 [$]; \
`MOCKER_WITH(NAME1, TYPE1, MOD1) \
NAME1``__with __with_1 [$]; \
`MOCKER_WITH(NAME2, TYPE2, MOD2) \
NAME2``__with __with_2 [$]; \
`MOCKER_WITH(NAME3, TYPE3, MOD3) \
NAME3``__with __with_3 [$]; \
`MOCKER_WITH(NAME4, TYPE4, MOD4) \
NAME4``__with __with_4 [$]; \
`MOCKER_WITH(NAME5, TYPE5, MOD5) \
NAME5``__with __with_5 [$]; \
`MOCKER_WITH(NAME6, TYPE6, MOD6) \
NAME6``__with __with_6 [$]; \
`MOCKER_WITH(NAME7, TYPE7, MOD7) \
NAME7``__with __with_7 [$]; \
function void called(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7); \
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
endfunction \
function void with_args(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7); \
  begin \
    NAME0``__with __w = new(); \
    __w.exp = ARG0; \
    __with_0.push_back(__w); \
  end \
  begin \
    NAME1``__with __w = new(); \
    __w.exp = ARG1; \
    __with_1.push_back(__w); \
  end \
  begin \
    NAME2``__with __w = new(); \
    __w.exp = ARG2; \
    __with_2.push_back(__w); \
  end \
  begin \
    NAME3``__with __w = new(); \
    __w.exp = ARG3; \
    __with_3.push_back(__w); \
  end \
  begin \
    NAME4``__with __w = new(); \
    __w.exp = ARG4; \
    __with_4.push_back(__w); \
  end \
  begin \
    NAME5``__with __w = new(); \
    __w.exp = ARG5; \
    __with_5.push_back(__w); \
  end \
  begin \
    NAME6``__with __w = new(); \
    __w.exp = ARG6; \
    __with_6.push_back(__w); \
  end \
  begin \
    NAME7``__with __w = new(); \
    __w.exp = ARG7; \
    __with_7.push_back(__w); \
  end \
endfunction \
function bit check(); \
  check = super.check(); \
  while (__with_0.size() > 0) begin \
    check &= __with_0[0].compare(); \
    __with_0.pop_front(); \
  end \
  while (__with_1.size() > 0) begin \
    check &= __with_1[0].compare(); \
    __with_1.pop_front(); \
  end \
  while (__with_2.size() > 0) begin \
    check &= __with_2[0].compare(); \
    __with_2.pop_front(); \
  end \
  while (__with_3.size() > 0) begin \
    check &= __with_3[0].compare(); \
    __with_3.pop_front(); \
  end \
  while (__with_4.size() > 0) begin \
    check &= __with_4[0].compare(); \
    __with_4.pop_front(); \
  end \
  while (__with_5.size() > 0) begin \
    check &= __with_5[0].compare(); \
    __with_5.pop_front(); \
  end \
  while (__with_6.size() > 0) begin \
    check &= __with_6[0].compare(); \
    __with_6.pop_front(); \
  end \
  while (__with_7.size() > 0) begin \
    check &= __with_7[0].compare(); \
    __with_7.pop_front(); \
  end \
  return check; \
endfunction \
function void clear(); \
  super.clear; \
  __with_0.delete(); \
  __with_1.delete(); \
  __with_2.delete(); \
  __with_3.delete(); \
  __with_4.delete(); \
  __with_5.delete(); \
  __with_6.delete(); \
  __with_7.delete(); \
endfunction \
endclass

`define SVMOCK_FUNCTION_MOCKER_CLASS8(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`SVMOCK_MOCKER_CLASS8(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function RETURNS NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7); \
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

`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`SVMOCK_MOCKER_CLASS8(NAME,RETURNS,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual function void NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7); \
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

`define SVMOCK_TASK_MOCKER_CLASS8(NAME,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7) \
`SVMOCK_MOCKER_CLASS8(NAME,void,TYPE0,ARG0,MOD0,TYPE1,ARG1,MOD1,TYPE2,ARG2,MOD2,TYPE3,ARG3,MOD3,TYPE4,ARG4,MOD4,TYPE5,ARG5,MOD5,TYPE6,ARG6,MOD6,TYPE7,ARG7,MOD7,_base) \
class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \
function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \
  super.new(name, __mockers, _parent); \
  if (associate != null) associate.map[name] = this; \
endfunction \
virtual task NAME(TYPE0 ARG0 MOD0,TYPE1 ARG1 MOD1,TYPE2 ARG2 MOD2,TYPE3 ARG3 MOD3,TYPE4 ARG4 MOD4,TYPE5 ARG5 MOD5,TYPE6 ARG6 MOD6,TYPE7 ARG7 MOD7); \
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
