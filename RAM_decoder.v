module decoder (din, dout);

input [1:0] din;
output [3:0] dout;

assign dout[0] = ~din[1] & ~din[0]; //00
assign dout[1] = ~din[1] & din[0]; //01
assign dout[2] = din[1] & ~din[0]; //10
assign dout[3] = din[1] & din[0]; // 11

endmodule