`timescale 1ns/1ps

`timescale 1ns/1ps

module top (
	input  btn_up,
	input  btn_dn,
	input  clk,
	input  rst,
	input  cw,
	input  ccw,
	input  arm_up,
	input  arm_down,
	input  load_line_up,
	input  load_line_down,
	
	output wire [7:0] uart_data,
	output wire tx, //pin that will control uart signals
	output wire [6:0] seg,
	output wire [3:0] an
);

    reg [1:0] speed;  // 2-bit speed variable
    wire speed_up, speed_dn;  // Debounced button signals

    // Instantiate debouncers
    debouncer db_up (
        .clk(clk),
        .rst_l(~rst),  // Active-low reset
        .btn(btn_up),
        .btn_db(speed_up)
    );

    debouncer db_down (
        .clk(clk),
        .rst_l(~rst),
        .btn(btn_dn),
        .btn_db(speed_dn)
    );

    //Speed adjustment logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            speed <= 2'b00;  // Reset speed
        else begin
            if (speed_up && speed < 2'b11)  // Increase speed (max 3)
                speed <= speed + 1;
            if (speed_dn && speed > 2'b00)  // Decrease speed (min 0)
                speed <= speed - 1;
        end
    end

    //Instantiate transmit logic
    transmit tx_module (
        .cw(cw),
        .ccw(ccw),
        .arm_up(arm_up),
        .arm_down(arm_down),
        .load_line_up(load_line_up),
        .load_line_down(load_line_down),
        .speed(speed),  // Pass speed
        .uart_send_byte(uart_data)
    );
	
	//Send tx via Uart whenever uart_data changes
    uart_tx uart_module (
		.clk(clk),
		.rst(rst),
		.data_in(uart_data),
		.tx(tx)		
    );

    //Instantiate sev_seg
   sev_seg_display display (
			    .clk(clk),
			    .data_in(uart_data),
			    .seg(seg),
			    .an(an)
			    );
   

endmodule
