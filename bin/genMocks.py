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


def mockers(numargs):
  fout = open('../src/__mocker' + str(numargs) + '.svh', 'w+')

  # macro header
  fout.write ('`define SVMOCK_MOCKER_CLASS%0d(NAME,RETURNS%s)\\\n' % (numargs, allArgString(numargs, ',', ',')))

  # class & new
  fout.write ('class __``NAME``__mocker  extends __mocker; \\\n' +
              'function new(string name, ref __mocker __mockers[$]); \\\n' +
              '  super.new(name, __mockers); \\\n' +
              'endfunction \\\n')

  # with comparison properties
  for j in range(0,numargs):
    fout.write ('TYPE%0d withAct_%0d MOD%0d, withExp_%0d MOD%0d; \\\n' % (j,j,j,j,j))

  # Called
  fout.write (functionDecl('called',numargs) + ' \\\n')
  fout.write ('  timesCnt += 1; \\\n')
  for j in range(0,numargs):
    fout.write('  withAct_%0d = ARG%0d; \\\n' % (j,j))
  fout.write ('endfunction \\\n')

  # returns
  fout.write ('RETURNS returnsVal; /* UNUSED FOR VOID FUNCTIONS */ \\\n')
  fout.write ('function RETURNS returns(RETURNS r); \\\n' +
              '  overrideReturn = 1; \\\n' +
              '  returnsVal = r; \\\n' +
              'endfunction \\\n')

  # With
  fout.write (functionDecl('with_args',numargs) + ' \\\n')
  fout.write ('  checkWith = 1; \\\n')
  for j in range(0,numargs):
    fout.write ('  withExp_%0d = ARG%0d; \\\n' % (j,j))
  fout.write ('endfunction \\\n')

  # check
  fout.write ('function bit check(); \\\n')
  fout.write ('  check = super.check(); \\\n')
  for j in range(0,numargs):
    fout.write ('  check &= (checkWith) ? (withExp_%0d == withAct_%0d)  : 1; \\\n' % (j,j))
  fout.write ('  return check; \\\n')
  fout.write ('endfunction \\\n')
  fout.write ('endclass\n')

def function_macros(numargs, fout, type="NORMAL"):
  if (type == "NORMAL"):
    fout.write ('`define SVMOCK_FUNCTION%0d(NAME,RETURN' % numargs)
  else:
    fout.write ('`define SVMOCK_VOIDFUNCTION%0d(NAME' % numargs)
  for j in range(0,numargs):
    fout.write (',TYPE%0d,ARG%0d,MOD%0d' % (j,j,j))
  fout.write (') \\\n')

  if (type == "NORMAL"):
    fout.write('`SVMOCK_MOCKER_CLASS%0d(NAME,RETURN' % numargs)
  else:
    fout.write('`SVMOCK_MOCKER_CLASS%0d(NAME,int' % numargs)
  for j in range(0,numargs):
    fout.write (',TYPE%0d,ARG%0d,MOD%0d' % (j,j,j))
  fout.write (') \\\n')

  fout.write ('__``NAME``__mocker __``NAME = new("NAME", __mockers); \\\n')
  if (type == "NORMAL"):
    fout.write ('virtual function RETURN NAME(')
  else:
    fout.write ('virtual function void NAME(')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('TYPE%0d ARG%0d MOD%0d' % (j,j,j))
    else:
      fout.write ('TYPE%0d ARG%0d MOD%0d, ' % (j,j,j))
  fout.write ('); \\\n')
  fout.write ('  __``NAME.called(')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('ARG%0d' % j)
    else:
      fout.write ('ARG%0d,' % j)
  fout.write ('); \\\n')
  if (type == "NORMAL"):
    fout.write ('  if (__``NAME.overrideReturn) \\\n' +
                '    return __``NAME.returnsVal; \\\n' +
                '  else \\\n' +
                '    return super.NAME(')
  else:
    fout.write ('  super.NAME(')
  for j in range(0,numargs):
    if (j == numargs-1):
      fout.write ('ARG%0d' % j)
    else:
      fout.write ('ARG%0d,' % j)
  fout.write ('); \\\n')
  fout.write ('endfunction\n\n')

if __name__ == "__main__":
  f_macros = open('../src/svmock_mocker_defines.svh', 'w+')
  for i in range(0,10):
    mockers(i)
    function_macros(i, f_macros, "VOID")
    function_macros(i, f_macros)
