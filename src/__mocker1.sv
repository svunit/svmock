class __mocker1 #(
  type TYPE0 = int)
extends __mocker;

function new(string name, ref __mocker __mockers[$]);
  super.new(name, __mockers);
endfunction

TYPE0 withAct_0, withExp_0;

function void Called(
  TYPE0 ARG0);
timesCnt += 1;
withAct_0 = ARG0;
endfunction

function void With(
  TYPE0 ARG0);
checkWith = 1;
withExp_0 = ARG0;
endfunction

function bit check();
check = super.check();
check &= (checkWith) ? (withExp_0 == withAct_0)  : 1;
return check;
endfunction
endclass