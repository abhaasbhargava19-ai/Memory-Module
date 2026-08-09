//ROM can only read data, it cannot write data. It is a non-volatile memory that retains its data even when the power is turned off. 
//ROM is typically used to store firmware or software that is rarely changed

module rom(data,en,addr,clk);
input clk,en;
input [3:0]addr;
output reg [3:0]data;

reg [3:0] mem [15:0];//16 locations of 4 bit each

always @(posedge clk)
begin
    
    if(en) data <= mem[addr];//read operation for ROM 
     else
        data <= 4'bxxxx;//output undefined when enable is low
end

initial
begin
    mem[0] = 4'b0010;// all locations are initialized with some data which will be read when the address is given
    mem[1] = 4'b0110;
    mem[2] = 4'b1010;
    mem[3] = 4'b0011;
    mem[4] = 4'b0001;
    mem[5] = 4'b0101;
    mem[6] = 4'b1101;
    mem[7] = 4'b0101;
    mem[8] = 4'b1100;
    mem[9] = 4'b1010;
    mem[10] = 4'b0000;
    mem[11] = 4'b1011;
    mem[12] = 4'b1100;
    mem[13] = 4'b1111;
    mem[14] = 4'b1110;
    mem[15] = 4'b1000;

end
endmodule

module rom_tb;
reg clk,en;
reg [3:0]addr;
wire [3:0]data;

rom uut(.data(data),.en(en),.addr(addr),.clk(clk));

initial 
begin
    $dumpfile("rom_tb.vcd");
    $dumpvars(0,rom_tb);
    clk=1'b1;
    forever #5 clk=~clk;

end

initial
begin   

    en = 1'b0;
    #12;

    en = 1'b1;
    addr = 4'd2;
    #10;

    en = 1'b1;
    addr = 4'd4;
    #10;

    en = 1'b1;
    addr = 4'd6;
    #10;

    en = 1'b1;
    addr = 4'd13;
    #10;

    en = 1'b1;
    addr = 4'd8;
    #10;

    en = 1'b1;
    addr = 4'd10;
    #10;

    #10 $finish;
end
endmodule






