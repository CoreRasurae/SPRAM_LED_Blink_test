module spram
#
(
	parameter addrbits = 9,
	parameter databits = 8,
	parameter init_file = ""
)
(
	input  wire [addrbits-1:0] address,
	input  wire clock,
	input  wire [databits-1:0] data,	//kept for module interchangeability
	input  wire wren,
	output reg  [databits-1:0] q
);

reg[databits-1:0] ram[(2**addrbits)-1:0];
initial $readmemh(init_file, ram, 0);

always @(posedge clock) if(~wren) q <= ram[address];

endmodule
