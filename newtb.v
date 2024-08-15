module tb_register;

  reg [3:0] D;
  reg CLK;
  reg RESET;
  reg [1:0] S;
  wire [3:0] Y;

  // Instantiate the register module
  register uut (
    .D(D),
    .CLK(CLK),
    .RESET(RESET),
    .S(S),
    .Y(Y)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  // Dump VCD file for GTKWave
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_register);
  end

  // Test cases
  initial begin

        // Initialize signals
    D = 4'b0000;
    S = 2'b00;
    RESET = 1;

    // Apply reset
    #2 RESET = 0;

    // Case 1: s1s0=00, no change
    D = 4'b1101;
    S = 2'b00;
    RESET = 0;
    #10;

    // Case 2: s1s0=01, complement output
    D = 4'b1101;
    S = 2'b01;
    RESET = 0;
    #10;

    // Case 3: s1s0=10, shift the bits to the right
    D = 4'b1101;
    S = 2'b10;
    RESET = 0;
    #10;

    // Case 4: s1s0=11, shift the bits to the left
    D = 4'b1101;
    S = 2'b11;
    RESET = 0;
    #10;

    // Add more test cases as needed

    $stop; // Stop simulation
  end

endmodule
