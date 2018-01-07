module part3(SW, HEX0);

	input [2:0] SW;
	wire c0, c1, c2;
	output [6:0] HEX0;
	
	assign c0 = SW[0];
	assign c1 = SW[1];
	assign c2 = SW[2];
	assign HEX0[0] = c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[1] = ~c2&~c1&~c0|~c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[2] = (c2|~c1|c0)&(~c2|c1|c2)&(~c2|c1|~c2);
	assign HEX0[3] = c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[4] = ~c2&c1&~c0|c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[5] = ~c2&c1&~c0|~c2&c1&c0|c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	assign HEX0[6] = c2&~c1&~c0|c2&~c1&c0|c2&c1&~c0|c2&c1&c0;
	
endmodule
