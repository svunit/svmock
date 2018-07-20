`SVMOCK(uvm_seq_item_pull_port_mock,item_pull_port_t)
  function new (string name, uvm_component parent,
                int min_size=0, int max_size=1);
    super.new (name, parent, min_size, max_size);
  endfunction

  `SVMOCK_VFUNC1(item_done, input, apb_item, t,,null)
  `SVMOCK_TASK1(get_next_item, output, apb_item, t,,)

  `SVMOCK_MAP_TASK1(get_next_item,_get_next_item)
  virtual task _get_next_item(output apb_item t);
    #1;
  endtask
`SVMOCK_END
