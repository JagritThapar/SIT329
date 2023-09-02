`timescale 1ns / 1ns

module bitwise_tb();

  // Inputs
  reg [2:0] t_x;
  reg [2:0] t_y;

  // Outputs
  wire [2:0] t_AND_result;
  wire [2:0] t_OR_result;
  wire t_OR_reduction_A;
  wire t_AND_reduction_OR;

  // Instantiate the Unit Under Test (UUT)
  bitwise_operations bw1 (
    .A(t_x),
    .B(t_y),
    .AND_result(t_AND_result),
    .OR_result(t_OR_result),
    .OR_reduction_A(t_OR_reduction_A),
    .AND_reduction_OR(t_AND_reduction_OR)
  );

  initial begin
    $dumpfile("bwt.vcd");
    $dumpvars(1, bitwise_tb);

    t_x = 3'b011;
    t_y = 3'b100;
    #10
    $display("x=%b, y=%b, AND_result=%b, OR_result=%b, OR_reduction_A=%b, AND_reduction_OR=%b", 
             t_x, t_y, t_AND_result, t_OR_result, t_OR_reduction_A, t_AND_reduction_OR);

    t_x = 3'b111;
    t_y = 3'b101;
    #10
    $display("x=%b, y=%b, AND_result=%b, OR_result=%b, OR_reduction_A=%b, AND_reduction_OR=%b", 
             t_x, t_y, t_AND_result, t_OR_result, t_OR_reduction_A, t_AND_reduction_OR);

    t_x = 3'b000;
    t_y = 3'b001;
    #10
    $display("x=%b, y=%b, AND_result=%b, OR_result=%b, OR_reduction_A=%b, AND_reduction_OR=%b", 
             t_x, t_y, t_AND_result, t_OR_result, t_OR_reduction_A, t_AND_reduction_OR);

    t_x = 3'b011;
    t_y = 3'b011;
    #10
    $display("x=%b, y=%b, AND_result=%b, OR_result=%b, OR_reduction_A=%b, AND_reduction_OR=%b", 
             t_x, t_y, t_AND_result, t_OR_result, t_OR_reduction_A, t_AND_reduction_OR);

    $finish;
  end

endmodule
