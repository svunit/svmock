`SVMOCK(mock_second_no_parent)
  // void functions
  `SVMOCK_VFUNC0(vfunc0)
  `SVMOCK_VFUNC1(vfunc1, , int, x, , )

  // void functions with arrays
  `SVMOCK_FUNC0(func0, string)
  `SVMOCK_FUNC1(func1, int, , int, x, [$], )

  // tasks
  `SVMOCK_TASK0(task0)
  `SVMOCK_TASK1(task1, , int, blat, [], )
`SVMOCK_END
