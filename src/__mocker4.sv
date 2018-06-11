class __mocker4 #(
  type TYPE0 = int,
  type TYPE1 = int,
  type TYPE2 = int,
  type TYPE3 = int)
extends __mocker;

function new(string name, ref __mocker __mockers[$]);
  super.new(name, __mockers);
endfunction

TYPE0 withAct_0, withExp_0;
TYPE1 withAct_1, withExp_1;
TYPE2 withAct_2, withExp_2;
TYPE3 withAct_3, withExp_3;

function void Called(
  TYPE0 ARG0,
  TYPE1 ARG1,
  TYPE2 ARG2,
  TYPE3 ARG3);
timesCnt += 1;
withAct_0 = ARG0;
withAct_1 = ARG1;
withAct_2 = ARG2;
withAct_3 = ARG3;
endfunction

function void With(
  TYPE0 ARG0,
  TYPE1 ARG1,
  TYPE2 ARG2,
  TYPE3 ARG3);
checkWith = 1;
withExp_0 = ARG0;
withExp_1 = ARG1;
withExp_2 = ARG2;
withExp_3 = ARG3;
endfunction

function bit check();
check = super.check();
check &= (checkWith) ? (withExp_0 == withAct_0)  : 1;
check &= (checkWith) ? (withExp_1 == withAct_1)  : 1;
check &= (checkWith) ? (withExp_2 == withAct_2)  : 1;
check &= (checkWith) ? (withExp_3 == withAct_3)  : 1;
return check;
endfunction
endclass
