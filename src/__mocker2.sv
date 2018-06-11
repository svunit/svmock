class __mocker2 #(
  type TYPE0 = int,
  type TYPE1 = int)
extends __mocker;

function new(string name, ref __mocker __mockers[$]);
  super.new(name, __mockers);
endfunction

TYPE0 withAct_0, withExp_0;
TYPE1 withAct_1, withExp_1;

function void Called(
  TYPE0 ARG0,
  TYPE1 ARG1);
timesCnt += 1;
withAct_0 = ARG0;
withAct_1 = ARG1;
endfunction

function void With(
  TYPE0 ARG0,
  TYPE1 ARG1);
checkWith = 1;
withExp_0 = ARG0;
withExp_1 = ARG1;
endfunction

function bit check();
check = super.check();
check &= (checkWith) ? (withExp_0 == withAct_0)  : 1;
check &= (checkWith) ? (withExp_1 == withAct_1)  : 1;
return check;
endfunction
endclass
