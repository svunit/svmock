//###############################################################
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//###############################################################

class apb_driver extends uvm_driver #(apb_item);
  virtual apb_if.master vif;

  function new (string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    uvm_config_db#(virtual apb_if.master)::get(this, "", "vif", vif);
  endfunction

  task reset_phase(uvm_phase phase);
    vif.master.reset();
  endtask

  task main_phase(uvm_phase phase);
    while (vif.rst_n === 0) @(negedge vif.master.clk);

    forever begin
      seq_item_port.get_next_item(req);

      seq_item_port.item_done();

      // setup phase
      @(negedge vif.master.clk);
      vif.master.psel <= 1;
      vif.master.paddr <= req.addr;
      vif.master.pwrite <= req.write;
      if (req.write) vif.master.pwdata <= req.data;
      else           vif.master.pwdata <= 0;


      // enable phase
      @(negedge vif.master.clk);
      vif.master.penable <= 1;


      // end of transaction on pready
      @(negedge vif.master.clk);
      while (vif.master.pready === 0) @(negedge vif.master.clk);
      if (req.write === 0) begin
        apb_item rsp;
        seq_item_port.put_response(rsp);
      end 
      vif.master.reset();
    end
  endtask
endclass






/*
logic [dataWidth-1:0] mem [256];

logic [1:0] apb_st;
const logic [1:0] SETUP = 0;
const logic [1:0] W_ENABLE = 1;
const logic [1:0] R_ENABLE = 2;

// SETUP -> ENABLE
always @(negedge rst_n or posedge clk) begin
  if (rst_n == 0) begin
    apb_st <= 0;
    prdata <= 0;
  end

  else begin
    case (apb_st)
      SETUP : begin
        // clear the prdata
        prdata <= 0;

        // Move to ENABLE when the psel is asserted
        if (psel && !penable) begin
          if (pwrite) begin
            apb_st <= W_ENABLE;
          end

          else begin
            apb_st <= R_ENABLE;
          end
        end
      end

      W_ENABLE : begin
        // write pwdata to memory
        if (psel && penable && pwrite) begin
          mem[paddr] <= pwdata;
        end

        // return to SETUP
        apb_st <= SETUP;
      end

      R_ENABLE : begin
        // read prdata from memory
        if (psel && penable && !pwrite) begin
          prdata <= mem[paddr];
        end

        // return to SETUP
        apb_st <= SETUP;
      end
    endcase
  end
end 


endmodule */
