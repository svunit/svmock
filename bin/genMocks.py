def mockers(numargs):
  fout = open('../src/__mocker' + str(numargs) + '.svh', 'w+')

  base_mocker_class(numargs, fout)
  function_mocker_class(numargs, fout)
  void_function_mocker_class(numargs, fout)
  task_mocker_class(numargs, fout)


def oneArgString(idx, delim=' '):
  return 'TYPE%0d%sARG%0d%sMOD%d' % (idx,delim,idx,delim,idx)

def allArgString(numargs, delim=' ', prefix=''):
  a = ""
  if numargs > 0:
    a += prefix
    for j in range(0,numargs):
      a += oneArgString(j, delim)
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
      ret += 'TYPE%0d ARG%0d MOD%0d' % (j,j,j)
    else:
      ret += 'TYPE%0d ARG%0d MOD%0d, ' % (j,j,j)
  return ret

def method_arg_names(numargs):
  ret = ''
  for j in range(0,numargs):
    if (j == numargs-1):
      ret += 'ARG%0d' % j
    else:
      ret += 'ARG%0d, ' % j
  return ret

def function_macro(numargs, fout):
  fout.write ('`define SVMOCK_FUNC%0d(NAME,RETURN%s) \\\n'                       % (numargs, allArgString(numargs, ',', ',')) +
              '`define invoke%0d_``NAME`` virtual function RETURN NAME(%s) \\\n' % (numargs, method_args(numargs)) +
              '`define args%0d_``NAME`` %s \\\n'                                 % (numargs, method_arg_names(numargs)) +
              '`SVMOCK_FUNCTION_MOCKER_CLASS%0d(NAME,RETURN%s) \\\n'             % (numargs, allArgString(numargs, ',', ',')) +
              '__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \\\n' +
              'virtual function RETURN NAME(%s); \\\n'                           % method_args(numargs) +
              '  __``NAME.called(%s); \\\n'                                      % method_arg_names(numargs) +
              '  if (__``NAME.instead != null) \\\n' +
              '    return __``NAME.instead.NAME(%s); \\\n'                       % method_arg_names(numargs) +
              '  else if (__``NAME.overrideReturn) \\\n' +
              '    return __``NAME.returnsVal; \\\n' +
              '  else \\\n' +
              '    return super.NAME(%s); \\\n'                                  % method_arg_names(numargs) +
              'endfunction\n\n')

def void_function_macro(numargs, fout):
  fout.write ('`define SVMOCK_VFUNC%0d(NAME%s) \\\n'                             % (numargs, allArgString(numargs, ',', ',')) +
              '`define invoke%0d_``NAME`` virtual function void NAME(%s) \\\n'   % (numargs, method_args(numargs)) +
              '`define args%0d_``NAME`` %s \\\n'                                 % (numargs, method_arg_names(numargs)) +
              '`SVMOCK_VOID_FUNCTION_MOCKER_CLASS%0d(NAME%s) \\\n'               % (numargs, allArgString(numargs, ',', ',')) +
              '__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \\\n' +
              'virtual function void NAME(%s); \\\n'                             % method_args(numargs) +
              '  __``NAME.called(%s); \\\n'                                      % method_arg_names(numargs) +
              '  if (__``NAME.instead != null) \\\n' +
              '    __``NAME.instead.NAME(%s); \\\n'                              % method_arg_names(numargs) +
              '  else \\\n' +
              '    super.NAME(%s); \\\n'                                         % method_arg_names(numargs) +
              'endfunction\n\n')

def task_macro(numargs, fout):
  fout.write ('`define SVMOCK_TASK%0d(NAME%s) \\\n'                              % (numargs, allArgString(numargs, ',', ',')) +
              '`define invoke%0d_``NAME`` virtual task NAME(%s) \\\n'            % (numargs, method_args(numargs)) +
              '`define args%0d_``NAME`` %s \\\n'                                 % (numargs, method_arg_names(numargs)) +
              '`SVMOCK_TASK_MOCKER_CLASS%0d(NAME%s) \\\n'                        % (numargs, allArgString(numargs, ',', ',')) +
              '__``NAME``__mocker __``NAME = new("NAME", __mockers, this); \\\n' +
              'virtual task NAME(%s); \\\n'                                      % method_args(numargs) +
              '  __``NAME.called(%s); \\\n'                                      % method_arg_names(numargs) +
              '  if (__``NAME.instead != null) \\\n' +
              '    __``NAME.instead.NAME(%s); \\\n'                              % method_arg_names(numargs) +
              '  else \\\n' +
              '    super.NAME(%s); \\\n'                                         % method_arg_names(numargs) +
              'endtask\n\n')



def map_function_macro(numargs, fout):
  fout.write ('`define SVMOCK_MAP_FUNC%0d(ORIGINAL,INSTEAD) \\\n' % numargs +
              'typedef class __``INSTEAD``__mocker; \\\n' +
              '__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \\\n' +

              'class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \\\n' +
              '  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \\\n' +
              '    super.new(name, __mockers, _parent, associate); \\\n' +
              '  endfunction \\\n' +

              '  `invoke%0d_``ORIGINAL; \\\n' % numargs +
              '    return parent.INSTEAD(`args%0d_``ORIGINAL); \\\n' % numargs +
              '  endfunction \\\n' +
              'endclass\n\n')

def map_void_function_macro(numargs, fout):
  fout.write ('`define SVMOCK_MAP_VFUNC%0d(ORIGINAL,INSTEAD) \\\n' % numargs +
              'typedef class __``INSTEAD``__mocker; \\\n' +
              '__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \\\n' +

              'class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \\\n' +
              '  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \\\n' +
              '    super.new(name, __mockers, _parent, associate); \\\n' +
              '  endfunction \\\n' +

              '  `invoke%0d_``ORIGINAL; \\\n' % numargs +
              '    parent.INSTEAD(`args%0d_``ORIGINAL); \\\n' % numargs +
              '  endfunction \\\n' +
              'endclass\n\n')

def map_task_macro(numargs, fout):
  fout.write ('`define SVMOCK_MAP_TASK%0d(ORIGINAL,INSTEAD) \\\n' % numargs +
              'typedef class __``INSTEAD``__mocker; \\\n' +
              '__``INSTEAD``__mocker __``INSTEAD = new(`"INSTEAD`", __mockers, this, __``ORIGINAL); \\\n' +

              'class __``INSTEAD``__mocker extends __``ORIGINAL``__mocker; \\\n' +
              '  function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``ORIGINAL``__mocker associate = null); \\\n' +
              '    super.new(name, __mockers, _parent, associate); \\\n' +
              '  endfunction \\\n' +

              '  `invoke%0d_``ORIGINAL; \\\n' % numargs +
              '    parent.INSTEAD(`args%0d_``ORIGINAL); \\\n' % numargs +
              '  endtask \\\n' +
              'endclass\n\n')

def with_comparison_properties(numargs):
  ret = ''
  for j in range(0,numargs):
    ret += 'TYPE%0d withAct_%0d MOD%0d, withExp_%0d MOD%0d; \\\n' % (j,j,j,j,j)
  return ret

def with_property_assignments(numargs, type='Act'):
  ret = ''
  for j in range(0,numargs):
    ret += '  with%s_%0d = ARG%0d; \\\n' % (type,j,j)
  return ret

def with_property_check(numargs):
  ret = ''
  for j in range(0,numargs):
    ret += '  check &= (checkWith) ? (withExp_%0d == withAct_%0d)  : 1; \\\n' % (j,j)
  return ret

def base_mocker_class(numargs, fout):
  # macro header
  fout.write ('`define SVMOCK_MOCKER_CLASS%0d(NAME,RETURNS%s,MODIFIER=) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              'class __``NAME``MODIFIER``__mocker  extends __mocker; \\\n' +

              '`PARENT parent; \\\n' +
              'function new(string name, ref __mocker __mockers[$], input `PARENT _parent); \\\n' +
              '  super.new(name, __mockers); \\\n' +
              '  parent = _parent; \\\n' +
              'endfunction \\\n' +

              with_comparison_properties(numargs) +

              functionDecl('called',numargs) + ' \\\n' +                   # called
              '  timesCnt += 1; \\\n' +
                 with_property_assignments(numargs) +
              'endfunction \\\n' +

              functionDecl('with_args',numargs) + ' \\\n' +                # with
              '  checkWith = 1; \\\n' +
                 with_property_assignments(numargs, 'Exp') +
              'endfunction \\\n' +

              'function bit check(); \\\n' +                               # check
              '  check = super.check(); \\\n' +
                 with_property_check(numargs) +
              '  return check; \\\n' +
              'endfunction \\\n' +

              'endclass\n\n')

def function_mocker_class(numargs, fout):
  fout.write ('`define SVMOCK_FUNCTION_MOCKER_CLASS%0d(NAME,RETURNS%s) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              '`SVMOCK_MOCKER_CLASS%0d(NAME,RETURNS%s,_base) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              'class __``NAME``__mocker  extends __``NAME``_base__mocker; \\\n' +

              'function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \\\n' +
              '  super.new(name, __mockers, _parent); \\\n' +
              '  if (associate != null) associate.possibilities[name] = this; \\\n' +
              'endfunction \\\n' +

              'virtual ' + functionDecl('NAME',numargs,'RETURNS') + ' \\\n' +     # NAME
              'endfunction \\\n' +

              'RETURNS returnsVal; \\\n' +
              'function void returns(RETURNS r); \\\n' +                          # returns
              '  overrideReturn = 1; \\\n' +
              '  returnsVal = r; \\\n' +
              'endfunction \\\n' +

              '__``NAME``__mocker possibilities [string]; \\\n' +
              '__``NAME``__mocker instead; \\\n' +
              'function void will_by_default(string i); \\\n' +                   # will_by_default
              '  instead = possibilities[i]; \\\n' +
              'endfunction \\\n' +

              'function void clear(); \\\n' +                                     # clear
              '  super.clear(); \\\n' +
              '  instead = null; \\\n' +
              'endfunction \\\n' +

              'endclass\n\n')

def void_function_mocker_class(numargs, fout):
  fout.write ('`define SVMOCK_VOID_FUNCTION_MOCKER_CLASS%0d(NAME%s) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              '`SVMOCK_MOCKER_CLASS%0d(NAME,RETURNS%s,_base) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              'class __``NAME``__mocker  extends __``NAME``_base__mocker; \\\n' +

              'function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \\\n' +
              '  super.new(name, __mockers, _parent); \\\n' +
              '  if (associate != null) associate.possibilities[name] = this; \\\n' +
              'endfunction \\\n' +

              'virtual ' + functionDecl('NAME',numargs) + ' \\\n' +              # NAME
              'endfunction \\\n' +

              '__``NAME``__mocker possibilities [string]; \\\n' +                # will_by_default
              '__``NAME``__mocker instead; \\\n' +
              'function void will_by_default(string i); \\\n' +
              '  instead = possibilities[i]; \\\n' +
              'endfunction \\\n' +

              'function void clear(); \\\n' +                                    # clear
              '  super.clear(); \\\n' +
              '  instead = null; \\\n' +
              'endfunction \\\n' +

              'endclass\n\n')

def task_mocker_class(numargs, fout):
  fout.write ('`define SVMOCK_TASK_MOCKER_CLASS%0d(NAME%s) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              '`SVMOCK_MOCKER_CLASS%0d(NAME,void%s,_base) \\\n' % (numargs, allArgString(numargs, ',', ',')) +
              'class __``NAME``__mocker  extends __``NAME``_base__mocker; \\\n' +

              'function new(string name, ref __mocker __mockers[$], input `PARENT _parent, input __``NAME``__mocker associate = null); \\\n' +
              '  super.new(name, __mockers, _parent); \\\n' +
              '  if (associate != null) associate.possibilities[name] = this; \\\n' +
              'endfunction \\\n' +


              'virtual ' + taskDecl('NAME',numargs) + ' \\\n' +                  # NAME
              'endtask \\\n' +

              '__``NAME``__mocker possibilities [string]; \\\n' +                # will_by_default
              '__``NAME``__mocker instead; \\\n' +
              'function void will_by_default(string i); \\\n' +
              '  instead = possibilities[i]; \\\n' +
              'endfunction \\\n' +

              'function void clear(); \\\n' +                                    # clear
              '  super.clear(); \\\n' +
              '  instead = null; \\\n' +
              'endfunction \\\n' +

              'endclass\n')


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



