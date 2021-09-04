`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Simple NCO (Numerically Controlled Oscillator)
// to generate the Enable signal for an specified frecuency.
// Uses a 20bits counter/resolution.
//
// Antonio Sanchez (@TheSonders)
// Sept-2021
//
//////////////////////////////////////////////////////////////////////////////////
module NCO_Enable #
    (parameter INPUT_FREQ=50_000_000,
    parameter OUTPUT_FREQ=25_175_000)
    (input wire clk,
    output reg enable=0);
    
    `define INCREMENT ((1_048_576.0 * OUTPUT_FREQ)/INPUT_FREQ)
    
    reg [19:0] Counter=0;
    
    always @(posedge clk)begin
        {enable,Counter}<=Counter+`INCREMENT;
    end


endmodule
