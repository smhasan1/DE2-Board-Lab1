# DE2-Board-Lab1
**Part 1:**
The DE2 board provides 18 toggle switches, called SW17−0 that can be used as inputs to a circuit, and 18 red lights, called LEDR17−0 that can be used to display output values. Figure 1 shows a simple Verilog module that uses these switches and shows their states on the LEDs. Since there are 18 switches and lights it is convenient to represent them as vectors in the Verilog code, as shown. We have used a single assignment statement for all 18 LEDR outputs, which is equivalent to the individual assignments:  

    assign LEDR[17] = SW[17];  
    assign LEDR[16] = SW[16];  
    . . .  
    assign LEDR[0] = SW[0];  

The DE2 board has hardwired connections between its FPGA chip and the switches and lights. To use SW17−0 and LEDR17−0 it is necessary to include in your Quartus II project the correct pin assignments, which are given in the DE2 User Manual. For example, the manual specifies that SW0 is connected to the FPGA pin N25 and LEDR0 is connected to pin AE23. A good way to make the required pin assignments is to import into the Quartus II software the file called DE2 pin assignments.csv  

![image](https://user-images.githubusercontent.com/19510655/34651924-8db194ea-f3a5-11e7-9063-351f870f7ad2.png)  

Figure 1. Verilog code that uses the DE2 board switches and lights.  

The procedure for making pin assignments is described in the  
  (a) The tutorial “Quartus II Introduction Using Verilog Design” and,  
  (b) The DE2 Board lab usage,  

It is important to realize that the pin assignments in the DE2 pin assignments.csv file are useful only if the pin names given in the file are exactly the same as the port names used in your Verilog module. The file uses the names SW[0] . . . SW[17] and LEDR[0] . . . LEDR[17] for the switches and lights, which is the reason we used these names in Figure 1.  

Perform the following steps to implement a circuit corresponding to the code in Figure 1 on the DE2 board.  
  1. Create a new Quartus II project for your circuit. Select Cyclone II EP2C35F672C6 as the target chip, which is the FPGA chip on the Altera DE2 board.  
  2. Create a Verilog module for the code in Figure 1 and include it in your project.  
  3. Simulate your circuit with QSim for different values of SW. Ensure the output waveforms are correct for the different input values.  
  4. Include in your project the required pin assignments for the DE2 board, as discussed above. Compile the project.  
  5. Download the compiled circuit into the FPGA chip. Test the functionality of the circuit by toggling the switches and observing the LEDs.  

**Part 2:**  
Figure 2(a) shows a sum-of-products circuit that implements a 2-to-1 multiplexer with a select input s. If s = 0 the multiplexer’s output m is equal to the input x, and if s = 1 the output is equal to y. Part b of the figure gives a truth table for this multiplexer, and part c shows its circuit symbol.  


Figure 2. A 2-to-1 multiplexer.  

The multiplexer can be described by the following Verilog statement:  
  **assign** m = (∼s & x) | (s & y);  

Now consider a circuit in which the output m has to be selected from six inputs u, v, w, x, y, and z. Figure 3(a) shows how we can build the required 6-to-1 multiplexer by using five 2-to- 1 multiplexers. The circuit uses a 3-bit select input s2s1s0 and implements the truth table shown in Figure 3(b). A circuit symbol for this multiplexer is given in Figure 3(c).  


Figure 3. A 6-to-1 multiplexer.  

Now imagine that each of the inputs (u, v, w, x, y, and z) are a 3-bit signal rather than a 1-bit one. Figure 4 illustrates how this three-bit wide 6-to-1 multiplexer should look like. It basically contains three instances of the circuit in Figure 3(a), one for every bit.  


Figure 4. A three-bit wide 6-to-1 multiplexer.  

Perform the following steps to implement the three-bit wide 6-to-1 multiplexer.  
  1. Create a new Quartus II project for your circuit.  
  2. Create a Verilog module for the three-bit wide 6-to-1 multiplexer. Connect its select inputs to keys KEY2−0 and use the 18 switches SW17−0 to provide the six 3-bit inputs U to Z. Connect the SW switches to the red lights LEDR and connect the output M to the green lights LEDG2−0.  
  3. Simulate your circuit with QSim for different values of the inputs, ensuring the output waveforms are correct.  
  4. Include in your project the required pin assignments for the DE2 board. Compile the project.  
  5. Download the compiled circuit into the FPGA chip. Test the functionality of the three-bit wide 6-to-1 multiplexer by toggling the switches and observing the LEDs. Ensure that each of the inputs U to Z can be properly selected as the output M.  

**Part 3:**  
Figure 5 shows a 7-segment decoder module that has the three-bit input c2c1c0. This decoder produces seven outputs that are used to display a character on a 7-segment display. Table 1 lists the characters that should be displayed for each valuation of c2c1c0. To keep the design simple, only six characters are included in the table (plus the ‘blank’ character, which is selected for codes 110 − 111).  

The seven segments in the display are identified by the indices 0 to 6 shown in the figure. Each segment is illuminated by driving it to the logic value 0. You are to write a Verilog module that implements logic functions that represent circuits needed to activate each of the seven segments. Use only simple Verilog assign statements in your code to specify each logic function using a Boolean expression.  


Figure 5. A 7-segment decoder.  

Table 1  

| c2 c1 c0  | Character |
| ------------- | ------------- |
| 000  | E |
| 001  | E |
| 010  | 3 |
| 011  | 2 |
| 100  | 0 |
| 101  | 1 |
| 110  |  |
| 111  |  |

Perform the following steps:  
  1. Create a new Quartus II project for your circuit.  
  2. Create a Verilog module for the 7-segment decoder. Connect the c2c1c0 inputs to
  switches SW2−0, and connect the outputs of the decoder to the HEX0 display on the DE2 board. The segments in this display are called HEX00, HEX01,…,HEX06, corresponding to Figure 5. You should declare the 7-bit port  
                      **output [6:0] HEX0**  
  in your Verilog code so that the names of these outputs match the corresponding names in the DE2 User Manual and the DE2 pin assignments.csv file.  
  3. Simulate your circuit with QSim for a variety of input settings, ensuring the output waveforms are correct.  
  4. After making the required DE2 board pin assignments, compile the project.  
  5. Download the compiled circuit into the FPGA chip. Test the functionality of the circuit by toggling the SW2−0 switches and observing the 7-segment display.  

**Part 4:**  
Consider the circuit shown in Figure 6. It uses a three-bit wide 6-to-1 multiplexer to enable the selection of six characters that are displayed on a 7-segment display. Using the 7-segment decoder from Part 3 this circuit can display any of the characters E, E, 3, 2, 0, and 1. The character codes are set according to Table 1 by using the switches SW17−0, and a specific character is selected for display by setting the keys KEY2−0.  
In the next lab, we will use multiple seven-segment displays to form words from the letters. So, do not delete your Verilog, as you will need to use it next week!  


Figure 6. A circuit that can select and display one of six characters.  

Perform the following steps.  
  1. Create a new Quartus II project for your circuit.  
  2. Include your Verilog module in the Quartus II project. Connect the keys KEY2−0 to the select inputs of the three-bit wide 6-to-1 multiplexer. Also connect SW17−0 to the multiplexer as required to produce the patterns of characters shown in Table 1. Connect the outputs of the multiplexer to the 7-segment display HEX0.  
  3. Simulate your circuit with QSim; ensure the output waveforms are correct.  
  4. Include the required pin assignments for the DE2 board for all switches, LEDs, and 7-segment displays. Compile the project.  
  5. Download the compiled circuit into the FPGA chip. Test the functionality of the circuit by setting the proper character codes on the switches SW17−0 and then toggling KEY2−0 to observe the different characters.  
