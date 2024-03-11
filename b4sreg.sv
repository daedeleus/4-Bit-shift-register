module b4sreg(D_in, clk, rst, en, Q_out);
input logic clk, rst, en;
input logic unsigned [3:0]D_in;
output reg unsigned [3:0]Q_out;

logic [25:0] sclk;
  
always @(posedge clk)
		sclk = sclk + 1'b1;
		
always@(posedge sclk[25] , posedge rst)
begin
	
	if(rst === 1)
		begin
		Q_out[0] <= 0;
		Q_out[1] <= 0;
		Q_out[2] <= 0;
		Q_out[3] <= 0;
		end
	else if (en === 1)
		Q_out <= D_in;
	else
		begin
		Q_out[0] <= Q_out[1];
		Q_out[1] <= Q_out[2];
		Q_out[2] <= Q_out[3];
		Q_out[3] <= 0;
		end
end

endmodule