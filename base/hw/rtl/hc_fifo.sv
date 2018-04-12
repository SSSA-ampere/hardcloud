// hc_fifo.sv

module hc_fifo
#(
  parameter HC_FIFO_WIDTH = 512,
  parameter HC_FIFO_DEPTH = 8
)
(
  input  logic clk,
  input  logic reset,

  input  logic [HC_FIFO_WIDTH - 1:0] enq_data,
  input  logic                       enq_en,
  output logic                       not_full,

  output logic [HC_FIFO_WIDTH - 1:0] deq_data,
  input  logic                       deq_en,
  output logic                       not_empty,

  output logic [$clog2(HC_FIFO_DEPTH):0] counter,
  output logic [$clog2(HC_FIFO_DEPTH):0] dec_counter
);

  logic [$clog2(HC_FIFO_DEPTH) - 1:0] wr_pointer;
  logic [$clog2(HC_FIFO_DEPTH) - 1:0] rd_pointer;

  logic [HC_FIFO_WIDTH - 1:0] mem[HC_FIFO_DEPTH];

  assign not_full  = (counter == (HC_FIFO_DEPTH - 1)) ? 1'b0 : 1'b1;
  assign not_empty = (counter == '0) ? 1'b0 : 1'b1;

  assign deq_data  = mem[rd_pointer];

  assign dec_counter = HC_FIFO_DEPTH - counter;

  always_ff@(posedge clk or posedge reset) begin
    if (reset) begin
      wr_pointer <= '0;
    end
    else begin
      if (enq_en && not_full) begin
        wr_pointer <= wr_pointer + 1;
      end
    end
  end

  always_ff@(posedge clk or posedge reset) begin
    if (reset) begin
      rd_pointer <= '0;
    end
    else begin
      if (deq_en && not_empty) begin
        rd_pointer <= rd_pointer + 1;
      end
    end
  end

  always_ff@(posedge clk or posedge reset) begin
    if (reset) begin
      counter <= '0;
    end
    else begin
      if (enq_en && !deq_en && not_full) begin
        counter <= counter + 1;
      end
      else if (!enq_en && deq_en && not_empty) begin
        counter <= counter - 1;
      end
    end
  end

  always_ff@(posedge clk) begin
    if (enq_en && not_full) begin
      mem[wr_pointer] <= enq_data;
    end
  end

endmodule : hc_fifo

