`SVMOCK(mock_second, call)
  // void functions
  `SVMOCK_VFUNC1(functionIntArgReturnVoid, , logic [31:0], x, )
  `SVMOCK_FUNC0(functionNoArgReturnString, string)
  `SVMOCK_TASK0(taskNoArg)

  // hooks
  `SVMOCK_MAP_FUNC0(functionNoArgReturnString, option3)
  function string option3();
    return "functionNoArgReturnString::option3";
  endfunction
 
  `SVMOCK_MAP_VFUNC1(functionIntArgReturnVoid, option4)
  int wayne;
  function void option4(logic [31:0] x);
    wayne = x;
  endfunction

  `SVMOCK_MAP_TASK0(taskNoArg, option5)
  int mario;
  task option5();
    mario = 66;
  endtask

`SVMOCK_END
