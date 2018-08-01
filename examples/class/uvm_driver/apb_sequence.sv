class apb_sequence extends uvm_sequence#(apb_item);
   
  `uvm_object_utils(apb_sequence)
    
  //Constructor
  function new(string name = "apb_sequence");
    super.new(name);
  endfunction

  const int max_addr = 'h1000;

  rand int num_transactions;
  constraint c_num_transactions {
    num_transactions > 6;
    num_transactions <= 10;
  }

  virtual task body();
    for (int i=0; i<num_transactions; i+=1) begin
      `uvm_do_with(req, {
                          addr < max_addr;
                          if (write) {
                            data[0] == 1;
                          }
                        })
    end
  endtask
endclass
