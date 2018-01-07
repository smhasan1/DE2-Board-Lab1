module part4(KEY, SW, HEX0);

	input [2:0] KEY;
	input [17:0] SW;
	wire [2:0] m;
	wire c0, c1, c2;
	output [6:0] HEX0;

	assign m[0] = (~KEY[0]&~KEY[1]&~KEY[2]&SW[15])|(KEY[0]&~KEY[1]&~KEY[2]&SW[12])|(~KEY[0]&KEY[1]&~KEY[2]&SW[9])|(KEY[0]&KEY[1]&~KEY[2]&SW[6])|(~KEY[0]&~KEY[1]&KEY[2]&SW[3])|(KEY[0]&~KEY[1]&KEY[2]&SW[0])|(~KEY[0]&KEY[1]&KEY[2]&SW[3])|(KEY[0]&KEY[1]&KEY[2]&SW[0]);
	assign m[1] = (~KEY[0]&~KEY[1]&~KEY[2]&SW[16])|(KEY[0]&~KEY[1]&~KEY[2]&SW[13])|(~KEY[0]&KEY[1]&~KEY[2]&SW[10])|(KEY[0]&KEY[1]&~KEY[2]&SW[7])|(~KEY[0]&~KEY[1]&KEY[2]&SW[4])|(KEY[0]&~KEY[1]&KEY[2]&SW[1])|(~KEY[0]&KEY[1]&KEY[2]&SW[4])|(KEY[0]&KEY[1]&KEY[2]&SW[1]);
	assign m[2] = (~KEY[0]&~KEY[1]&~KEY[2]&SW[17])|(KEY[0]&~KEY[1]&~KEY[2]&SW[14])|(~KEY[0]&KEY[1]&~KEY[2]&SW[11])|(KEY[0]&KEY[1]&~KEY[2]&SW[8])|(~KEY[0]&~KEY[1]&KEY[2]&SW[5])|(KEY[0]&~KEY[1]&KEY[2]&SW[2])|(~KEY[0]&KEY[1]&KEY[2]&SW[5])|(KEY[0]&KEY[1]&KEY[2]&SW[2]);
	
	assign c0 = m[0];
	assign c1 = m[1];
	assign c2 = m[2];
	assign HEX0[0] = c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[1] = ~c2&~c1&~c0|~c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[2] = (c2|~c1|c0)&(~c2|c1|c2)&(~c2|c1|~c2);
	assign HEX0[3] = c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[4] = ~c2&c1&~c0|c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[5] = ~c2&c1&~c0|~c2&c1&c0|c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[6] = c2&~c1&~c0|c2&~c1&c0|c2&c1&~c0|c2&c1&c0;

endmodule