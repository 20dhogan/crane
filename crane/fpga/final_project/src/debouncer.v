`timescale 1ns/1ps

module debouncer
  (
   input clk,
   input rst_l,
   input btn,
   output reg btn_db
   );

   reg [1:0]  state;
   reg              clear;

   wire       t; // tcounter timer alarm
   
   localparam WAIT    = 0;
   localparam PRESS   = 1;
   localparam RELEASE = 2;

   // tcounter instance   
   tcounter T1
     (
      .clk(clk),
      .rst_l(rst_l),
      .clear(clear),
      .done(t)
      );

   initial begin
      state  = WAIT;
      clear  = 1;
      btn_db = 0;      
   end

   always @(posedge clk, negedge rst_l) begin
      if (!rst_l) begin
        state  <= WAIT;
        clear  <= 1;
        btn_db <= 0;        
      end
      else begin
        case (state)
          WAIT:
            begin
              // btn_db is set to zero for all transitions
              // from this state
              btn_db <= 0;
              if (btn) begin
                 state <= PRESS;  // change state
                 clear <= 0;      // start the timer
              end
              else
                clear <= 1;              
            end
          PRESS:
            begin
               // YOU DO THIS
	       if(!btn & !t) begin
		  clear <= 1;
		  state <= WAIT;
	       end
	       else if(!btn & t) begin
		  clear <= 1;
		  btn_db <= 1;
		  state <= RELEASE;
	       end
	       else if(btn) begin
		  clear <= 0;
	       end
            end
          RELEASE:
            begin
              // YOU DO THIS
	       if(t & !clear) begin
		  btn_db <= 0;
		  state <= WAIT;
	       end
	       else if(!t | clear) begin
		  btn_db <= 0;
		  clear <= 0;
	       end
            end
          default:
            // DEFAULT behavior is necessary since we aren't
            // using state 2'b11 ('d3). If the module somehow
            // arrives in state 3, we need to give it a way
            // back to normal functioning so it can recover
            // gracefully from faults. 
            begin
               btn_db <= 0;
              clear  <= 1;
              state  <= WAIT;
            end
        endcase
      end
   end
   
endmodule // debouncer
