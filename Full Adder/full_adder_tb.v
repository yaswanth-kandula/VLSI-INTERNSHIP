`include "full_adder_rtl.v"
module full_adder_tb;
  
  // Define 3-bit inputs A and B, Clock, and C_in
  reg [3:0] A, B;
  reg Clock, C_in;
  
  // Define outputs SUM and C_out
  wire [3:0] SUM;
  wire C_out;
  
  // Instantiate the module under test
  full_adder dut(.A(A), .B(B), .Clock(Clock), .C_in(C_in), .SUM(SUM), .C_out(C_out));
  
  // Clock generation
  always #5 Clock = ~Clock;
  
  // Stimulus
  initial begin
    $fsdbDumpvars(0, full_adder_tb); // For waveform generation
    $fsdbDumpfile("full_adder.fsdb");
        
    // Reset inputs
    A = 0; B = 0; C_in = 0; Clock = 0;
    
    // Apply test cases
    #20 A = 4'b0001; B = 4'b0001; C_in = 0; // 1 + 1 = 2 (binary: 10)
    $display("A = %b, B = %b, C_in = %b, SUM = %b, C_out = %b", A, B, C_in, SUM, C_out);
    
    #20 A = 4'b1010; B = 4'b1010; C_in = 1; // 10 + 10 + 1 = 17 (binary: 10001)
    $display("A = %b, B = %b, C_in = %b, SUM = %b, C_out = %b", A, B, C_in, SUM, C_out);
    
    #20 A = 4'b1000; B = 4'b1111; C_in = 1; // 8 + 15 + 1 = 24 (binary: 11000)
    $display("A = %b, B = %b, C_in = %b, SUM = %b, C_out = %b", A, B, C_in, SUM, C_out);
    
    #100 $finish; // End the simulation
  end

endmodule
