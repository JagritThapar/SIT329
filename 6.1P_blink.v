module blink (
    input wire clk,            // 50MHz input clock
    output wire [7:0] LED      // LED output - an array of 8 LEDs
);

// Create a binary counter and clock enable signal
reg [31:0] cnt;                // 32-bit counter
wire clk_enable;               // Clock enable signal

always @(posedge clk) begin
    if (cnt == 32'h000FFFFF)   // Set a threshold to control blinking frequency
        cnt <= 32'h00000000;   // Reset the counter when the threshold is reached
  else if (clk_enable_4x)
        cnt <= cnt + 1;        // Increment counter only when clk_enable is high
end



// Modify the threshold to achieve 1/4 frequency (toggle every 4 cycles)
assign clk_enable_4x = (cnt == 32'h000FFFFF);  // Toggle clk_enable_4x when the threshold is reached

// Assign LED to the output of the counter for 1/2 frequency
assign LED = cnt[28] ? cnt[27] : cnt[26];  // LED will blink at 1/2 and 1/4 frequency alternately

endmodule
