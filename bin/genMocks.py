

if __name__ == "__main__":
  for i in range(1,10):
    fout = open('../src/__mocker' + str(i) + '.sv', 'w+')
    fout.write ('class __mocker%0d #(\n' % i)
    for j in range(0,i):
      if (j == i-1):
        fout.write ('  type TYPE%d = int)\n' % j)
      else:
        fout.write ('  type TYPE%d = int,\n' % j)
    fout.write ('extends __mocker;\n')
    fout.write ('\nfunction new(string name, ref __mocker __mockers[$]);\n')
    fout.write ('  super.new(name, __mockers);\n')
    fout.write ('endfunction\n\n')
    for j in range(0,i):
      fout.write ('TYPE%0d withAct_%0d, withExp_%0d;\n' % (j,j,j))
    fout.write ('\nfunction void Called(\n')
    for j in range(0,i):
      if (j == i-1):
        fout.write ('  TYPE%0d ARG%0d);\n' % (j,j))
      else:
        fout.write ('  TYPE%0d ARG%0d,\n' % (j,j))
    fout.write ('timesCnt += 1;\n')
    for j in range(0,i):
      fout.write('withAct_%0d = ARG%0d;\n' % (j,j))
    fout.write ('endfunction\n')

    fout.write ('\nfunction void With(\n')
    for j in range(0,i):
      if (j == i-1):
        fout.write ('  TYPE%0d ARG%0d);\n' % (j,j))
      else:
        fout.write ('  TYPE%0d ARG%0d,\n' % (j,j))
    fout.write ('checkWith = 1;\n')
    for j in range(0,i):
      fout.write ('withExp_%0d = ARG%0d;\n' % (j,j))
    fout.write ('endfunction\n')
    fout.write ('\nfunction bit check();\n')
    fout.write ('check = super.check();\n')
    for j in range(0,i):
      fout.write ('check &= (checkWith) ? (withExp_%0d == withAct_%0d)  : 1;\n' % (j,j))
    fout.write ('return check;\n')
    fout.write ('endfunction\n')
    fout.write ('endclass\n')
