module top(
    input clk,
    input rst,
    output [7:0] LED,
    output [23:0] IO_LED
);

    localparam COUNTER_WIDTH = 32 + 8;
    reg [COUNTER_WIDTH-1:0] counter;

    always @(posedge clk) begin
        if (rst == 1'b0) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    assign LED = counter[COUNTER_WIDTH-1:COUNTER_WIDTH-8];
    assign IO_LED = counter[COUNTER_WIDTH-9:COUNTER_WIDTH-(8 + 24)];


endmodule
