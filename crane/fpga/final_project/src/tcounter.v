`timescale 1ns/1ps

module tcounter
  #(
    parameter N=100
    )
   (
    input      clk,
    input      rst_l,
    input      clear,
    output reg done
    );

   integer     clk_count;

   initial begin
      clk_count = 0;
      done      = 0;      
   end

   always @(posedge clk, negedge rst_l) begin
      if (!rst_l) begin
	 done      <= 0;
	 clk_count <= 0;	 
      end
      else begin
	 if (clear) begin	    
	    clk_count <= 0;
	    done      <= 0;
	 end
	 else if (clk_count == N) 
	    done <= 1;
	 else 
	    clk_count <= clk_count + 1;	   	 
      end
   end
   
   
endmodule // tcounter
