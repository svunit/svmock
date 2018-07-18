class driver extends uvm_driver #(item);
  function new (string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task main_phase(uvm_phase phase);
    forever begin
      item _item;

      #1 seq_item_port.get_next_item(_item);
      $display("BLAT");
    end
  endtask
endclass
