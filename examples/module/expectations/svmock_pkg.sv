`define EXPECT(MODULE,EXPR) \
  svmock_pkg::_focus = MODULE.EXPR``_catcher; \
  svmock_pkg::_focus._expect();

`define EQ(EXP) \
  svmock_pkg::_focus._eq(EXP);

`define ONCE

`define AT(n)

`define EVALUATE \
  foreach (svmock_pkg::_catcher[i]) begin \
    svmock_pkg::_catcher[i]._evaluate(); \
  end

package svmock_pkg;
  class catcher #(int WIDTH=256);
    bit [WIDTH-1:0] _history [$];

    function new();
      $display("CATCHER");
    endfunction

    function sample(bit [WIDTH-1:0] _s);
      _history.push_back(_s);
    endfunction

    function void _expect();
      $display("expect something");
      _history.push_back('hx);
    endfunction

    function void _eq(bit [WIDTH-1:0] _val);
      _history[_history.size()-1] = _val;
    endfunction

    function void _evaluate();
      $display("evaluate something");
    endfunction
  endclass

  catcher _focus;
  catcher _catcher [$];
endpackage
