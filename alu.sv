// combinational -- no clock
// sample -- change as desired
module alu(
  input[2:0] alu_cmd,    // ALU instructions
  input[1:0] ALU_Op,
  input[7:0] inA, inB,	 // 8-bit wide data path
  output logic[7:0] rslt,
  output logic zero      // NOR (output)
);

always_comb begin
  rslt = 'b0;
  zero = !rslt;
  if (ALU_Op == 2'b00) begin
	  case(alu_cmd)
		3'b001: // left_shift
		  rslt = inA << inB;
		3'b010: // right_shift
		  rslt = inA >> inB;
		3'b011: // bitwise AND
		  rslt = inA & inB;
		3'b100: // bitwise OR
		  rslt = inA | inB;
		3'b101: // bitwise AND (mask)
		  rslt = inA ^ inB;
		3'b110: // left rotate
		  rslt = 0;
		3'b111: // parity
		  rslt = {7'b0000000, ^rslt};
	  endcase
  end
  else if (ALU_Op == 2'b01)
    rslt = inA - 1;
  else if (ALU_Op == 2'b10)
    rslt = inA + 1;
  else 
    rslt = inA - inB;
	
end

endmodule
