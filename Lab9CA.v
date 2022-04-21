module Lab9CA(reset, clk);
input reset, clk;

wire RegWrite, PCSrc, ALUSrc, write, MemtoReg;
wire [3:0] ALU_operation;
wire [1:0] immselect;
wire [31:0] register_write, ROM_inst;
wire [3:0] status;

Lab8CA mod1 (clk, reset, RegWrite, PCSrc, ALUSrc, ALU_operation, write, MemtoReg, register_write, status, immselect, ROM_inst);
ControlUnit mod2 (ROM_inst, status, RegWrite, PCSrc, ALUSrc, write, MemtoReg, ALU_operation, immselect);


endmodule