`include "uvm_macros.svh"

package apb_pkg;
  import uvm_pkg::*;

  typedef class apb_item;
  typedef uvm_seq_item_pull_port#(apb_item,apb_item) item_pull_port_t;

  `include "apb_item.sv"
  `include "apb_sequence.sv"
  `include "apb_driver.sv"
endpackage
