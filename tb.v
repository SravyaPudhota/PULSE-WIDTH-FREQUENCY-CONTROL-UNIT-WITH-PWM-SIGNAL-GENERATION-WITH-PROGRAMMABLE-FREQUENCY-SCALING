`include "controller.v"
/*
module pwm_tb;

    reg clk;
    reg rst_n;

    reg [15:0] duty_0, period_0;
    reg [15:0] duty_1, period_1;
    reg [15:0] duty_2, period_2;
    reg [15:0] duty_3, period_3;

    wire pwm_0, pwm_1, pwm_2, pwm_3;

    pwm_controller dut (
        .clk(clk),
        .rst_n(rst_n),
        .duty_0(duty_0), .period_0(period_0),
        .duty_1(duty_1), .period_1(period_1),
        .duty_2(duty_2), .period_2(period_2),
        .duty_3(duty_3), .period_3(period_3),
        .pwm_0(pwm_0), .pwm_1(pwm_1), .pwm_2(pwm_2), .pwm_3(pwm_3)
    );

    // Clock: 10 ns = 100 MHz
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;

        duty_0 = 0; period_0 = 0;
        duty_1 = 0; period_1 = 0;
        duty_2 = 0; period_2 = 0;
        duty_3 = 0; period_3 = 0;

        #20 rst_n = 1;

        // Set different duty/period
        #10;
        duty_0 = 16'd50;  period_0 = 16'd100;   // 50%
        duty_1 = 16'd25;  period_1 = 16'd100;   // 25%
        duty_2 = 16'd75;  period_2 = 16'd100;   // 75%
        duty_3 = 16'd10;  period_3 = 16'd40;    // 25%

        // Change config at runtime
        #5000;
        duty_0 = 16'd80;  period_0 = 16'd100;   // Now 80%
        duty_1 = 16'd50;  period_1 = 16'd200;   // Now 25%
        duty_2 = 16'd150; period_2 = 16'd200;   // Now 75%
        duty_3 = 16'd0;   period_3 = 16'd100;   // OFF

        #5000 $finish;
    end

endmodule
*/
/*
`include "controller.v"

module pwm_tb;

    reg clk;
    reg rst_n;

    reg [15:0] duty_0, period_0;
    reg [15:0] duty_1, period_1;
    reg [15:0] duty_2, period_2;
    reg [15:0] duty_3, period_3;

    wire pwm_0, pwm_1, pwm_2, pwm_3;

    pwm_controller dut (
        .clk(clk),
        .rst_n(rst_n),
        .duty_0(duty_0), .period_0(period_0),
        .duty_1(duty_1), .period_1(period_1),
        .duty_2(duty_2), .period_2(period_2),
        .duty_3(duty_3), .period_3(period_3),
        .pwm_0(pwm_0), .pwm_1(pwm_1), .pwm_2(pwm_2), .pwm_3(pwm_3)
    );

    // Clock: 10 ns = 100 MHz
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;

        duty_0 = 0; period_0 = 0;
        duty_1 = 0; period_1 = 0;
        duty_2 = 0; period_2 = 0;
        duty_3 = 0; period_3 = 0;

        $display("Time: %0t ns -- Applying reset", $time);
        #20 rst_n = 1;

        // Set initial duty/period
        #10;
        duty_0 = 16'd50;  period_0 = 16'd100;   // 50%
        duty_1 = 16'd25;  period_1 = 16'd100;   // 25%
        duty_2 = 16'd75;  period_2 = 16'd100;   // 75%
        duty_3 = 16'd10;  period_3 = 16'd40;    // 25%
        $display("Time: %0t ns -- Initial config set", $time);
        $display("PWM_0: duty=%0d, period=%0d", duty_0, period_0);
        $display("PWM_1: duty=%0d, period=%0d", duty_1, period_1);
        $display("PWM_2: duty=%0d, period=%0d", duty_2, period_2);
        $display("PWM_3: duty=%0d, period=%0d", duty_3, period_3);

        // Wait and then change config
        #5000;
        duty_0 = 16'd80;  period_0 = 16'd100;   // Now 80%
        duty_1 = 16'd50;  period_1 = 16'd200;   // Now 25%
        duty_2 = 16'd150; period_2 = 16'd200;   // Now 75%
        duty_3 = 16'd0;   period_3 = 16'd100;   // OFF
        $display("Time: %0t ns -- Updated config", $time);
        $display("PWM_0: duty=%0d, period=%0d", duty_0, period_0);
        $display("PWM_1: duty=%0d, period=%0d", duty_1, period_1);
        $display("PWM_2: duty=%0d, period=%0d", duty_2, period_2);
        $display("PWM_3: duty=%0d, period=%0d", duty_3, period_3);

        #5000;
        $display("Time: %0t ns -- Simulation finished", $time);
        $finish;
    end

endmodule
*/
//`include "controller.v"
/*
module pwm_tb;

    reg clk;
    reg rst_n;

    reg [15:0] duty_0, period_0;
    reg [15:0] duty_1, period_1;
    reg [15:0] duty_2, period_2;
    reg [15:0] duty_3, period_3;

    wire pwm_0, pwm_1, pwm_2, pwm_3;

    pwm_controller dut (
        .clk(clk),
        .rst_n(rst_n),
        .duty_0(duty_0), .period_0(period_0),
        .duty_1(duty_1), .period_1(period_1),
        .duty_2(duty_2), .period_2(period_2),
        .duty_3(duty_3), .period_3(period_3),
        .pwm_0(pwm_0), .pwm_1(pwm_1), .pwm_2(pwm_2), .pwm_3(pwm_3)
    );

    // Clock: 10 ns = 100 MHz
    always #5 clk = ~clk;


// Set duty and period only in range 0 to 100
initial begin
    clk = 0;
    rst_n = 0;

    duty_0 = 0; period_0 = 0;
    duty_1 = 0; period_1 = 0;
    duty_2 = 0; period_2 = 0;
    duty_3 = 0; period_3 = 0;

    $display("Time: %0t ns -- Applying reset", $time);
    #20 rst_n = 1;

    // Set different duty/period (0-100 range)
    #10;
    duty_0 = 16'd50;  period_0 = 16'd100;   // 50%
    duty_1 = 16'd25;  period_1 = 16'd100;   // 25%
    duty_2 = 16'd75;  period_2 = 16'd100;   // 75%
    duty_3 = 16'd10;  period_3 = 16'd100;   // 10%
    $display("Initial config: Time=%0t", $time);
    $display("PWM_0: %0d/%0d", duty_0, period_0);
    $display("PWM_1: %0d/%0d", duty_1, period_1);
    $display("PWM_2: %0d/%0d", duty_2, period_2);
    $display("PWM_3: %0d/%0d", duty_3, period_3);

    // Change config at runtime
    #5000;
    duty_0 = 16'd80;  period_0 = 16'd100;   // 80%
    duty_1 = 16'd25;  period_1 = 16'd100;   // 25%
    duty_2 = 16'd60;  period_2 = 16'd100;   // 60%
    duty_3 = 16'd0;   period_3 = 16'd100;   // 0% = OFF
    $display("Updated config: Time=%0t", $time);
    $display("PWM_0: %0d/%0d", duty_0, period_0);
    $display("PWM_1: %0d/%0d", duty_1, period_1);
    $display("PWM_2: %0d/%0d", duty_2, period_2);
    $display("PWM_3: %0d/%0d", duty_3, period_3);

    #5000;
    $display("Finished simulation at time: %0t", $time);
    $finish;
end
endmodule

*/

//`timescale 1ns/1ps
/*
module tb_top_pwm;

    // Clock signals for the 5 different instances
    reg clk1 = 0, clk2 = 0, clk3 = 0, clk4 = 0, clk5 = 0;
    reg rst_n = 0;

    wire pwm1, pwm2, pwm3, pwm4, pwm5;

    // Clock Generators (different frequencies)
    always #5    clk1 = ~clk1;   // 100 MHz
    always #6.25 clk2 = ~clk2;   // 80 MHz
    always #8.33 clk3 = ~clk3;   // 60 MHz
    always #12.5 clk4 = ~clk4;   // 40 MHz
    always #25   clk5 = ~clk5;   // 20 MHz

    // Top module instantiation
    top_pwm dut (
        .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .clk5(clk5),
        .rst_n(rst_n),
        .pwm1(pwm1), .pwm2(pwm2), .pwm3(pwm3), .pwm4(pwm4), .pwm5(pwm5)
    );

    initial begin
        // Display VCD file
        $dumpfile("top_pwm.vcd");
        $dumpvars(0, tb_top_pwm);

        // Apply reset
        rst_n = 0;
        #20;
        rst_n = 1;

        // Run simulation for a period
        #5000;

        $finish;
    end

endmodule
*/









module tb_top_pwm;

    reg clk_100 = 0;
    reg rst_n = 0;

    reg enable_100 = 0, enable_80 = 0, enable_60 = 0, enable_40 = 0, enable_20 = 0;

    wire pwm_100, pwm_80, pwm_60, pwm_40, pwm_20;
    wire irq_100, irq_80, irq_60, irq_40, irq_20;
    wire [7:0] duty_100, duty_80, duty_60, duty_40, duty_20;
    wire [7:0] count_100, count_80, count_60, count_40, count_20;

    always #5 clk_100 = ~clk_100; // 100 MHz

    top_pwm dut (
        .clk_100(clk_100),
        .rst_n(rst_n),
        .enable_100mhz(enable_100),
        .enable_80mhz(enable_80),
        .enable_60mhz(enable_60),
        .enable_40mhz(enable_40),
        .enable_20mhz(enable_20),


        .pwm_100mhz(pwm_100),
        .pwm_80mhz(pwm_80),
	 .pwm_60mhz(pwm_60),
	 .pwm_40mhz(pwm_40),
	 .pwm_20mhz(pwm_20),

        .irq_100mhz(irq_100),
	 .irq_80mhz(irq_80),
	 .irq_60mhz(irq_60),
	 .irq_40mhz(irq_40),
	 .irq_20mhz(irq_20),

        .duty_100mhz(duty_100),
	 .duty_80mhz(duty_80),
	 .duty_60mhz(duty_60),
	 .duty_40mhz(duty_40),
	 .duty_20mhz(duty_20),

        .count_100mhz(count_100),
	 .count_80mhz(count_80),
	 .count_60mhz(count_60),
	 .count_40mhz(count_40),
	 .count_20mhz(count_20)

    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_top_pwm);

        rst_n = 0;
        #50 rst_n = 1;

        // Enable each PWM one by one
        #100 enable_100 = 1;
        #200 enable_80  = 1;
        #200 enable_60  = 1;
        #200 enable_40  = 1;
        #200 enable_20  = 1;

        #10000;

        $display("Simulation complete");
        $finish;
    end

endmodule

