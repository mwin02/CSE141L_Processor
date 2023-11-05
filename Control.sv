// control decoder
module Control #(parameter opwidth = 2, mcodebits = 4)(
  input [mcodebits-1:0] instr,    // subset of machine code (any width you need)
  output logic Branch, Write_Reg, Mem_Write, 
  output logic[opwidth-1:0] ALU_Op,
  output logic[1:0] Reg_C, Write_C);	   // for up to 8 ALU operations

always_comb begin
// defaults

  Branch 	=  'b0;   // 1: branch (jump)
  Write_Reg =	'b0;   // 
  Mem_Write =	'b0;   // 
  Reg_C 	   =  2'b00;   // 
  Write_C   =	2'b00;   // 
  ALU_Op	   =  3'b000; // 

/*case(instr)    // override defaults with exceptions
  'b0000:  begin					// store operation
               MemWrite = 'b1;      // write to data mem
               RegWrite = 'b0;      // typically don't also load reg_file
			  end
  'b00001:  ALUOp      = 'b000;  // add:  y = a+b
  'b00010:  begin				  // load
			   MemtoReg = 'b1;    // 
            end
// ...
endcase*/

end
	
endmodule