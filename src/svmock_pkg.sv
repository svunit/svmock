`define EXPECT(MODULE,EXPR) \
  nextSamplePoint(); \
  `INIT \
  svmock_pkg::_focus = MODULE.EXPR``_catcher; \
  svmock_pkg::_focus._expect();

`define EQ(EXP) \
  svmock_pkg::_focus._eq(EXP);

`define ONCE

`define AT(N) \
  svmock_pkg::_focus._at(N);

`define EVALUATE \
  nextSamplePoint(); \
  foreach (svmock_pkg::_catcher[i]) begin \
    svmock_pkg::_catcher[i]._evaluate(); \
  end

`define INIT \
  foreach (svmock_pkg::_catcher[i]) begin \
    svmock_pkg::_catcher[i]._init(); \
  end \

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
    expectation_t _expectation [$];

    function new();
    endfunction

    function void sample(vector_t _s);
      _history.push_back(_s);
    endfunction

    function void _expect();
      expectation_t _e;
      _e = '{ 'hx, 0 };
      _expectation.push_back(_e);
    endfunction

    function void _eq(vector_t _val);
      _expectation[_expectation.size()-1].exp = _val;
    endfunction

    function void _at(vector_t _n);
      _expectation[_expectation.size()-1].at = _n;
    endfunction

    task _evaluate();
      foreach (_expectation[i]) begin
        if (_history.size()-1 < _expectation[i].at) begin
          `FAIL_IF(1)
        end
        else begin
          `FAIL_UNLESS(_expectation[i].exp === _history[_expectation[i].at]);
        end
      end
    endtask

    function void _init();
      _history.delete();
      _expectation.delete();
    endfunction
  endclass

  catcher _focus;
  catcher _catcher [$];
endpackage
