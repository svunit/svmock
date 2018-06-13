class objtype;
endclass

class call;
  function void functionNoArgReturnVoid();
  endfunction

  function void functionIntArgReturnVoid(int x);
  endfunction

  function void functionIntStringArgsReturnVoid(int x, string y);
  endfunction

  function void functionObjBitLogicArgsReturnVoid(objtype x, bit y, logic [31:0] z);
  endfunction




  function void functionAssocArgReturnVoid(int x [string]);
  endfunction




  function int functionNoArgReturnInt();
    return 1;
  endfunction

  function int functionIntArgReturnInt(int y);
    return y;
  endfunction
endclass
