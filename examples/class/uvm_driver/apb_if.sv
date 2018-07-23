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

interface apb_if
#(
  addrWidth = 64,
  dataWidth = 32
)
(
  input                        clk,
  input                        rst_n
);

logic [addrWidth-1:0] paddr;
logic                 pwrite;
logic                 psel;
logic                 penable;
logic                 pready;
logic [dataWidth-1:0] pwdata;
logic [dataWidth-1:0] prdata;

modport master (
  import reset,

  input  clk,
  input  rst_n,

  output paddr,
  output pwrite,
  output psel,
  output penable,
  output pready,
  output pwdata,
  input  prdata
);

task reset();
  paddr <= 0;
  pwrite <= 0;
  psel <= 0;
  penable <= 0;
  pready <= 0;
  pwdata <= 0;
endtask

endinterface
