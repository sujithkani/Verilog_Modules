module 2FF_Sync(
input wire clk_target,
input wire rst_n,
input wire signal_A,
output reg signal_B
);

/*
	clk_target: The clock domai to which signal A has to be synchronised.
	rst_n	  : The logic low reset signal for the 2FF and sets the data in the FF to logic low (0)
	signal_A  : The input signal that has to be moved from a clock domain to another clock clk_target
	signal_B  : The synchronised signal_A in clk_target domain
*/

reg signal_meta;
always @(posedge clk_target or negedge rst_n)
begin
	if(!rst_n)
	begin
		signal_meta <= 1'b0;
		signal_B	<= 1'b0;
	end
	else
	begin
		signal_meta <= signal_A;
		signal_B 	<= signal_meta;
	end
end
endmodule