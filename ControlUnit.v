module ControlUnit(inst, status, RegWrite, PCSrc, ALUSrc, write, MemtoReg, ALU_operation, immselect);
input [31:0] inst;
input [3:0] status;

output reg RegWrite, PCSrc, ALUSrc, write, MemtoReg;
output reg [3:0] ALU_operation;
output reg [1:0] immselect;

always  @(*) begin
case (inst[6:0])
	7'b0110011: begin
	RegWrite = 1;
	PCSrc = 0;
	ALUSrc = 0;
	write = 0;
	MemtoReg = 1;
	immselect = 00;
	ALU_operation = {inst[30], inst[14:12]};
	end
	
	7'b0010011: begin
	RegWrite = 1;
	PCSrc = 0; 
	ALUSrc = 1;
	write = 0;
	MemtoReg = 1;
	immselect = 00;
	ALU_operation = {inst[30], inst[14:12]};
	end
	
	7'b0000011: begin
	RegWrite = 1;
	PCSrc = 0; 
	ALUSrc = 1;
	write = 0;
	MemtoReg = 0;
	immselect = 00;
	ALU_operation = {inst[30], inst[14:12]};
	end
	
	7'b0100011: begin
	RegWrite = 0;
	PCSrc = 0; 
	ALUSrc = 1;
	write = 1;
	MemtoReg = 0;
	immselect = 01;
	ALU_operation = {inst[30], inst[14:12]};
	end
	
	7'b1100011: begin
	RegWrite = 0;
	ALUSrc = 1;
	write = 0;
	MemtoReg = 1;
	immselect = 11;
	ALU_operation = 1000;
	end
	
	
endcase

if (inst[6:0] == 7'b1100011) begin
	ALUSrc = ((status[0] && ~inst[12]) || (status[1] && inst[12]) || (~status[0] && inst[12] && ~inst[13] && ~inst[14]));
end
end


endmodule
