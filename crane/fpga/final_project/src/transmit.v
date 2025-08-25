`timescale 1ns/1ps

module transmit(
    input cw,
    input ccw,
    input arm_up,
    input arm_down,
    input load_line_up,
    input load_line_down,
    input [1:0] speed,
    output reg [7:0] uart_send_byte
);

    reg valid_cw, valid_ccw;
    reg valid_arm_up, valid_arm_down;
    reg valid_load_line_up, valid_load_line_down;

    always @(*) begin
        // Default values (send nothing)
        uart_send_byte = 8'd0;

        // Resolve conflicting signals
        valid_cw = cw & ~ccw;
        valid_ccw = ccw & ~cw;

        valid_arm_up = arm_up & ~arm_down;
        valid_arm_down = arm_down & ~arm_up;

        valid_load_line_up = load_line_up & ~load_line_down;
        valid_load_line_down = load_line_down & ~load_line_up;

        // Construct UART byte with valid signals only
        uart_send_byte = {speed, valid_cw, valid_ccw, valid_arm_up, valid_arm_down, valid_load_line_up, valid_load_line_down};
    end

endmodule
