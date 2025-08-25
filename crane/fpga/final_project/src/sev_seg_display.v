module sev_seg_display (
        input clk,
        input [7:0] data_in,

        output reg [6:0] seg,
        output reg [3:0] an
);

    reg [15:0] clk_div; // Clock divider for refresh rate
    reg [1:0] clk_count;
    
    reg  cw, ccw, arm_up, arm_down, load_line_up, load_line_down;
    reg [1:0] speed;

    always @(posedge clk) begin
        // Slowing down clk_count updates
        clk_div <= clk_div + 1;
        if (clk_div == 16'd50000) begin // Adjust value for correct refresh rate
            clk_div <= 0;
            clk_count <= clk_count + 1;
        end
    end

    always @(posedge clk) begin
        // Latching input data to internal registers
        load_line_down <= data_in[0];
        load_line_up <= data_in[1];
        arm_down <= data_in[2];
        arm_up <= data_in[3];
        ccw <= data_in[4];
        cw <= data_in[5];
        speed[0] <= data_in[6];
        speed[1] <= data_in[7];
    end

    always @(posedge clk) begin
        // Default: Turn off all segments and anodes
        seg <= 7'b1111111;
        an <= 4'b1111;

        case (clk_count)
            2'b00: begin // Load Line
                an <= 4'b1110;
                if (load_line_down) begin
		   seg <= 7'b0100011; // Display top half
		end else if (load_line_up) begin
		   seg <= 7'b0011100; // Display bottom half
		end else begin
		   seg <= 7'b0111111;
		end
            end

            2'b01: begin
	       an <= 4'b1101;
                if (arm_down) begin
		   seg <= 7'b0100011; // Display top half
		end else if (arm_up) begin
		   seg <= 7'b0011100; // Display bottom half
		end else begin
		   seg <= 7'b0111111;
		end
	    end

            2'b10: begin // Rotation
                an <= 4'b1011;
                if (cw)   seg <= 7'b0101111; // Display "r"
                if (ccw)  seg <= 7'b1000111; // Display "L"
            end

            2'b11: begin // Speed
                an <= 4'b0111;
                case (speed)
                    2'b00: seg <= 7'b1111001; // Display "1"
                    2'b01: seg <= 7'b0100100; // Display "2"
                    2'b10: seg <= 7'b0110000; // Display "3"
                    2'b11: seg <= 7'b0011001; // Display "4"
                endcase
            end
        endcase
    end

endmodule
