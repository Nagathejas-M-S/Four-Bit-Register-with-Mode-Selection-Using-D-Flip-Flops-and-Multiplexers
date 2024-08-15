module invert(input wire i, output wire o1);
	assign o1 = ~i;
endmodule


module DFlipFlop (
  input wire D,
  input wire CLK,
  input wire RESET,
  output reg Q
);

  always @(posedge CLK or posedge RESET) begin
    if (RESET)
      Q <= 1'b0;
    else
      Q <= D;
  end

endmodule


module MUX4to1 (
  input wire I0,
  input wire I1,
  input wire I2,
  input wire I3,
  input wire [1:0] S,
  output reg O
);

  always @*
    case (S)
      2'b00: O = I0;
      2'b01: O = I1;
      2'b10: O = I2;
      2'b11: O = I3;
      default: O = 1'b0; // Default value, should not occur
    endcase

endmodule

module register (
  input wire[3:0] D,
  input wire CLK,
  input wire RESET,
  input wire [1:0] S,
  output reg [3:0] Y
);

  wire [3:0] middle;
  wire [3:0] link;

  invert i0(middle[0], link[0]);
  invert i1(middle[1], link[1]);
  invert i2(middle[2], link[2]);
  invert i3(middle[3], link[3]);

  DFlipFlop d0(D[0], CLK, RESET, middle[0]);
  DFlipFlop d1(D[1], CLK, RESET, middle[1]);
  DFlipFlop d2(D[2], CLK, RESET, middle[2]);
  DFlipFlop d3(D[3], CLK, RESET, middle[3]);

  wire [3:0] mux_out;

  MUX4to1 mux0(middle[0], link[0], middle[1], 1'b0, S, mux_out[0]);
  MUX4to1 mux1(middle[1], link[1],  middle[2],middle[0], S, mux_out[1]);
  MUX4to1 mux2(middle[2], link[2],  middle[3],middle[1], S, mux_out[2]);
  MUX4to1 mux3(middle[3], link[3],  1'b0,middle[2], S, mux_out[3]);

  always @*
    Y = mux_out;

endmodule
