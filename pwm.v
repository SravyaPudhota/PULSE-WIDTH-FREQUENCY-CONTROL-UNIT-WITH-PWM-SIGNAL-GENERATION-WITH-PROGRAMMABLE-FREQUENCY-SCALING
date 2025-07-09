/*module pwm_channel (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [15:0] duty,   // Duty in clock cycles
    input  wire [15:0] period, // Period in clock cycles
    output reg         pwm_out
);

    reg [15:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            counter <= 16'd0;

//	Once the counter reaches the end of the period, it wraps around to 0.
//period - 1 is used because we start counting from 0, so total count is period.
//	In all other cases, the counter simply increments.
//This happens once per clock cycle, so counter tracks how far into the PWM cycle we are.

        else if (counter >= period - 1)
            counter <= 16'd0;

      
	   else
            counter <= counter + 1;
    end


//Sets pwm_out to HIGH (1) as long as the counter is less than the duty.
//Sets it to LOW (0) once the duty window is over.
//This gives you a HIGH duration of duty cycles in a period-cycle window — classic PWM.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pwm_out <= 1'b0;
        else
            pwm_out <= (counter < duty) ? 1'b1 : 1'b0;
    end

endmodule
*/
/*
module simple_pwm (
    input  wire clk,               // Clock input
    input  wire rst_n,             // Active-low reset
    input  wire enable,            // Enable signal for PWM
    input  wire [31:0] period,     // Total period of the PWM wave
    input  wire [31:0] on_time,    // ON time in clock cycles
    output reg  pwm_out            // PWM output
);

    // Counter to count clock cycles
    reg [31:0] counter;

    // Always block runs on every positive clock edge
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter  <= 0;         // Reset counter
            pwm_out  <= 0;         // Reset output
        end else if (enable) begin
            if (counter < period) begin
                counter <= counter + 1;   // Increment counter
            end else begin
                counter <= 0;             // Reset counter when period is reached
            end

            if (counter < on_time)
                pwm_out <= 1;      // Output HIGH if within ON time
            else
                pwm_out <= 0;      // Output LOW otherwise
        end else begin
            counter <= 0;          // If disabled, reset counter
            pwm_out <= 0;          // Output LOW
        end
    end

endmodule
*/

/*
module simple_pwm (
    input  wire        clk,          // Clock input
    input  wire        rst_n,        // Active-low reset
    input  wire        enable,       // Enable signal for PWM
    input  wire [31:0] period,       // Total period of the PWM wave
    input  wire [31:0] on_time,      // ON time in clock cycles
    output reg         pwm_out,      // PWM output
    output reg         irq,          // Interrupt on cycle completion
    output reg [7:0]   cycle_count,  // Total PWM cycles completed
    output reg [7:0]   duty_percent  // Calculated duty cycle (read-only)
);

    // Internal counters and state
    reg [31:0] counter;
    reg        prev_enable;

    // Duty cycle calculation (approximate to nearest integer %)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            duty_percent <= 0;
        else if (period != 0)
            duty_percent <= (on_time * 100) / period;
    end

    // PWM logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter     <= 0;
            pwm_out     <= 0;
            irq         <= 0;
            cycle_count <= 0;
            prev_enable <= 0;
        end else begin
            prev_enable <= enable;

            if (enable) begin
                if (counter < period)
                    counter <= counter + 1;
                else begin
                    counter <= 0;
                    irq <= 1;  // Set interrupt on each completed PWM cycle
                    cycle_count <= cycle_count + 1;

                    // For simulation log
                    $display("Cycle Complete: duty = %0d%%, at time %0t", duty_percent, $time);
                end

                // Glitch-free output switching
                if (counter < on_time)
                    pwm_out <= 1;
                else
                    pwm_out <= 0;
            end else begin
                // Reset outputs when disabled
                counter     <= 0;
                pwm_out     <= 0;
                irq         <= 0;
                cycle_count <= 0;
            end
        end
    end

endmodule*/
/*
module simple_pwm (
    input  wire        clk,          // Clock input
    input  wire        rst_n,        // Active-low reset
    input  wire        enable,       // Enable signal for PWM
    input  wire [31:0] period,       // Total period of the PWM wave
    input  wire [31:0] on_time,      // ON time in clock cycles
    output reg         pwm_out,      // PWM output
    output reg         irq,          // One-clock interrupt pulse after cycle completion
    output reg [7:0]   cycle_count,  // Total PWM cycles completed
    output reg [7:0]   duty_percent  // Calculated duty cycle (read-only)
);

    reg [31:0] counter;

    // Duty cycle calculation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            duty_percent <= 0;
        else if (period != 0)
            duty_percent <= (on_time * 100) / period;
    end

    // PWM logic + IRQ pulse generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter      <= 0;
            pwm_out      <= 0;
            irq          <= 0;
            cycle_count  <= 0;
        end else begin
            irq <= 0;  // Default: irq low

            if (enable) begin
                if (counter < period) begin
                    counter <= counter + 1;
                end else begin
                    counter <= 0;
                    irq <= 1;  // Set irq high for one clock cycle
                    cycle_count <= cycle_count + 1;

                    $display("PWM Cycle %0d complete. Duty = %0d%%, Time = %0t",
                             cycle_count + 1, duty_percent, $time);
                end

                // PWM output
                if (counter < on_time)
                    pwm_out <= 1;
                else
                    pwm_out <= 0;
            end else begin
                counter      <= 0;
                pwm_out      <= 0;
                irq          <= 0;
                cycle_count  <= 0;
            end
        end
    end

endmodule
*/
/*
module top_pwm (
// clk_100,clk_80,clk_60,clk_40,clk_20
    input  wire clk1, clk2, clk3, clk4, clk5,     // 5 different clock inputs
    input  wire rst_n,                            // Active-low reset
    output wire pwm1, pwm2, pwm3, pwm4, pwm5,     // PWM outputs
	//pwm_100,pwm_80,pwm_60,pwm_40,pwm_20
    output wire irq1, irq2, irq3, irq4, irq5,     // Interrupts from each PWM

	//duty_30,duty_50,duty_75,duty_90,duty_10
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

/*
`define PERIOD_100MHZ 100
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
module simple_pwm (
    input wire clk,               // Clock signal
    input wire rst_n,             // Active-low reset
    input wire enable,            // Enable signal for PWM
    input wire [7:0] period,      // Period in clock cycles
    input wire [7:0] on_time,     // On-time in clock cycles

    output reg pwm_out,           // PWM output signal
    output reg irq,               // Interrupt signal
    output reg [7:0] cycle_count, // PWM cycle count
    output reg [7:0] duty_percent // PWM duty cycle percentage
);

    reg [7:0] counter;           // Counter for PWM cycle
   // reg [7:0] duty;              // Duty cycle for PWM (on-time/period)
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            pwm_out <= 0;
            irq <= 0;
            cycle_count <= 0;
            duty_percent <= 0;
        end else if (enable) begin
            if (counter < period) begin
                counter <= counter + 1;
            end else begin
                counter <= 0;
            end

            if (counter < on_time) begin
                pwm_out <= 1; // PWM output high during on-time
            end else begin
                pwm_out <= 0; // PWM output low during off-time
            end

            // Interrupt logic (for demonstration, can be customized)
            if (counter == 0) begin
                irq <= 1;
            end else begin
                irq <= 0;
            end

            // Update cycle count and duty percentage
            cycle_count <= counter;
            duty_percent <= (on_time * 100) / period; // Duty cycle percentage
        end
    end

endmodule

