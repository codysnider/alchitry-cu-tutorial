module top(
    input CLK,
    output LED1,
    output LED2,
    output LED3,
    output LED4,
    output LED5,
    output LED6,
    output LED7,
    output LED8
);

    localparam COUNTER_WIDTH = 32;
    reg [COUNTER_WIDTH-1:0] counter;

    always @(posedge CLK)
    counter <= counter + 1;

    assign LED8 = counter[COUNTER_WIDTH-1];
    assign LED7 = counter[COUNTER_WIDTH-2];
    assign LED6 = counter[COUNTER_WIDTH-3];
    assign LED5 = counter[COUNTER_WIDTH-4];
    assign LED4 = counter[COUNTER_WIDTH-5];
    assign LED3 = counter[COUNTER_WIDTH-6];
    assign LED2 = counter[COUNTER_WIDTH-7];
    assign LED1 = counter[COUNTER_WIDTH-8];
endmodule
