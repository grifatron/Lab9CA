module inst_decoder (instruction, rs1, rs2, rd, immR, immS, immB);
input[31:0] instruction;

output wire[4:0] rs1, rs2, rd;
output wire[11:0] immR, immS, immB;

assign rd = instruction[11:7];
assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign immR = instruction[31:20];
assign immS = {instruction[31:25], instruction[11:7]};
assign immB = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};

endmodule
