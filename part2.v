module part2(KEY, SW, LEDR, LEDG);

	wire [2:0] u, v, w, x, y, z;
	wire s0, s1, s2;
	input [2:0] KEY;
	input [17:0] SW;
	wire [2:0] m;
	output [17:0] LEDR;
	output [2:0] LEDG;
	
	assign s0 = KEY[0];
	assign s1 = KEY[1];
	assign s2 = KEY[2];
	assign u[0] = SW[0];
	assign u[1] = SW[1];
	assign u[2] = SW[2];
	assign v[0] = SW[3];
	assign v[1] = SW[4];
	assign v[2] = SW[5];
	assign w[0] = SW[6];
	assign w[1] = SW[7];
	assign w[2] = SW[8];
	assign x[0] = SW[9];
	assign x[1] = SW[10];
	assign x[2] = SW[11];
	assign y[0] = SW[12];
	assign y[1] = SW[13];
	assign y[2] = SW[14];
	assign z[0] = SW[15];
	assign z[1] = SW[16];
	assign z[2] = SW[17];
	assign LEDR = SW;

	assign m[0] = (~s0&~s1&~s2&u[0])|(s0&~s1&~s2&v[0])|(~s0&s1&~s2&w[0])|(s0&s1&~s2&x[0])|(~s0&~s1&s2&y[0])|(s0&~s1&s2&z[0])|(~s0&s1&s2&y[0])|(s0&s1&s2&z[0]);
	assign m[1] = (~s0&~s1&~s2&u[1])|(s0&~s1&~s2&v[1])|(~s0&s1&~s2&w[1])|(s0&s1&~s2&x[1])|(~s0&~s1&s2&y[1])|(s0&~s1&s2&z[1])|(~s0&s1&s2&y[1])|(s0&s1&s2&z[1]);
	assign m[2] = (~s0&~s1&~s2&u[2])|(s0&~s1&~s2&v[2])|(~s0&s1&~s2&w[2])|(s0&s1&~s2&x[2])|(~s0&~s1&s2&y[2])|(s0&~s1&s2&z[2])|(~s0&s1&s2&y[2])|(s0&s1&s2&z[2]);
	
	assign LEDG = m;
	

	
endmodule