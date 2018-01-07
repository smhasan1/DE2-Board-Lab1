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
