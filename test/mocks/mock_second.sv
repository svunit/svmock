`SVMOCK(mock_second, call)
  // void functions
  `SVMOCK_VOIDFUNCTION1(functionIntArgReturnVoid, int, x, )
  `SVMOCK_FUNCTION0(functionNoArgReturnString, string)
  `SVMOCK_TASK0(taskNoArg)

  // hooks
  `SVMOCK_HOOK_FUNCTION0(functionNoArgReturnString, option3)
  function string option3();
    return "functionNoArgReturnString::option3";
  endfunction
 
  `SVMOCK_HOOK_VOID1(functionIntArgReturnVoid, option4)
  int wayne;
  function void option4(int x);
    wayne = x;
  endfunction

  `SVMOCK_HOOK_TASK0(taskNoArg, option5)
  int mario;
  task option5();
    mario = 66;
  endtask

`SVMOCK_END
