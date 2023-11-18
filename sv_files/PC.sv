// program counter
// supports both relative and absolute jumps
// use either or both, as desired
module PC #(parameter D=12)(
  input reset,					// synchronous reset
        clk,
		  branch_en,
		  reljump_en,             // rel. jump enable
        absjump_en,				// abs. jump enable
  input       [D-1:0] target,	// how far/where to jump
  output logic[D-1:0] prog_ctr
);


  always_ff @(posedge clk) begin
   $display("branch_en: %b", branch_en);
	if(reset)
	  prog_ctr <= '0;
	else if(branch_en) begin
	  if(reljump_en)
		 prog_ctr <= prog_ctr + target;
	  else if(absjump_en)
		 prog_ctr <= target;
     $display("Program Counter: performing branch to %d, reljump_en: %b, absjump_en: %b", prog_ctr, reljump_en, absjump_en);
	end else
	  prog_ctr <= prog_ctr + 'b1;
   end
endmodule
