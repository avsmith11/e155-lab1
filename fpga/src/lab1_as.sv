// Avery Smith - avsmith@hmc.edu, 9/2/24
// driver for seven-segment led display
module lab1_as (
	input logic clk,
	input logic [3:0] s,
	output logic [2:0] led,
	output logic [6:0] seg
);
	
	//Internal high-speed oscillator (24 MHz)
	HSOSC #(.CLKHF_DIV(2'b01)) 
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	// instantiate segment driver
	segment_driver sd(clk, s, seg);
	
	// non-segmented led logic
	logic int_osc;
	logic [24:0] counter = 0;
	assign led[0] = s[1] ^ s[0];
	assign led[1] = s[3] & s[2];
	//blink led[2] every 10,000,000 HSOSC cycles
	always_ff @(posedge int_osc) begin
		counter <= counter + 1;
		if (counter == 'd10000000)
			begin
			counter <= 0;
			led[2] <= ~led[2];
			end
	end
endmodule

module segment_driver (
	input logic clk,
	input logic [3:0] s,
	output logic [6:0] seg
);

	always_comb begin
		case (s)
			4'h0: seg = ~(7'b1111110);
			4'h1: seg = ~(7'b0110000);
			4'h2: seg = ~(7'b1101101);
			4'h3: seg = ~(7'b1111001);
			4'h4: seg = ~(7'b0110011);
			4'h5: seg = ~(7'b1011011);
			4'h6: seg = ~(7'b1011111);
			4'h7: seg = ~(7'b1110000);
			4'h8: seg = ~(7'b1111111);
			4'h9: seg = ~(7'b1111011);
			// include letters for later
			default: seg = 7'b1111111;
		endcase
	end
endmodule