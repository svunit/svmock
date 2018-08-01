`SVMOCK(apb_sequence_mock,apb_sequence)
   
  `uvm_object_utils(apb_sequence_mock)

  const int signed minus1 = -1;

  uvm_sequencer #(apb_item) sqr;
  function new(string name = "apb_sequence");
    super.new(name);

    sqr = new("sqr");
  endfunction

  `SVMOCK_TASK3(start_item, /*input*/, uvm_sequence_item,  item,         /*scalar*/, /*no-default*/,
                            /*input*/, int,                set_priority, /*scalar*/, minus1,
                            /*input*/, uvm_sequencer_base, sequencer,    /*scalar*/, null);

  `SVMOCK_TASK2(finish_item, /*input*/, uvm_sequence_item,  item,         /*scalar*/, /*no-default*/,
                             /*input*/, int,                set_priority, /*scalar*/, minus1)

  `SVMOCK_TASK4(start, /*input*/, uvm_sequencer_base, sequencer, /*scalar*/, /*no-default*/,
                       /*input*/, uvm_sequence_base,  parent_sequence, /*scalar*/, null,
                       /*input*/, int,                this_priority, /*scalar*/, minus1,
                       /*input*/, bit,                call_pre_post, /*scalar*/, minus1)

  apb_item act_queue[$];

  `SVMOCK_MAP_TASK4(start,_start)
  virtual task _start (uvm_sequencer_base sequencer,
                       uvm_sequence_base parent_sequence,
                       int this_priority,
                       bit call_pre_post);
    fork
      forever begin
        apb_item _item;

        sqr.get_next_item(_item);
        act_queue.push_back(_item);
        sqr.item_done();
      end
    join_none

    // run the sequence and kill
    // the above when it's done
    super.start(sqr);
    disable fork;
  endtask

`SVMOCK_END 
