module b4sreg_tb;

reg [3:0]D;
reg clk = 0, rst = 0, en = 0;
wire [3:0]Q_out;

b4sreg u1(D, clk, rst, en, Q_out);

initial begin
      rst = 1; en = 0; D = 4'd0;
      #11 rst = 0; en = 1; D = 4'd9;
      #10 rst = 0; en = 0; D = 4'd9;// t=11
      #20 rst = 1; en = 1; D = 4'd15;
      #10 en = 0;
      #10 rst = 0; en = 1; D = 4'd15;
      #10 en = 0;
     #200 $finish;
  end
  
always
    #5 clk = ~clk;   // 100 Mhz clock
    
  
        // Run for 200 ns
  
endmodule
