//single port RAM  accessed by a single port, read and write operations are mutually exclusive

module single_port_ram(dout,din,addr,clk,wr);//64locations x 8bit
input [7:0]din;//data bus 8 bit
input [5:0]addr;//address bus 2^6=64 locations
input clk,wr;//write enable
output [7:0]dout;//data out bus 8 bit

reg [7:0] mem [63:0];//64 locations of 8 bit each
reg [5:0] addr_reg;//address register to store address for rd/wr operation
always @(posedge clk)
begin
    if(wr) mem[addr] <= din;//write operation
    addr_reg <= addr;//store address for read operation
end
assign dout = mem[addr_reg];//read operation
endmodule

module single_port_ram_tb;
reg [7:0] data;//data bus 8 bit
reg [5:0] addr;
reg clk,wr;
wire [7:0] q;
single_port_ram ram(.dout(q),.din(data),.addr(addr),.clk(clk),.wr(wr));
initial 
begin
    $dumpfile("single_port_ram_tb.vcd");
    $dumpvars(0,single_port_ram_tb);
    clk=1'b1;
    forever #5 clk=~clk;
end
initial 
begin
    data=8'h1;
    addr=5'd0;
    wr=1'b1;
    #12;

    data=8'h2;
    addr=5'd1;
    wr=1'b1;
    #10;

    data=8'h3;
    addr=5'd2;
    wr=1'b1;
    #10;

    data=8'h4;
    addr=5'd3;
    wr=1'b1;
    #10;

    data=8'h5;
    addr=5'd4;
    wr=1'b1;
    #10;

    addr=5'd0;
    wr=1'b0;
    #10;

    addr=5'd1;
    wr=1'b0;
    #10;

    addr=5'd2;
    wr=1'b0;
    #10;

    addr=5'd3;
    wr=1'b0;
    #10;

    data=8'h4;
    addr=5'd1;
    wr=1'b1;
    #10;

    addr=5'd1;
    wr=1'b0;
    #10;

    #10 $finish;
end
endmodule
