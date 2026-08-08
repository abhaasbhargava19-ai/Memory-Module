//Dual port RAM has two ports, one for read and one for write operations, allowing simultaneous access to the memory.
module dual_port_ram(q_a,q_b,din_a,din_b,addr_a,addr_b,clk,wr_a,wr_b);
input [7:0]din_a,din_b;
input [5:0]addr_a,addr_b;
input clk,wr_a,wr_b;
output reg [7:0]q_a,q_b;

reg [7:0] mem [63:0];//64 locations of 8 bit each

always @(posedge clk)
begin
    if(wr_a) mem[addr_a] <= din_a;//write operation for port A
     else
        q_a <= mem[addr_a];//read operation for port A 
end

always @(posedge clk)
begin
    if(wr_b) mem[addr_b] <= din_b;//write operation for port B
     else
        q_b <= mem[addr_b];//read operation for port B
end
endmodule


module dual_port_ram_tb;
reg [7:0]din_a,din_b;
reg [5:0]addr_a,addr_b;
reg clk,wr_a,wr_b;
wire [7:0]q_a,q_b;

dual_port_ram uut(
    .q_a(q_a),
    .q_b(q_b),
    .din_a(din_a),
    .din_b(din_b),
    .addr_a(addr_a),
    .addr_b(addr_b),
    .clk(clk),
    .wr_a(wr_a),
    .wr_b(wr_b)
);

initial 
begin
    $dumpfile("dual_port_ram_tb.vcd");
    $dumpvars(0,dual_port_ram_tb);
    clk=1'b1;
    forever #5 clk=~clk;
end

initial 
begin
    din_a=8'h33;
    addr_a=6'h01;

    din_b=8'h44;
    addr_b=6'h01;

    wr_a=1'b1;
    wr_b=1'b1;

    #12;
    
    din_a=8'h55;
    addr_a=6'h02;

    addr_b=6'h01;

    wr_b=1'b0;

    #10;

    addr_a=6'h02;

    addr_b=6'h03;

    wr_a=1'b0;

    #10;

    addr_a=6'h01;

    din_b=8'h77;
    addr_b=6'h02;

    wr_b=1'b1;

    #10;

    #10 $finish;
end
endmodule
