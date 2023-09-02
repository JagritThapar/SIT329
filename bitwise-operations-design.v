module bitwise_operations (
  input [2:0] A,
  input [2:0] B,
  output [2:0] AND_result,
  output [2:0] OR_result,
  output OR_reduction_A,
  output AND_reduction_OR
);

  // Vector bit-wise AND
  assign AND_result = A & B;

  // Vector bit-wise OR
  assign OR_result = A | B;

  // Vector reduction OR for A
  assign OR_reduction_A = |A;

  // Bit-wise AND reduction OR
  assign AND_reduction_OR = &AND_result;

endmodule
