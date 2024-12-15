module Brent_kung_tb #(parameter N = 64)();
    reg [N-1:0] a,b;
    reg cin;
    wire [N-1:0] sum;
    wire cout;

    parameter MAXPOS = 255;
    parameter ZERO = 0;

    Brent_kung_Nbit #(.N(N)) DUV (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

    initial begin
        // Directed test cases
        a=ZERO; b=ZERO; cin=ZERO;       // 0+0=0
        #10;
        a=MAXPOS; b=ZERO; cin=ZERO;     // 255+0=255
        #10;
        a=ZERO; b=MAXPOS; cin=ZERO;     // 0+255=255
        #10;
        a=MAXPOS; b=MAXPOS; cin=ZERO;   // 255+255=510
        #10;
        a=ZERO; b=ZERO; cin=1;          // 0+0+1=1
        #10;
        a=MAXPOS; b=ZERO; cin=1;        // 255+0+1=256
        #10;
        a=ZERO; b=MAXPOS; cin=1;        // 255+0+1=256
        #10;
        a=MAXPOS; b=MAXPOS; cin=1;      // 255+255+1=511
        #10;

        // Chech functionality using small numbers
        repeat(100)begin
            a=$urandom_range(0,1000000000);
            b=$urandom_range(0,1000000000);
            cin=$random;
            #10;
        end
        // Chech Cout using random test cases
        repeat(100)begin
            a=$random;
            b=$random;
            cin=$random;
            #10;
        end
        $stop;
    end
    initial begin
        $monitor("At time %t, a = %d, b = %d, cin = %b, sum = %d, cout = %b",$time, a, b, cin, sum, cout);
    end
endmodule
