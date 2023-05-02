module testbench;
 reg clk,reset_n;
 reg sensor_entrance,sensor_exit;
 reg [1:0] password_1,password_2;

 wire GREEN_LED,RED_LED;
 wire [6:0] HEX_1,HEX_2;

 parking_system DUT (clk,reset_n,sensor_entrance,sensor_exit,password_1,password_2,GREEN_LED,RED_LED,HEX_1,HEX_2);

 initial
 begin
    clk=0;
    forever #10 clk=~clk;
 end


 initial
 begin
    $dumpfile("code1.vcd");
    $dumpvars(0,testbench);
    $monitor($time,"HEX_1=%b,HEX_2=%b",HEX_1,HEX_2);
    reset_n=0;sensor_entrance=0;sensor_exit=0;password_1=0;password_2=0;
    #100 reset_n = 1;
    #20 sensor_entrance = 1;
    #1000 sensor_entrance = 0;password_1 = 1;password_2 = 2;
    #2000 sensor_exit =1;
    #5000 $finish;
 end
      
endmodule