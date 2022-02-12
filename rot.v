module top(input clk, output D1);
   always @(posedge clk)
   begin
        D1 <= 1'b1;
   end
endmodule
