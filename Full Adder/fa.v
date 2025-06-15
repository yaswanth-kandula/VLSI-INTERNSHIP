
module fa(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
wire c1,s1,c2,s2;

ha ha1(a,b,s1,c1);
ha ha2(s1,cin,s2,c2);
assign carry=c2+c1;
assign sum=s2;

endmodule


module ha(a,b,sum,carry);
	input a,b;
	output sum,carry;
	assign sum=a^b;
	assign carry=a&b;

endmodule
