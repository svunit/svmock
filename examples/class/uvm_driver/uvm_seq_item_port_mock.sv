`SVMOCK(uvm_seq_item_pull_port_mock,item_pull_port_t);
  function new (string name, uvm_component parent,
                int min_size=0, int max_size=1);
    super.new (name, parent, min_size, max_size);
  endfunction

  `SVMOCK_TASK1(get_next_item, output, item, t,);
// virtual task get_next_item(output item t);
//   $display("RATS");
// endtask
`SVMOCK_END
