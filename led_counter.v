module Counter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output wire [7:0] leds
);

    reg [31:0] cycle_count;
    reg [7:0] count_reg;

    localparam integer CYCLES = CLK_FREQ / 2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cycle_count <= 32'd0;
            count_reg   <= 8'd0;
        end else begin
            if (cycle_count == CYCLES - 1) begin
                cycle_count <= 32'd0;
                count_reg   <= count_reg + 8'd1;
            end else begin
                cycle_count <= cycle_count + 32'd1;
            end
        end
    end

    assign leds = count_reg;

endmodule