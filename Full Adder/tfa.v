module tfa(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
assign sum=(a==b)?cin:~cin;
assign carry=(a==b)?a:cin;
endmodule
