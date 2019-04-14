interface class some_interface_class;

  pure virtual function void vfunc0;

endclass



`SVMOCK(mock_interface_class, some_interface_class, implements)

  `SVMOCK_VFUNC0(vfunc0)

`SVMOCK_END
