module ALU (A, B, select_in, F, status);

input [31:0] A, B;
//input Cin;
wire Cin;
input [3:0] select_in;
output [31:0] F;
output [3:0] status;

wire [31:0] XOR, AND, OR, NOR,S_out, F_out, Select_out, SLL_out, SR_out, status, Mux_out;
wire V, N, C, Z;

assign Cin = select_in[3];

wire [31:0] B_out;
wire [31:0] B_not;
wire MUX_B;
wire [2:0] stat;



mux_adder DUTB(.i0(B),.i1(B_not),.mux_select(MUX_B),.mux_result(B_out));


assign A_not = ~A;
assign B_not = ~B;


FULLADDER DUT1(.A(A), .B(B_out), .Cin(Cin), .S(S_out), .Cout(C));
shifter DUT6(.A(A), .B(B), .ShiftL(SLL_out), .ShiftR(SR_out));
MUX_ALU DUT2 (.i0(S_out), .i1(SLL_out), .i2(NOR), .i3(32'b0), .i4(XOR), .i5(SR_out), .i6(OR), .i7(AND), .out(Mux_out), .S(stat)); 

assign XOR = (A ^ B_out);
assign AND = (A & B_out);
assign OR = (A | B_out);
assign NOR = ~(A | B_out);
assign stat = select_in [2:0];

assign MUX_B = select_in[3];


assign F = Mux_out;

assign V = (~(A[31] ^ B_out[31])) & (F[31] ^ A[31]);
Negative DUT3(.in(F[31]), .out(N));
assign Z = (F ==32'b0) ? 1:0;


assign status = {V, C, N, Z}; 

endmodule