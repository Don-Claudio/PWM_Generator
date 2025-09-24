`timescale 1ns/1ps
`default_nettype none

module pwm_generator #(
    parameter integer WIDTH = 8  // width of the counter
)(
    input  wire                  clk,        // input clock
    input  wire                  reset_n,    // active-low reset
    input  wire [WIDTH-1:0]      duty_cycle, // controls the duty %
    output reg                   pwm_out     // PWM output signal
);

    reg [WIDTH-1:0] counter;  // free-running counter

    // 1. Counter increments every clock edge
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            counter <= 0;
        else
            counter <= counter + 1'b1;
    end

    // 2. Compare counter to duty cycle
    always @(*) begin
        pwm_out = (counter < duty_cycle);
    end

endmodule

`default_nettype wire
