`SVMOCK(mock_call, call)
  `SVMOCK_VOIDFUNCTION0(functionNoArgReturnVoid)
  `SVMOCK_VOIDFUNCTION1(functionIntArgReturnVoid, int, x)
  `SVMOCK_VOIDFUNCTION2(functionIntStringArgsReturnVoid, int, x, string, y)

  `SVMOCK_FUNCTION0(functionNoArgReturnInt, int)
  `SVMOCK_FUNCTION1(functionIntArgReturnInt, int, int, y)
`SVMOCK_END
