//`SVMOCK(uvm_seq_item_pull_port_mock,item_pull_port_t)
/*
  I don't use the SVMOCK macro here b/c it can't handle the
  parameterized class. Blowing that code up here is a bandaid
  for now. if it looks like this is a good feature to add (i.e.
  support for parameterized classes) then I'll come back to it
  and do this properly.

  -NJ
*/
`define uvm_seq_item_pull_port_mock_item_pull_port_t
`define MOCKTYPE uvm_seq_item_pull_port_mock_item_pull_port_t
class uvm_seq_item_pull_port_mock #(type T=int) extends item_pull_port_t;
  typedef uvm_seq_item_pull_port_mock #(T) PARENT;
  __mocker __mockers [$];

  function bit verify();
    verify = 1;
    foreach (__mockers[i]) begin
      verify &= __mockers[i].verify();
    end
  endfunction

  function void clear();
    foreach (__mockers[i]) begin
      __mockers[i].clear();
    end
  endfunction

  function new (string name, uvm_component parent,
                int min_size=0, int max_size=1);
    super.new (name, parent, min_size, max_size);
  endfunction

  //---------------
  // get_next_item
  //---------------
  `SVMOCK_TASK1(get_next_item, output, T, t, /*scalar*/, /*no-default*/)

  `SVMOCK_MAP_TASK1(get_next_item,_get_next_item)
  mailbox #(T) item_mb = new();
  virtual task _get_next_item(output T t);
    item_mb.get(t);
  endtask


  //-----------
  // item_done
  //-----------
  `SVMOCK_VFUNC1(item_done, input, T, t, /*scalar*/, null)

  `SVMOCK_MAP_VFUNC1(item_done,_item_done)
  virtual function void _item_done(input T t = null);
  endfunction


  //--------------
  // put_response
  //--------------
  `SVMOCK_VFUNC1(put_response, input, T, t, /*scalar*/, /*no-default*/)

  `SVMOCK_MAP_VFUNC1(put_response,_put_response)
  mailbox #(T) rsp_mb = new();
  virtual function void _put_response(input T t);
    void'(rsp_mb.try_put(t));
  endfunction


  //------
  // Misc
  //------
  function void flush();
    T dumped;

    while (rsp_mb.try_get(dumped) > 0);
    while (item_mb.try_get(dumped) > 0);
  endfunction
`SVMOCK_END
