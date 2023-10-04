module mux4to1_tb;

reg S1, S0;
wire D0, D1, D2, D3, Y;

// Instantiate the mux4to1 module
mux4to1 uut (
    .S1(S1),
    .S0(S0),
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .D3(D3),
    .Y(Y)
);

initial begin
    // Test cases
    S1 = 0; S0 = 0; // Select D0
    #10 if (Y !== D0) $display("Test 1 failed");

    S1 = 0; S0 = 1; // Select D1
    #10 if (Y !== D1) $display("Test 2 failed");

    S1 = 1; S0 = 0; // Select D2
    #10 if (Y !== D2) $display("Test 3 failed");

    S1 = 1; S0 = 1; // Select D3
    #10 if (Y !== D3) $display("Test 4 failed");

    $display("All tests passed");
    $finish;
end

endmodule
