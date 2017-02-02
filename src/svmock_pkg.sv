`define EXPECT(MODULE,EXPR) \
  svmock_pkg::_focus = MODULE.EXPR``_catcher; \
  svmock_pkg::_focus._expect();

`define EQ(EXP) \
  svmock_pkg::_focus._eq(EXP);

`define ONCE

`define AT(n)

`define EVALUATE \
  nextSamplePoint(); \
  foreach (svmock_pkg::_catcher[i]) begin \
    svmock_pkg::_catcher[i]._evaluate(); \
  end

`include "svunit_defines.svh"

package svmock_pkg;
  parameter WIDTH = 256;
  typedef logic [WIDTH-1:0] vector_t;
  typedef struct {
    vector_t exp;
    int at;
  } expectation_t;


  class catcher;
    vector_t _history [$];
    vector_t _expects [$];

    function new();
    endfunction

    function void sample(vector_t _s);
      _history.push_back(_s);
    endfunction

    function void _expect();
      _expects.push_back('hx);
    endfunction

    function void _eq(vector_t _val);
      _expects[_expects.size()-1] = _val;
    endfunction

    task _evaluate();
      foreach (_expects[i]) begin
        `FAIL_UNLESS(_expects[i] === _history[i]);
      end
      _init();
    endtask

    function void _init();
      _history.delete();
      _expects.delete();
    endfunction
  endclass

  catcher _focus;
  catcher _catcher [$];
endpackage
