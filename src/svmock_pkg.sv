`include "svmock_defines.svh"

package svmock_pkg;
  typedef class __mocker;

  class __mocker;
    string name;

    int timesCnt = 0;
    int signed timesExactlyExp = -1;
    int signed timesAtLeastExp = -1;
    int signed timesAtMostExp = -1;

    bit checkWith = 0;
    bit overrideReturn = 0;

    function new(string name, ref __mocker __mockers[$]);
      this.name = name;
      __mockers.push_back(this);
    endfunction


    //-------
    // Times
    //-------

    function void exactly(int t);
      timesExactlyExp = t;
    endfunction

    function void at_least(int t);
      timesAtLeastExp = t;
    endfunction

    function void at_most(int t);
      timesAtMostExp = t;
    endfunction

    function void between(int min, int max);
      timesAtLeastExp = min;
      timesAtMostExp = max;
    endfunction


    //----------
    // checking
    //----------

    virtual function bit check();
      check = 1;

      check &= (timesExactlyExp >= 0) ? (timesCnt == timesExactlyExp) : 1;
      check &= (timesAtLeastExp >= 0) ? (timesCnt >= timesAtLeastExp) : 1;
      check &= (timesAtMostExp  >= 0) ? (timesCnt <= timesAtMostExp)  : 1;

      return check;
    endfunction

    //-------------
    // clear state
    //-------------

    virtual function void clear();
      timesCnt = 0;
      timesExactlyExp = -1;
      timesAtLeastExp = -1;
      timesAtMostExp = -1;
      overrideReturn = 0;

      checkWith = 0;
    endfunction
  endclass

endpackage
