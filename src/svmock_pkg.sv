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
  class catcher #(int WIDTH=256);
    logic [WIDTH-1:0] _history [$];
    logic [WIDTH-1:0] _expects [$];

    function new();
    endfunction

    function sample(logic [WIDTH-1:0] _s);
      _history.push_back(_s);
    endfunction

    function void _expect();
      _expects.push_back('hx);
    endfunction

    function void _eq(logic [WIDTH-1:0] _val);
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
