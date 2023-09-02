`timescale 1ns / 1ps

module test_two_bit_comparator();

  // Inputs
  reg [1:0] A;
  reg [1:0] B;

  // Outputs
  wire EQ;
  wire LT;
  wire GT;

  // Instantiate the comparator
  two_bit_comparator cmp (
    .A(A),
    .B(B),
    .EQ(EQ),
    .LT(LT),
    .GT(GT)
  );

  // Test cases
  initial begin
    A = 2'b00;
    B = 2'b01;
    #10;
    $display("A = %b, B = %b, EQ = %b, LT = %b, GT = %b", A, B, EQ, LT, GT);

    A = 2'b10;
    B = 2'b10;
    #10;
    $display("A = %b, B = %b, EQ = %b, LT = %b, GT = %b", A, B, EQ, LT, GT);

    // Add more test cases as needed

    $finish;
  end

endmodule
