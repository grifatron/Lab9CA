module mux4x2(immR, immS, immB, immselect, immout);
input[12:0] immR, immS, immB;
input[1:0] immselect;

output reg[12:0] immout;

always@(*) begin

case (immselect)
	2'b00: immout = immR;
	2'b01: immout = immS;
	2'b10: immout = immB;
endcase

end
endmodule
