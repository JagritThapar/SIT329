module mux4to1 (
    input wire S1, S0,    // Selection bits
    input wire D0, D1, D2, D3,  // Data inputs
    output wire Y            // Output
);

assign Y = (S1 & ~S0) ? D0 :  // If S1=1, S0=0, select D0
           (S1 &  S0) ? D1 :  // If S1=1, S0=1, select D1
           (~S1 & S0) ? D2 :  // If S1=0, S0=1, select D2
           D3;               // If S1=0, S0=0, select D3

endmodule
