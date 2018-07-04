`SVMOCK(mock_call, call)

  // void functions
  `SVMOCK_VOIDFUNCTION0(functionNoArgReturnVoid)
  `SVMOCK_VOIDFUNCTION1(functionIntArgReturnVoid, int, x, )
  `SVMOCK_VOIDFUNCTION2(functionIntStringArgsReturnVoid, int, x, , string, y, )
  `SVMOCK_VOIDFUNCTION3(functionObjBitLogicArgsReturnVoid, objtype, x, , bit, y, , logic [31:0], z, )

  // void functions with arrays
  `SVMOCK_VOIDFUNCTION1(functionAssocArgReturnVoid, int, x, [string])
  `SVMOCK_VOIDFUNCTION1(functionQueueArgReturnVoid, int, x, [$])
  `SVMOCK_VOIDFUNCTION2(functionAssocQueueArgReturnVoid, int, x, [string], int, y, [$])
  `SVMOCK_VOIDFUNCTION2(functionFixedArrayArgReturnVoid, string, x, [10], int, y, )
  `SVMOCK_VOIDFUNCTION3(functionDynamicArrayArgReturnVoid, string, x, , objtype, y, [], int, z, )

  `SVMOCK_FUNCTION0(functionNoArgReturnInt, int)
  `SVMOCK_FUNCTION0(functionNoArgReturnString, string)
  `SVMOCK_FUNCTION1(functionIntArgReturnInt, int, int, y, )

  // tasks
  `SVMOCK_TASK0(taskNoArg)

  // hooks
  function void will_by_default(); endfunction

  function string call_this_instead();
    return "other";
  endfunction
`SVMOCK_END
