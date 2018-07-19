`SVMOCK(mock_call, call)
  // void functions
  `SVMOCK_VFUNC0(functionNoArgReturnVoid)

  `SVMOCK_VFUNC1(functionIntArgReturnVoid, /*input*/, logic [31:0], x, /*scalar*/, /*no-default*/)

  `SVMOCK_VFUNC2(functionIntStringArgsReturnVoid, /*input*/, int,    x, /*scalar*/,/*no-default*/,
                                                  /*input*/, string, y, /*scalar*/,/*no-default*/)

  `SVMOCK_VFUNC3(functionObjBitLogicArgsReturnVoid, /*input*/, objtype,      x, /*scalar*/, /*no-default*/,
                                                    /*input*/, bit,          y, /*scalar*/, /*no-default*/,
                                                    /*input*/, logic [31:0], z, /*scalar*/, /*no-default*/)

  // void functions with arrays
  `SVMOCK_VFUNC1(functionAssocArgReturnVoid, /*input*/, int, x, [string], /*no-default*/)

  `SVMOCK_VFUNC1(functionQueueArgReturnVoid, /*input*/, int, x, [$], /*no-default*/)

  `SVMOCK_VFUNC2(functionAssocQueueArgReturnVoid, /*input*/, int, x, [string], /*no-default*/,
                                                  /*input*/, int, y, [$],      /*no-default*/)

  `SVMOCK_VFUNC2(functionFixedArrayArgReturnVoid, /*input*/, string, x, [10],       /*no-default*/,
                                                  /*input*/, int,    y, /*scalar*/, /*no-default*/)

  `SVMOCK_VFUNC3(functionDynamicArrayArgReturnVoid, /*input*/, string,  x, /*scalar*/, /*no-default*/,
                                                    /*input*/, objtype, y, [],         /*no-default*/,
                                                    /*input*/, int,     z, /*scalar*/, /*no-default*/)

  `SVMOCK_FUNC0(functionNoArgReturnInt, int)
  `SVMOCK_FUNC0(functionNoArgReturnString, string)
  `SVMOCK_FUNC1(functionIntArgReturnInt, int, /*input*/, int, y, /*scalar*/, 14)

  // tasks
  `SVMOCK_TASK0(taskNoArg)
  `SVMOCK_TASK1(taskOneOutArg, output, bit,    z, /*scalar*/, /*no-default*/)
  `SVMOCK_TASK2(taskTwoOutArg, output, bit,    y, /*scalar*/, /*no-default*/,
                               output, string, z, /*scalar*/, /*no-default*/)

  // hooks
  `SVMOCK_MAP_FUNC0(functionNoArgReturnString, option0)
  function string option0();
    return "functionNoArgReturnString::option0";
  endfunction
 
  `SVMOCK_MAP_VFUNC1(functionIntArgReturnVoid, option1)
  int wayne;
  function void option1(int x);
    wayne = x;
  endfunction

  `SVMOCK_MAP_TASK0(taskNoArg, option2)
  int mario;
  task option2();
    mario = 66;
  endtask

`SVMOCK_END
