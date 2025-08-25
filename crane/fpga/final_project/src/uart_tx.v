`timescale 1ns/1ps

module uart_tx (
    input clk,             
    input rst,             
    input [7:0] data_in,   
    output reg tx         //varialbe that will actually send out the uart signal
);

    parameter BAUD_RATE = 9600;
    parameter CLOCK_FREQ = 100000000; //100 MHz clock
    localparam BIT_PERIOD = CLOCK_FREQ / BAUD_RATE; // 10417

    reg [9:0] data;                //start bit, 8 data bits, stop bit
    reg [3:0] bit_index;           //Tracks current bit being sent
   
    reg [19:0] clk_counter;        //Used to count clock cycles so we can send at 9600 baud rate
    reg [7:0] last_data;           //Last transmitted value, used so we only send data once the input changes.

	reg [3:0] state;

    always @(posedge clk or posedge rst) begin
       
        if (rst) begin
            state <= 0;
            tx <= 1;  //Idle state is HIGH
            bit_index <= 0;
            clk_counter <= 0;
            last_data <= 8'b0;
        end else begin
 
            case (state)
                // **IDLE: Wait for new data**
                0: begin
                    tx <= 1; // Keep TX line high
                    if (data_in != last_data) begin
                        last_data <= data_in;
                        state <= 1;
                    end
                end

                // **LOAD: Prepare data for transmission**
                1: begin
                    data <= {1'b1, data_in, 1'b0}; // Stop bit, data, start bit
                    bit_index <= 0;
                    clk_counter <= BIT_PERIOD + 1;
                    state <= 2;
                end

                // **SEND: Transmit each bit at baud rate**
                2: begin
                    if (clk_counter < BIT_PERIOD) begin
                        clk_counter <= clk_counter + 1;
		       
                    end else begin
                        clk_counter <= 0;
                        tx <= data[bit_index]; // Send the current bit
		        bit_index <= bit_index + 1;
		       
                        if (bit_index == 10) begin
                            state <= 3;
                        end
		       
                    end
                end

                // **DONE: Finish transmission and return to idle**
                3: begin
                    tx <= 1; // Return to idle state
                    state <= 0;
		   bit_index <= 0;
                end
            endcase
			
        end
    end

endmodule

