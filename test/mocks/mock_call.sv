`SVMOCK(mock_call, call)

  // void functions
  `SVMOCK_VOIDFUNCTION0(functionNoArgReturnVoid)
  `SVMOCK_VOIDFUNCTION1(functionIntArgReturnVoid, int, x, )
  `SVMOCK_VOIDFUNCTION2(functionIntStringArgsReturnVoid, int, x, , string, y, )
  `SVMOCK_VOIDFUNCTION3(functionObjBitLogicArgsReturnVoid, objtype, x, , bit, y, , logic [31:0], z, )

  // void functions with arrays
  `SVMOCK_VOIDFUNCTION1(functionAssocArgReturnVoid, int, x, [string])

  `SVMOCK_FUNCTION0(functionNoArgReturnInt, int)
  `SVMOCK_FUNCTION1(functionIntArgReturnInt, int, int, y, )
`SVMOCK_END
