`SVMOCK(mock_call, call)
  // void functions
  `SVMOCK_VFUNC0(functionNoArgReturnVoid)
  `SVMOCK_VFUNC1(functionIntArgReturnVoid, int, x, )
  `SVMOCK_VFUNC2(functionIntStringArgsReturnVoid, int, x, , string, y, )
  `SVMOCK_VFUNC3(functionObjBitLogicArgsReturnVoid, objtype, x, , bit, y, , logic [31:0], z, )

  // void functions with arrays
  `SVMOCK_VFUNC1(functionAssocArgReturnVoid, int, x, [string])
  `SVMOCK_VFUNC1(functionQueueArgReturnVoid, int, x, [$])
  `SVMOCK_VFUNC2(functionAssocQueueArgReturnVoid, int, x, [string], int, y, [$])
  `SVMOCK_VFUNC2(functionFixedArrayArgReturnVoid, string, x, [10], int, y, )
  `SVMOCK_VFUNC3(functionDynamicArrayArgReturnVoid, string, x, , objtype, y, [], int, z, )

  `SVMOCK_FUNC0(functionNoArgReturnInt, int)
  `SVMOCK_FUNC0(functionNoArgReturnString, string)
  `SVMOCK_FUNC1(functionIntArgReturnInt, int, int, y, )

  // tasks
  `SVMOCK_TASK0(taskNoArg)

  // hooks
  `SVMOCK_HOOK_FUNCTION0(functionNoArgReturnString, option0)
  function string option0();
    return "functionNoArgReturnString::option0";
  endfunction
 
  `SVMOCK_HOOK_VOID1(functionIntArgReturnVoid, option1)
  int wayne;
  function void option1(int x);
    wayne = x;
  endfunction

  `SVMOCK_HOOK_TASK0(taskNoArg, option2)
  int mario;
  task option2();
    mario = 66;
  endtask

`SVMOCK_END
