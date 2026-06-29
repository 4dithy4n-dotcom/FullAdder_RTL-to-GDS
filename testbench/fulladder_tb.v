`timescale 1ns/1ps

module fulladder_tb;

    // Inputs
    reg a, b, cin;

    // Outputs
    wire sum, cout;

    // Instantiate the DUT
    fulladder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Create VCD file
        $dumpfile("fulladder_tb.vcd");
        $dumpvars(0, fulladder_tb);

        // Print header
        $display("Time\t a b cin | sum cout");
        $monitor("%0t\t %b %b  %b  |  %b    %b",
                  $time, a, b, cin, sum, cout);

        // Initialize inputs at time 0
        a = 0;
        b = 0;
        cin = 0;

        #10;
        cin = 1;

        #10;
        b = 1;
        cin = 0;

        #10;
        cin = 1;

        #10;
        a = 1;
        b = 0;
        cin = 0;

        #10;
        cin = 1;

        #10;
        b = 1;
        cin = 0;

        #10;
        cin = 1;

        #10;
        $finish;
    end

endmodule