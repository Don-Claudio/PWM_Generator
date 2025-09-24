`timescale 1ns/1ps   // 1 ns time unit, 1 ps precision

module pwm_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg [7:0] duty;
    wire pwm_out;

    // Instantiate the DUT (Device Under Test)
    pwm #(.WIDTH(8)) dut (
        .clk(clk),
        .reset(reset),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    // Clock generation: 50 MHz → period = 20 ns
    always begin
        #10 clk = ~clk;    // toggle every 10 ns → 20 ns full cycle
    end

    initial begin
        // Initialize signals
        clk   = 0;
        reset = 1;
        duty  = 8'd128;    // 50% duty (128/255 ≈ 0.5)
        #50;               // keep reset high for 50 ns
        reset = 0;

        // Change duty cycle over time
        #5000 duty = 8'd64;   // ~25% duty
        #5000 duty = 8'd192;  // ~75% duty
        #5000 duty = 8'd255;  // ~100% duty

        // Finish simulation
        #5000 $finish;
    end
endmodule
