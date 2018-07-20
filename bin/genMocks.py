################################
#### MOCK FUNCTIONS MACROS #####
################################

def defaultMacros(numargs):
  ret = ''
  for j in range(0,numargs):
    ret += '`undef ARG%0d``_NODEFAULT \\\n' % (j)
    ret += '`undef ARG%0d``_``DEF%0d \\\n' % (j,j)
    ret += '`undef NAME``_``ARG%0d``_``DEF%0d \\\n' % (j,j)
    ret += '`define ARG%0d``_``DEF%0d \\\n' % (j,j)
    ret += '`ifdef ARG%0d``_NODEFAULT \\\n' % (j)
    ret += '  `define NAME``_``ARG%0d``_``DEF%0d \\\n' % (j,j)
    ret += '`else \\\n'
    ret += '  `define NAME``_``ARG%0d``_``DEF%0d =DEF%0d \\\n' % (j,j,j)
    ret += '`endif \\\n'
  return ret

def function_macro(numargs, fout):
  fout.write ('`define SVMOCK_FUNC%0d(NAME,RETURN%s) \\\n'                       % (numargs, allArgString(numargs, ',', ',', '=NODEFAULT')) +
              defaultMacros(numargs) +
              '`define invoke%0d_``NAME`` virtual function RETURN NAME(%s) \\\n' % (numargs, method_args(numargs)) +
              '`define args%0d_``NAME`` %s \\\n'                                 % (numargs, method_arg_names(numargs)) +

              '`SVMOCK_FUNCTION_MOCKER_CLASS%0d(NAME,RETURN%s) \\\n'             % (numargs, allArgString(numargs, ',', ',', 'MACRO')) +
              '__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \\\n' +
              'virtual function RETURN NAME(%s); \\\n'                           % method_args(numargs) +
              '  __``NAME.called(%s); \\\n'                                      % method_arg_names(numargs) +
              '  if (__``NAME.override != null) \\\n' +
              '    return __``NAME.override.NAME(%s); \\\n'                       % method_arg_names(numargs) +
              '  else if (__``NAME.overrideReturn) \\\n' +
              '    return __``NAME.returnsVal; \\\n' +
              '`ifdef MOCKTYPE_HAS_NO_PARENT \\\n' +
              '  else \\\n' +
              '    begin \\\n' +
              '      RETURN bogus; \\\n' +
              '      return bogus; \\\n' +
              '    end \\\n' +
              '`else \\\n' +
              '  else \\\n' +
              '    return super.NAME(%s); \\\n'                                  % method_arg_names(numargs) +
              '`endif \\\n' +
              'endfunction\n\n')

def void_function_macro(numargs, fout):
  fout.write ('`define SVMOCK_VFUNC%0d(NAME%s) \\\n'                             % (numargs, allArgString(numargs, ',', ',', '=NODEFAULT')) +
              defaultMacros(numargs) +
              '`define invoke%0d_``NAME`` virtual function void NAME(%s) \\\n'   % (numargs, method_args(numargs)) +
              '`define args%0d_``NAME`` %s \\\n'                                 % (numargs, method_arg_names(numargs)) +

              '`SVMOCK_VOID_FUNCTION_MOCKER_CLASS%0d(NAME%s) \\\n'               % (numargs, allArgString(numargs, ',', ',', 'MACRO')) +
              '__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \\\n' +
              'virtual function void NAME(%s); \\\n'                             % method_args(numargs) +
              '  __``NAME.called(%s); \\\n'                                      % method_arg_names(numargs) +
              '  if (__``NAME.override != null) \\\n' +
              '    __``NAME.override.NAME(%s); \\\n'                              % method_arg_names(numargs) +
              '`ifdef MOCKTYPE_HAS_NO_PARENT \\\n' +
              '`else \\\n' +
              '  else \\\n' +
              '    super.NAME(%s); \\\n'                                         % method_arg_names(numargs) +
              '`endif \\\n' +
              'endfunction\n\n')

def task_macro(numargs, fout):
  fout.write ('`define SVMOCK_TASK%0d(NAME%s) \\\n'                              % (numargs, allArgString(numargs, ',', ',', '=NODEFAULT')) +
              defaultMacros(numargs) +
              '`define invoke%0d_``NAME`` virtual task NAME(%s) \\\n'            % (numargs, method_args(numargs)) +
              '`define args%0d_``NAME`` %s \\\n'                                 % (numargs, method_arg_names(numargs)) +

              '`SVMOCK_TASK_MOCKER_CLASS%0d(NAME%s) \\\n'                        % (numargs, allArgString(numargs, ',', ',', 'MACRO')) +
              '__``NAME``__mocker #(PARENT) __``NAME = new("NAME", __mockers, this); \\\n' +
              'virtual task NAME(%s); \\\n'                                      % method_args(numargs) +
              '  __``NAME.called(%s); \\\n'                                      % method_arg_names(numargs) +
              '  if (__``NAME.override != null) \\\n' +
              '    __``NAME.override.NAME(%s); \\\n'                              % method_arg_names(numargs) +
              '`ifdef MOCKTYPE_HAS_NO_PARENT \\\n' +
              '`else \\\n' +
              '  else \\\n' +
              '    super.NAME(%s); \\\n'                                         % method_arg_names(numargs) +
              '`endif \\\n' +
              'endtask\n\n')




########################
###### MAP MACROS ######
########################

def map_function_macro(numargs, fout):
  fout.write ('`define SVMOCK_MAP_FUNC%0d(ORIGINAL,INSTEAD) \\\n' % numargs +

              'class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \\\n' +
              '  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \\\n' +
              '    super.new(name, __mockers, _parent, associate); \\\n' +
              '  endfunction \\\n' +

              '  `invoke%0d_``ORIGINAL; \\\n' % numargs +
              '    return parent.INSTEAD(`args%0d_``ORIGINAL); \\\n' % numargs +
              '  endfunction \\\n' +
              'endclass \\\n ' +

              '__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \n\n')

def map_void_function_macro(numargs, fout):
  fout.write ('`define SVMOCK_MAP_VFUNC%0d(ORIGINAL,INSTEAD) \\\n' % numargs +

              'class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \\\n' +
              '  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \\\n' +
              '    super.new(name, __mockers, _parent, associate); \\\n' +
              '  endfunction \\\n' +

              '  `invoke%0d_``ORIGINAL; \\\n' % numargs +
              '    parent.INSTEAD(`args%0d_``ORIGINAL); \\\n' % numargs +
              '  endfunction \\\n' +
              'endclass \\\n' +

              '__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \n\n')

def map_task_macro(numargs, fout):
  fout.write ('`define SVMOCK_MAP_TASK%0d(ORIGINAL,INSTEAD) \\\n' % numargs +

              'class __``INSTEAD``__mocker #(type PARENT=int) extends __``ORIGINAL``__mocker #(PARENT); \\\n' +
              '  function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``ORIGINAL``__mocker #(PARENT) associate = null); \\\n' +
              '    super.new(name, __mockers, _parent, associate); \\\n' +
              '  endfunction \\\n' +

              '  `invoke%0d_``ORIGINAL; \\\n' % numargs +
              '    parent.INSTEAD(`args%0d_``ORIGINAL); \\\n' % numargs +
              '  endtask \\\n' +
              'endclass \\\n' +

              '__``INSTEAD``__mocker #(PARENT) __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \n\n')

def mockers(numargs):
  fout = open('../src/__mocker' + str(numargs) + '.svh', 'w+')

  base_mocker_class(numargs, fout)
  function_mocker_class(numargs, fout)
  void_function_mocker_class(numargs, fout)
  task_mocker_class(numargs, fout)




###############################
###### MOCK CLASS MACROS ######
###############################

def base_mocker_class(numargs, fout):
  # macro header
  fout.write ('`define SVMOCK_MOCKER_CLASS%0d(NAME,RETURNS%s,MODIFIER=) \\\n' % (numargs, allArgString(numargs, ',', ',', '=NODEFAULT')) +
              'class __``NAME``MODIFIER``__mocker #(type PARENT=int) extends __mocker; \\\n' +

              'PARENT parent; \\\n' +
              'function new(string name, ref __mocker __mockers[$], input PARENT _parent); \\\n' +
              '  super.new(name, __mockers); \\\n' +
              '  parent = _parent; \\\n' +
              'endfunction \\\n' +

              with_comparison_properties(numargs) +

              functionDecl('called',numargs) + ' \\\n' +                   # called
              '  timesCnt += 1; \\\n' +
                 with_property_assignments(numargs) +
              'endfunction \\\n' +

              functionDecl('with_args',numargs) + ' \\\n' +                # with
                 with_property_assignments(numargs, 'exp') +
              'endfunction \\\n' +

              'function bit check(); \\\n' +                               # check
              '  string error_signature [int]; \\\n' +
              '  check = super.check(); \\\n' +
                 with_property_check(numargs) +
              '  clear(); \\\n' +
              '  return check; \\\n' +
              'endfunction \\\n' +

              'function void clear(); \\\n' +                              # clear
              '  super.clear; \\\n' +
                 with_property_clear(numargs) +
              'endfunction \\\n' +

              'endclass\n\n')

def function_mocker_class(numargs, fout):
  fout.write ('`define SVMOCK_FUNCTION_MOCKER_CLASS%0d(NAME,RETURNS%s) \\\n' % (numargs, allArgString(numargs, ',', ',', '=NODEFAULT')) +
              '`SVMOCK_MOCKER_CLASS%0d(NAME,RETURNS%s,_base) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              'class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \\\n' +

              'function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \\\n' +
              '  super.new(name, __mockers, _parent); \\\n' +
              '  if (associate != null) associate.map[name] = this; \\\n' +
              'endfunction \\\n' +

              'virtual ' + functionDecl('NAME',numargs,'RETURNS') + ' \\\n' +     # NAME
              '  return NAME; \\\n' +     # NAME
              'endfunction \\\n' +

              'RETURNS returnsVal; \\\n' +
              'function void returns(RETURNS r); \\\n' +                          # returns
              '  overrideReturn = 1; \\\n' +
              '  returnsVal = r; \\\n' +
              'endfunction \\\n' +

              '__``NAME``__mocker #(PARENT) map [string]; \\\n' +
              '__``NAME``__mocker #(PARENT) override; \\\n' +
              'function void will_by_default(string i); \\\n' +                   # will_by_default
              '  override = map[i]; \\\n' +
              'endfunction \\\n' +

              'function void clear(); \\\n' +                                     # clear
              '  super.clear(); \\\n' +
              '  override = null; \\\n' +
              'endfunction \\\n' +

              'endclass\n\n')

def void_function_mocker_class(numargs, fout):
  fout.write ('`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS%0d(NAME%s) \\\n' % (numargs, allArgString(numargs, ',', ',', '=NODEFAULT')) +
              '`SVMOCK_MOCKER_CLASS%0d(NAME,RETURNS%s,_base) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              'class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \\\n' +

              'function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \\\n' +
              '  super.new(name, __mockers, _parent); \\\n' +
              '  if (associate != null) associate.map[name] = this; \\\n' +
              'endfunction \\\n' +

              'virtual ' + functionDecl('NAME',numargs) + ' \\\n' +              # NAME
              'endfunction \\\n' +

              '__``NAME``__mocker #(PARENT) map [string]; \\\n' +                # will_by_default
              '__``NAME``__mocker #(PARENT) override; \\\n' +
              'function void will_by_default(string i); \\\n' +
              '  override = map[i]; \\\n' +
              'endfunction \\\n' +

              'function void clear(); \\\n' +                                    # clear
              '  super.clear(); \\\n' +
              '  override = null; \\\n' +
              'endfunction \\\n' +

              'endclass\n\n')

def task_mocker_class(numargs, fout):
  fout.write ('`define SVMOCK_TASK_MOCKER_CLASS%0d(NAME%s) \\\n' % (numargs, allArgString(numargs, ',', ',', '=NODEFAULT')) +
              '`SVMOCK_MOCKER_CLASS%0d(NAME,void%s,_base) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              'class __``NAME``__mocker #(type PARENT=int) extends __``NAME``_base__mocker #(PARENT); \\\n' +

              'function new(string name, ref __mocker __mockers[$], input PARENT _parent, input __``NAME``__mocker #(PARENT) associate = null); \\\n' +
              '  super.new(name, __mockers, _parent); \\\n' +
              '  if (associate != null) associate.map[name] = this; \\\n' +
              'endfunction \\\n' +


              'virtual ' + taskDecl('NAME',numargs) + ' \\\n' +                  # NAME
              'endtask \\\n' +

              '__``NAME``__mocker #(PARENT) map [string]; \\\n' +                # will_by_default
              '__``NAME``__mocker #(PARENT) override; \\\n' +
              'function void will_by_default(string i); \\\n' +
              '  override = map[i]; \\\n' +
              'endfunction \\\n' +

              'function void clear(); \\\n' +                                    # clear
              '  super.clear(); \\\n' +
              '  override = null; \\\n' +
              'endfunction \\\n' +

              'endclass\n')




################################
###### HELPER FUNCTIONS ########
################################

def with_comparison_properties(numargs):
  ret = ''
  for j in range(0,numargs):
    ret += '`MOCKER_WITH(NAME,ARG%0d,TYPE%0d,MOD%0d) \\\n' % (j,j,j)
    ret += 'ARG%0d``__with __with_%0d [$]; \\\n' % (j,j)
  return ret

def with_property_assignments(numargs, type='act'):
  ret = ''
  if (type == 'exp'):
    for j in range(0,numargs):
      ret += '  begin \\\n'
      ret += '    ARG%0d``__with __w = new(); \\\n' % j
      ret += '    __w.%s = ARG%0d; \\\n' % (type,j)
      ret += '    __with_%0d.push_back(__w); \\\n' % (j)
      ret += '  end \\\n'
  else:
    for j in range(0,numargs):
      ret += '  for (int i=0; i<__with_%0d.size(); i+=1) begin \\\n' % j
      ret += '    if (!__with_%0d[i].done) begin \\\n' % j
      ret += '      __with_%0d[i].%s = ARG%0d; \\\n' % (j,type,j)
      ret += '      __with_%0d[i].done = 1; \\\n' % j
      ret += '      break; \\\n'
      ret += '    end \\\n'
      ret += '  end \\\n'
  return ret

def with_property_check(numargs):
  ret = ''
  for j in range(0,numargs):
    ret += '  for (int i=0; i<__with_%0d.size(); i+=1) begin \\\n' % j
    ret += '    bit comp = __with_%0d[i].compare(); \\\n' % j
    ret += '    if (!comp) begin \\\n'
    ret += '      string _name = `"NAME`"; \\\n'
    ret += '      string _arg = `"ARG%0d`"; \\\n' % j
    ret += '      if (!error_signature.exists(i)) \\\n'
    ret += '        $sformat(error_signature[i], "%sEXPECT_CALL[%0d] %s::%s miscompare: (%s)", error_signature[i], i, _name, _arg, __with_' + str(j) + '[i].as_string()); \\\n'
    ret += '      else \\\n'
    ret += '        $sformat(error_signature[i], "%s\\n               %s::%s miscompare: (%s)", error_signature[i], _name, _arg, __with_' + str(j) + '[i].as_string()); \\\n'
    ret += '    end \\\n'
    ret += '    check &= comp; \\\n'
    ret += '  end \\\n'

  ret += '  foreach (error_signature[i]) $display(error_signature[i]); \\\n'

  return ret

def with_property_clear(numargs):
  ret = ''
  for j in range(0,numargs):
    ret += '  __with_%0d.delete(); \\\n' % j
  return ret

def oneArgString(idx, delim=' ', default=''):
  if default == '=NODEFAULT':
    return 'DIR%0d%sTYPE%0d%sARG%0d%sMOD%d%sDEF%0d%s' % (idx,delim,idx,delim,idx,delim,idx,delim,idx,default)
  elif default == 'MACRO':
    return 'DIR%0d%sTYPE%0d%sARG%0d%sMOD%d%s`NAME``_``ARG%0d``_``DEF%0d' % (idx,delim,idx,delim,idx,delim,idx,delim,idx,idx)
  elif delim == ',':
    return 'DIR%0d%sTYPE%0d%sARG%0d%sMOD%d%sDEF%0d' % (idx,delim,idx,delim,idx,delim,idx,delim,idx)
  else:
    return 'DIR%0d%sTYPE%0d%sARG%0d%sMOD%d' % (idx,delim,idx,delim,idx,delim,idx)

def allArgString(numargs, delim=' ', prefix='', default=''):
  a = ""
  if numargs > 0:
    a += prefix
    for j in range(0,numargs):
      a += oneArgString(j, delim, default)
      if (j < numargs-1):
        a += ','
  return a

def functionDecl(name,numargs,type='void'):
  return 'function %s %s(%s);' % (type, name, allArgString(numargs))

def taskDecl(name,numargs):
  return 'task %s(%s);' % (name, allArgString(numargs))

def method_args(numargs):
  ret = ''
  for j in range(0,numargs):
    if (j == numargs-1):
      ret += 'DIR%0d TYPE%0d ARG%0d MOD%0d `NAME``_``ARG%0d``_``DEF%0d' % (j,j,j,j,j,j)
    else:
      ret += 'DIR%0d TYPE%0d ARG%0d MOD%0d `NAME``_``ARG%0d``_``DEF%0d, ' % (j,j,j,j,j,j)
  return ret

def method_arg_names(numargs):
  ret = ''
  for j in range(0,numargs):
    if (j == numargs-1):
      ret += 'ARG%0d' % j
    else:
      ret += 'ARG%0d, ' % j
  return ret



################################
##########    MAIN    ##########
################################

if __name__ == "__main__":
  f_macros = open('../src/svmock_mocker_defines.svh', 'w+')
  for i in range(0,10):
    mockers(i)

    task_macro(i, f_macros)
    map_task_macro(i, f_macros)

    void_function_macro(i, f_macros)
    map_void_function_macro(i, f_macros)

    function_macro(i, f_macros)
    map_function_macro(i, f_macros)



