`define HAS_NO_PARENT _HAS_NO_PARENT
`include "svmock_defines.svh"

package svmock_pkg;
  typedef class __mocker;
  typedef class svmock_matcher;
  typedef class svmock_int_matcher;


  function bit is_svmock_int_matcher(svmock_matcher _matcher);
    svmock_int_matcher int_matcher;
    if ($cast(int_matcher, _matcher)) return 1;
    else return 0;
  endfunction

  function svmock_matcher int_eq(int val);
    svmock_int_matcher _m = new();
    _m.eq(val);
    return _m;
  endfunction

  class svmock_matcher;
    virtual function bit compare();
      return 0;
    endfunction
  endclass

  class svmock_int_matcher extends svmock_matcher;
    enum int {
               NONE,
               EQ
             } select;

    bit [127:0] act;
    bit [127:0] exp;

    function new();
      super.new();
      select = NONE;
    endfunction

    function eq(int val);
      select = EQ;
      exp = val;
    endfunction

    function bit compare();
$display("RETURNING %0d (%0d v. %0d)", act == exp, act, exp);
      case (select)
        EQ: return act == exp;
        NONE: return 1;
      endcase
    endfunction
  endclass

  class base__with;
    string mybase_type;

    bit is_numeric;
    bit is_string;
    bit is_other;

    bit is_aggregate;

    function bit is_alphanumeic(byte _s);
      return (
              (_s >= "a" && _s <= "z") ||
              (_s >= "A" && _s <= "A") ||
              (_s == "_")
             );
    endfunction

    function void classify(string _mytype);
      int type_idx, aggregate_idx;

      for (type_idx=0; type_idx<_mytype.len(); type_idx+=1) begin
        if (!is_alphanumeic(_mytype.getc(type_idx))) begin
          for (aggregate_idx = type_idx; aggregate_idx < _mytype.len(); aggregate_idx+=1) begin
            if (_mytype.getc(aggregate_idx) == "$") break;
          end
          break;
        end
      end

      mybase_type = _mytype.substr(0, type_idx-1);
      is_string = (mybase_type == "string");
      is_numeric = ((mybase_type == "int") ||
                    (mybase_type == "logic") ||
                    (mybase_type == "bit") ||
                    (mybase_type == "reg") ||
                    (mybase_type == "wire"));
      is_other = !(is_string || is_numeric);
      is_aggregate = (aggregate_idx != 0 && aggregate_idx < _mytype.len());

      //$display("%s %s %0d %0d %0d %0d", _mytype, mybase_type, is_numeric, is_string, is_other, is_aggregate);
    endfunction
  endclass

  class __mocker;
    string name;

    int timesCnt = 0;
    int signed timesExactlyExp = -1;
    int signed timesAtLeastExp = -1;
    int signed timesAtMostExp = -1;

    bit checkWith = 0;
    bit checkMatch = 0;
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

    virtual function bit verify();
      string error_signature;

      verify = 1;
      if ((timesExactlyExp >= 0) && (timesCnt != timesExactlyExp)) begin
        $sformat(error_signature, "%sEXPECT_CALL::exactly.miscompare %s: (exactly:%0d act:%0d)", error_signature, name, timesExactlyExp, timesCnt);
        verify = 0;
      end
      if ((timesAtLeastExp >= 0) && (timesCnt < timesAtLeastExp)) begin
        $sformat(error_signature, "%sEXPECT_CALL::at_least.miscompare %s: (at_least:%0d act:%0d)", error_signature, name, timesAtLeastExp, timesCnt);
        verify = 0;
      end
      if ((timesAtMostExp  >= 0) && (timesCnt > timesAtMostExp)) begin
        $sformat(error_signature, "%sEXPECT_CALL::at_most.miscompare %s: (at_most:%0d act:%0d)", error_signature, name, timesAtMostExp, timesCnt);
        verify = 0;
      end

      if (!verify) $display("%s", error_signature);

      return verify;
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
      checkMatch = 0;
    endfunction
  endclass

endpackage
