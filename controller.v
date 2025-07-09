`include "pwm.v"
/*
module pwm_controller (
    input  wire         clk,
    input  wire         rst_n,
    input  wire [15:0]  duty_0,
    input  wire [15:0]  period_0,
    input  wire [15:0]  duty_1,
    input  wire [15:0]  period_1,
    input  wire [15:0]  duty_2,
    input  wire [15:0]  period_2,
    input  wire [15:0]  duty_3,
    input  wire [15:0]  period_3,
    output wire         pwm_0,
    output wire         pwm_1,
    output wire         pwm_2,
    output wire         pwm_3
);

    pwm_channel ch0 (.clk(clk), .rst_n(rst_n), .duty(duty_0), .period(period_0), .pwm_out(pwm_0));
    pwm_channel ch1 (.clk(clk), .rst_n(rst_n), .duty(duty_1), .period(period_1), .pwm_out(pwm_1));
    pwm_channel ch2 (.clk(clk), .rst_n(rst_n), .duty(duty_2), .period(period_2), .pwm_out(pwm_2));
    pwm_channel ch3 (.clk(clk), .rst_n(rst_n), .duty(duty_3), .period(period_3), .pwm_out(pwm_3));

endmodule
*/
/*
module top_pwm (
    input  wire clk1, clk2, clk3, clk4, clk5,  // 5 different clock inputs
    input  wire rst_n,                         // Active-low reset
    output wire pwm1, pwm2, pwm3, pwm4, pwm5   // 5 PWM outputs
);

    // PWM instantiation with different parameters (period, on_time)
    simple_pwm pwm_inst1 (
        .clk(clk1), .rst_n(rst_n), .enable(1'b1),
        .period(100), .on_time(30), // PWM 1: 30% duty cycle
        .pwm_out(pwm1)
    );

    simple_pwm pwm_inst2 (
        .clk(clk2), .rst_n(rst_n), .enable(1'b1),
        .period(80), .on_time(40),  // PWM 2: 50% duty cycle
        .pwm_out(pwm2)
    );

    simple_pwm pwm_inst3 (
        .clk(clk3), .rst_n(rst_n), .enable(1'b1),
        .period(120), .on_time(90), // PWM 3: 75% duty cycle
        .pwm_out(pwm3)
    );

    simple_pwm pwm_inst4 (
        .clk(clk4), .rst_n(rst_n), .enable(1'b1),
        .period(40), .on_time(4),   // PWM 4: 10% duty cycle
        .pwm_out(pwm4)
    );

    simple_pwm pwm_inst5 (
        .clk(clk5), .rst_n(rst_n), .enable(1'b1),
        .period(100), .on_time(90), // PWM 5: 90% duty cycle
        .pwm_out(pwm5)
    );

endmodule
*/

/*module top_pwm (
    input  wire clk1, clk2, clk3, clk4, clk5,     // 5 different clock inputs
    input  wire rst_n,                            // Active-low reset
    output wire pwm1, pwm2, pwm3, pwm4, pwm5,     // PWM outputs
    output wire irq1, irq2, irq3, irq4, irq5,     // Interrupts from each PWM
    output wire [7:0] duty1, duty2, duty3, duty4, duty5, // Duty cycle % from each
    output wire [7:0] count1, count2, count3, count4, count5 // Cycle counts
);

    // PWM 1 Instance (30% duty @ 100 MHz)
    simple_pwm pwm_inst1 (
        .clk(clk1),
        .rst_n(rst_n),
        .enable(1'b1),
        .period(100),
        .on_time(30),
        .pwm_out(pwm1),
        .irq(irq1),
        .cycle_count(count1),
        .duty_percent(duty1)
    );

    // PWM 2 Instance (50% duty @ 80 MHz)
    simple_pwm pwm_inst2 (
        .clk(clk2),
        .rst_n(rst_n),
        .enable(1'b1),
        .period(80),
        .on_time(40),
        .pwm_out(pwm2),
        .irq(irq2),
        .cycle_count(count2),
        .duty_percent(duty2)
    );

    // PWM 3 Instance (75% duty @ 60 MHz)
    simple_pwm pwm_inst3 (
        .clk(clk3),
        .rst_n(rst_n),
        .enable(1'b1),
        .period(120),
        .on_time(90),
        .pwm_out(pwm3),
        .irq(irq3),
        .cycle_count(count3),
        .duty_percent(duty3)
    );

    // PWM 4 Instance (10% duty @ 40 MHz)
    simple_pwm pwm_inst4 (
        .clk(clk4),
        .rst_n(rst_n),
        .enable(1'b1),
        .period(40),
        .on_time(4),
        .pwm_out(pwm4),
        .irq(irq4),
        .cycle_count(count4),
        .duty_percent(duty4)
    );

    // PWM 5 Instance (90% duty @ 20 MHz)
    simple_pwm pwm_inst5 (
        .clk(clk5),
        .rst_n(rst_n),
        .enable(1'b1),
        .period(100),
        .on_time(90),
        .pwm_out(pwm5),
        .irq(irq5),
        .cycle_count(count5),
        .duty_percent(duty5)
    );

endmodule
*/
/*`define PERIOD_100MHZ 100
`define PERIOD_80MHZ  80
`define PERIOD_60MHZ  120
`define PERIOD_40MHZ  40
`define PERIOD_20MHZ  100

`define ONTIME_100MHZ 30
`define ONTIME_80MHZ  40
`define ONTIME_60MHZ  90
`define ONTIME_40MHZ  4
`define ONTIME_20MHZ  90
*/
/*module top_pwm (
    input wire clk_100,               // Base clock (100 MHz)
    input wire rst_n,                 // Active-low reset

    input wire enable_100mhz,
    input wire enable_80mhz,
    input wire enable_60mhz,
    input wire enable_40mhz,
    input wire enable_20mhz,

    output wire pwm_100mhz,
    output wire pwm_80mhz,
    output wire pwm_60mhz,
    output wire pwm_40mhz,
    output wire pwm_20mhz,

    output wire irq_100mhz,
    output wire irq_80mhz,
    output wire irq_60mhz,
    output wire irq_40mhz,
    output wire irq_20mhz,

    output wire [7:0] duty_100mhz,
    output wire [7:0] duty_80mhz,
    output wire [7:0] duty_60mhz,
    output wire [7:0] duty_40mhz,
    output wire [7:0] duty_20mhz,

    output wire [7:0] count_100mhz,
    output wire [7:0] count_80mhz,
    output wire [7:0] count_60mhz,
    output wire [7:0] count_40mhz,
    output wire [7:0] count_20mhz
);

    // Clock dividers for generating different frequencies
    reg [1:0] clkdiv_80 = 0;
    reg [2:0] clkdiv_60 = 0;
    reg [2:0] clkdiv_40 = 0;
    reg [4:0] clkdiv_20 = 0;

    reg clk_80 = 0, clk_60 = 0, clk_40 = 0, clk_20 = 0;

    // Clock dividers to generate different frequencies from base 100 MHz
    always @(posedge clk_100 or negedge rst_n) begin
        if (!rst_n) begin
            clkdiv_80 <= 0;
            clkdiv_60 <= 0;
            clkdiv_40 <= 0;
            clkdiv_20 <= 0;
            clk_80 <= 0;
            clk_60 <= 0;
            clk_40 <= 0;
            clk_20 <= 0;
        end else begin
            // Generating 80 MHz clock
            clkdiv_80 <= clkdiv_80 + 1;
            if (clkdiv_80 == 1) begin
                clk_80 <= ~clk_80;
                clkdiv_80 <= 0;
            end
            
            // Generating 60 MHz clock
            clkdiv_60 <= clkdiv_60 + 1;
            if (clkdiv_60 == 2) begin
                clk_60 <= ~clk_60;
                clkdiv_60 <= 0;
            end
            
            // Generating 40 MHz clock
            clkdiv_40 <= clkdiv_40 + 1;
            if (clkdiv_40 == 3) begin
                clk_40 <= ~clk_40;
                clkdiv_40 <= 0;
            end
            
            // Generating 20 MHz clock
            clkdiv_20 <= clkdiv_20 + 1;
            if (clkdiv_20 == 5) begin
                clk_20 <= ~clk_20;
                clkdiv_20 <= 0;
            end
        end
    end

    // Instantiate PWM modules for different frequencies
    simple_pwm pwm_100mhz_inst (
        .clk(clk_100), .rst_n(rst_n), .enable(enable_100mhz),
        .period(100), .on_time(30),
        .pwm_out(pwm_100mhz), .irq(irq_100mhz), .cycle_count(count_100mhz), .duty_percent(duty_100mhz)
    );

    simple_pwm pwm_80mhz_inst (
        .clk(clk_80), .rst_n(rst_n), .enable(enable_80mhz),
        .period(80), .on_time(40),
        .pwm_out(pwm_80mhz), .irq(irq_80mhz), .cycle_count(count_80mhz), .duty_percent(duty_80mhz)
    );

    simple_pwm pwm_60mhz_inst (
        .clk(clk_60), .rst_n(rst_n), .enable(enable_60mhz),
        .period(120), .on_time(90),
        .pwm_out(pwm_60mhz), .irq(irq_60mhz), .cycle_count(count_60mhz), .duty_percent(duty_60mhz)
    );

    simple_pwm pwm_40mhz_inst (
        .clk(clk_40), .rst_n(rst_n), .enable(enable_40mhz),
        .period(40), .on_time(4),
        .pwm_out(pwm_40mhz), .irq(irq_40mhz), .cycle_count(count_40mhz), .duty_percent(duty_40mhz)
    );

    simple_pwm pwm_20mhz_inst (
        .clk(clk_20), .rst_n(rst_n), .enable(enable_20mhz),
        .period(100), .on_time(90),
        .pwm_out(pwm_20mhz), .irq(irq_20mhz), .cycle_count(count_20mhz), .duty_percent(duty_20mhz)
    );

endmodule
*/
/*`define PERIOD_100MHZ   100
`define ON_TIME_100MHZ   30

`define PERIOD_80MHZ     80
`define ON_TIME_80MHZ    40

`define PERIOD_60MHZ    120
`define ON_TIME_60MHZ    90

`define PERIOD_40MHZ     40
`define ON_TIME_40MHZ     4

`define PERIOD_20MHZ    100
`define ON_TIME_20MHZ    90


module top_pwm (
    input wire clk_100,
    input wire rst_n,

    input wire enable_100mhz,
    input wire enable_80mhz,
    input wire enable_60mhz,
    input wire enable_40mhz,
    input wire enable_20mhz,

    output wire pwm_100mhz,
    output wire pwm_80mhz,
    output wire pwm_60mhz,
    output wire pwm_40mhz,
    output wire pwm_20mhz,

    output wire irq_100mhz,
    output wire irq_80mhz,
    output wire irq_60mhz,
    output wire irq_40mhz,
    output wire irq_20mhz,

    output wire [7:0] duty_100mhz,
    output wire [7:0] duty_80mhz,
    output wire [7:0] duty_60mhz,
    output wire [7:0] duty_40mhz,
    output wire [7:0] duty_20mhz,

    output wire [7:0] count_100mhz,
    output wire [7:0] count_80mhz,
    output wire [7:0] count_60mhz,
    output wire [7:0] count_40mhz,
    output wire [7:0] count_20mhz
);

    // Clock dividers
    reg [1:0] clkdiv_80 = 0;
    reg [2:0] clkdiv_60 = 0;
    reg [2:0] clkdiv_40 = 0;
    reg [4:0] clkdiv_20 = 0;

    reg clk_80 = 0, clk_60 = 0, clk_40 = 0, clk_20 = 0;

    always @(posedge clk_100 or negedge rst_n) begin
        if (!rst_n) begin
            clkdiv_80 <= 0; clkdiv_60 <= 0; clkdiv_40 <= 0; clkdiv_20 <= 0;
            clk_80 <= 0; clk_60 <= 0; clk_40 <= 0; clk_20 <= 0;
        end else begin
            clkdiv_80 <= clkdiv_80 + 1;
            if (clkdiv_80 == 1) begin
                clk_80 <= ~clk_80;
                clkdiv_80 <= 0;
            end

            clkdiv_60 <= clkdiv_60 + 1;
            if (clkdiv_60 == 2) begin
                clk_60 <= ~clk_60;
                clkdiv_60 <= 0;
            end

            clkdiv_40 <= clkdiv_40 + 1;
            if (clkdiv_40 == 3) begin
                clk_40 <= ~clk_40;
                clkdiv_40 <= 0;
            end

            clkdiv_20 <= clkdiv_20 + 1;
            if (clkdiv_20 == 5) begin
                clk_20 <= ~clk_20;
                clkdiv_20 <= 0;
            end
        end
    end

    // PWM Instances
    simple_pwm pwm_100mhz_inst (
        .clk(clk_100), .rst_n(rst_n), .enable(enable_100mhz),
        .period(`PERIOD_100MHZ), .on_time(`ON_TIME_100MHZ),
        .pwm_out(pwm_100mhz), .irq(irq_100mhz),
        .cycle_count(count_100mhz), .duty_percent(duty_100mhz)
    );

    simple_pwm pwm_80mhz_inst (
        .clk(clk_80), .rst_n(rst_n), .enable(enable_80mhz),
        .period(`PERIOD_80MHZ), .on_time(`ON_TIME_80MHZ),
        .pwm_out(pwm_80mhz), .irq(irq_80mhz),
        .cycle_count(count_80mhz), .duty_percent(duty_80mhz)
    );

    simple_pwm pwm_60mhz_inst (
        .clk(clk_60), .rst_n(rst_n), .enable(enable_60mhz),
        .period(`PERIOD_60MHZ), .on_time(`ON_TIME_60MHZ),
        .pwm_out(pwm_60mhz), .irq(irq_60mhz),
        .cycle_count(count_60mhz), .duty_percent(duty_60mhz)
    );

    simple_pwm pwm_40mhz_inst (
        .clk(clk_40), .rst_n(rst_n), .enable(enable_40mhz),
        .period(`PERIOD_40MHZ), .on_time(`ON_TIME_40MHZ),
        .pwm_out(pwm_40mhz), .irq(irq_40mhz),
        .cycle_count(count_40mhz), .duty_percent(duty_40mhz)
    );

    simple_pwm pwm_20mhz_inst (
        .clk(clk_20), .rst_n(rst_n), .enable(enable_20mhz),
        .period(`PERIOD_20MHZ), .on_time(`ON_TIME_20MHZ),
        .pwm_out(pwm_20mhz), .irq(irq_20mhz),
        .cycle_count(count_20mhz), .duty_percent(duty_20mhz)
    );

endmodule
*/

// Define constants for each clock domain's period and on-time
`define PERIOD_100MHZ   100      
`define ON_TIME_100MHZ   30      

`define PERIOD_80MHZ     80      
`define ON_TIME_80MHZ    40     

`define PERIOD_60MHZ    120      
`define ON_TIME_60MHZ    90    

`define PERIOD_40MHZ     40      
`define ON_TIME_40MHZ     4      

`define PERIOD_20MHZ    100    
`define ON_TIME_20MHZ    90      

module top_pwm (
    input wire clk_100,         // 100 MHz base clock input
    input wire rst_n,           // Active-low reset signal
    
    // Enable signals for each PWM frequency domain
    input wire enable_100mhz,
    input wire enable_80mhz,
    input wire enable_60mhz,
    input wire enable_40mhz,
    input wire enable_20mhz,

    // PWM output signals for each frequency domain
    output wire pwm_100mhz,
    output wire pwm_80mhz,
    output wire pwm_60mhz,
    output wire pwm_40mhz,
    output wire pwm_20mhz,

    // Interrupt signals, active for 1 cycle at start of each PWM period
    output wire irq_100mhz,
    output wire irq_80mhz,
    output wire irq_60mhz,
    output wire irq_40mhz,
    output wire irq_20mhz,

    // Duty cycle percentage (0–100%) for each PWM signal
    output wire [7:0] duty_100mhz,
    output wire [7:0] duty_80mhz,
    output wire [7:0] duty_60mhz,
    output wire [7:0] duty_40mhz,
    output wire [7:0] duty_20mhz,

    // Current cycle count (counter value) for each PWM domain
    output wire [7:0] count_100mhz,
    output wire [7:0] count_80mhz,
    output wire [7:0] count_60mhz,
    output wire [7:0] count_40mhz,
    output wire [7:0] count_20mhz
);

    // Clock dividers for each frequency domain
    reg [1:0] clkdiv_80 = 0;     // Divider for 80 MHz clock (divide by 2.5 approx.)
    reg [2:0] clkdiv_60 = 0;     // Divider for 60 MHz clock (divide by 3.33 approx.)
    reg [2:0] clkdiv_40 = 0;     // Divider for 40 MHz clock (divide by 5)
    reg [4:0] clkdiv_20 = 0;     // Divider for 20 MHz clock (divide by 10)

    // Generated divided clocks for each PWM domain
    reg clk_80 = 0, clk_60 = 0, clk_40 = 0, clk_20 = 0;

    // Clock divider logic to generate slower clock signals
    always @(posedge clk_100 or negedge rst_n) begin
        if (!rst_n) begin
            // Reset all divider counters and output clocks
            clkdiv_80 <= 0; clkdiv_60 <= 0; clkdiv_40 <= 0; clkdiv_20 <= 0;
            clk_80 <= 0; clk_60 <= 0; clk_40 <= 0; clk_20 <= 0;
        end else begin
            // 80 MHz clock divider
            clkdiv_80 <= clkdiv_80 + 1;
            if (clkdiv_80 == 1) begin
                clk_80 <= ~clk_80;   // Toggle 80 MHz clock every 2 cycles
                clkdiv_80 <= 0;
            end

            // 60 MHz clock divider
            clkdiv_60 <= clkdiv_60 + 1;
            if (clkdiv_60 == 2) begin
                clk_60 <= ~clk_60;   // Toggle 60 MHz clock every 3 cycles
                clkdiv_60 <= 0;
            end

            // 40 MHz clock divider
            clkdiv_40 <= clkdiv_40 + 1;
            if (clkdiv_40 == 3) begin
                clk_40 <= ~clk_40;   // Toggle 40 MHz clock every 4 cycles
                clkdiv_40 <= 0;
            end

            // 20 MHz clock divider
            clkdiv_20 <= clkdiv_20 + 1;
            if (clkdiv_20 == 5) begin
                clk_20 <= ~clk_20;   // Toggle 20 MHz clock every 6 cycles
                clkdiv_20 <= 0;
            end
        end
    end

    // Instantiate the simple_pwm module for each frequency domain
    simple_pwm pwm_100mhz_inst (
        .clk(clk_100), .rst_n(rst_n), .enable(enable_100mhz),
        .period(`PERIOD_100MHZ), .on_time(`ON_TIME_100MHZ),
        .pwm_out(pwm_100mhz), .irq(irq_100mhz),
        .cycle_count(count_100mhz), .duty_percent(duty_100mhz)
    );

    simple_pwm pwm_80mhz_inst (
        .clk(clk_80), .rst_n(rst_n), .enable(enable_80mhz),
        .period(`PERIOD_80MHZ), .on_time(`ON_TIME_80MHZ),
        .pwm_out(pwm_80mhz), .irq(irq_80mhz),
        .cycle_count(count_80mhz), .duty_percent(duty_80mhz)
    );

    simple_pwm pwm_60mhz_inst (
        .clk(clk_60), .rst_n(rst_n), .enable(enable_60mhz),
        .period(`PERIOD_60MHZ), .on_time(`ON_TIME_60MHZ),
        .pwm_out(pwm_60mhz), .irq(irq_60mhz),
        .cycle_count(count_60mhz), .duty_percent(duty_60mhz)
    );

    simple_pwm pwm_40mhz_inst (
        .clk(clk_40), .rst_n(rst_n), .enable(enable_40mhz),
        .period(`PERIOD_40MHZ), .on_time(`ON_TIME_40MHZ),
        .pwm_out(pwm_40mhz), .irq(irq_40mhz),
        .cycle_count(count_40mhz), .duty_percent(duty_40mhz)
    );

    simple_pwm pwm_20mhz_inst (
        .clk(clk_20), .rst_n(rst_n), .enable(enable_20mhz),
        .period(`PERIOD_20MHZ), .on_time(`ON_TIME_20MHZ),
        .pwm_out(pwm_20mhz), .irq(irq_20mhz),
        .cycle_count(count_20mhz), .duty_percent(duty_20mhz)
    );

endmodule

