// cache memory/register file
module reg_file #(parameter pw=3)(
  input[7:0] dat_in,
  input      clk,
  input      wr_en,           // write enable
  input[pw-1:0] wr_addr,		  // write address pointer
              	rd_addrA,		  // read address pointers
					rd_addrB,
  output logic[7:0] datA_out, // read data
                    datB_out);

  logic[7:0] core[2**pw];    // 2-dim array  8 wide  8 deep

// reads are combinational
//  assign datA_out = core[rd_addrA];
//  assign datB_out = core[rd_addrB];
  always_comb begin
    datA_out = core[rd_addrA];
    datB_out = core[rd_addrB];
    $display("Register File: rd_addrA: %b, rd_addrB: %b, datA_out: %b, datB_out: %b", rd_addrA, rd_addrB, datA_out, datB_out);
  end

// writes are sequential (clocked)
  always_ff @(posedge clk) begin
    if(wr_en) begin				   // anything but stores or no ops
      $display("register write at %b writing value: %b", wr_addr, dat_in);	
      core[wr_addr] <= dat_in; 
    end
  end

endmodule