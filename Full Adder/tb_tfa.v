`include "tfa.v"
module tb_tfa;
reg a_tb,b_tb,cin_tb;
wire sum_tb,carry_tb;

tfa dut(.a(a_tb),.b(b_tb),.cin(cin_tb),.sum(sum_tb),.carry(carry_tb));
initial begin
$display("#########################################");
repeat(10) begin
{a_tb,b_tb,cin_tb}=$random();
#5;
$display("a=%0d\tb=%0d\tcin=%0d\sum=%0d\tcarry=%0d",a_tb,b_tb,cin_tb,sum_tb,carry_tb);
end
$display("#########################################");
end

initial begin
$fsdbDumpfile("tfa.fsdb");
$fsdbDumpvars(0,tb_tfa);
end
endmodule
