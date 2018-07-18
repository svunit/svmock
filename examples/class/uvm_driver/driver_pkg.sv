`include "uvm_macros.svh"

package driver_pkg;
  import uvm_pkg::*;

  typedef class item;
  typedef uvm_seq_item_pull_port#(item,item) item_pull_port_t;

  `include "item.sv"
  `include "driver.sv"
endpackage
