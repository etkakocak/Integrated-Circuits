# Integrated Circuits 

## Description
This repository contains a variety of digital circuit designs simulated using the ``Digital`` application. The circuits model various subsystems commonly found in computers and calculators, providing insight into the inner workings of these machines. From basic components like drivers and decoders to more complex systems, this repository serves as a resource for those interested in learning about digital logic and computer architecture.   

### Directories
``/FPGA``: The FPGA directory contains codes in the VHDL language. These are the codes written for FPGA ICs used in circuits.  

VHDL is a type of Hardware Description Language (HDL) used in electronic design automation to describe digital and mixed-signal systems such as field-programmable gate arrays (FPGAs) and integrated circuits. VHDL is a powerful tool for FPGA development, enabling the description of complex digital logic circuits using a high-level, human-readable syntax. An FPGA, or Field-Programmable Gate Array, is an integrated circuit designed to be configured by a designer or a customer after manufacturing. The FPGA configuration is generally specified using a hardware description language (HDL), like VHDL. These flexible devices allow a wide range of designs, from simple logic circuits to complete system-on-chip designs.  


``/circuits``: The Circuit directory contains files of circuits specifically designed for simulation in the Digital application. You can open these files directly in the application to simulate the circuits.  

To use these files, you will need to have the Digital application installed on your computer. You can download the Digital application from its GitHub repository.


``/set``: The Set directory contains Verilog files used for some simulation settings. Can be ignored.  


## Circuits

### ThreeBitCounter
![ThreeBitCounter](/img/ThreeBitCounter.png)

* Circuit: ``/circuits/ThreeBitCounter.dig``
* Code of FPGA: ``/FPGA/ThreeBitCounter.vhdl``

This FPGA-based circuit serves as a bidirectional counter with two control signals and a clock signal, outputting its state on a hexadecimal display. Depending on the combination of the control signals, it performs different counting operations. When the control input m1 is high and m0 is low, the counter decrementally counts from 7 to 0. Conversely, with m0 high and m1 low, it incrementally counts from 0 to 7. If both m0 and m1 are high, the counter alternates between counting up by two from 0 to 7 and counting down by two from 7 to 0. Each counting operation is triggered by the rising edge of the clock signal.   


### Hex
![hex](/img/hex.png)

* Circuit: ``/circuits/hex.dig``
* Code of FPGA: ``/FPGA/hex.vhdl``

This digital circuit, based on FPGA, takes four input signals representing a 4-bit hexadecimal number and presents this number on a hexadecimal display. Simultaneously, it generates five distinct output signals that each convey a particular characteristic of the incoming number: whether it's at its minimum or maximum in the hexadecimal range, whether it's less than three, whether it's even, and whether it's a valid Binary-Coded Decimal (BCD) number or a non-BCD hexadecimal number. This circuit provides a dynamic and real-time analysis of 4-bit hexadecimal numbers, serving as an invaluable tool for understanding digital logic, FPGA programming, and the properties of the hexadecimal numbering system.  


### JK flip-flop
![jkff](/img/jkff.png)

* Circuit: ``/circuits/JK_ff.dig``
* IC logic: ``/set/jk_set.v``

This digital circuit leverages the functionality of 7476 integrated circuits, which are JK flip-flops, to construct a counter that incrementally counts from 0 to 9 upon receiving a clock signal, and resets back to 0 after reaching 9. The current state of the counter is displayed on a hexadecimal display, providing a clear visualization of the counting operation. Simultaneously, the counter's state is also conveyed in binary representation through four LED outputs, which illuminate corresponding to the binary value of the current counter state.  


### BCD
![bcd](/img/bcd.png)

* Circuit: ``/circuits/BCD.dig``
* Code of FPGA: ``/FPGA/BCD.vhdl``
* IC logic: ``/set/74247_set.v``

This digital circuit utilizes an FPGA to process four input signals representing a 4-bit number in both BCD (Binary-Coded Decimal) and noBCD formats and generate a corresponding output signal. This 4-bit input, along with the output signal from the FPGA, are fed into a 74247 driver. The 74247 driver (BCD-to-Seven Segment Driver), interprets the received signals and drives a seven-segment display to visually represent the BCD or noBCD number. This circuit provides a tangible demonstration of BCD and noBCD number representation and decoding, effectively translating digital binary inputs into a user-readable display.  


### 9-X
![nineMinusX](/img/nineMinusX.png)

* Circuit: ``/circuits/nineMinusX.dig``
* Math logic: ``/set/nineMinusX.c``

This digital circuit employs an array of NAND logic gates to perform mathematical computations based on the principles of Boolean algebra. It takes four input signals representing a 4-bit binary number, and performs a "9 minus X" operation, where X is the input number. The result of this operation is then displayed on a hexadecimal display. By exclusively using NAND gates, one of the universal gates in digital logic, this circuit demonstrates how complex mathematical operations can be broken down and executed using fundamental logic gates. 


### Lock
![lock](/img/lock.png)

* Circuit: ``/circuits/lock.dig``
* Code of FPGA: ``/FPGA/lock.vhdl``

This digital circuit, built with an FPGA, establishes a simple electronic lock mechanism. The circuit takes three signals as input, which correspond to a binary number, and displays this number on a hexadecimal display while also sending the signals to the FPGA. The system is initially inactive, awaiting the correct password. When the clock signal is activated and the correct password "421" is entered, the system unlocks. However, if an incorrect password is entered, the system locks and a reset signal is required to clear the incorrect password and allow a new entry attempt. This circuit demonstrates a basic electronic password protection scheme, showcasing the potential of FPGAs in security applications and the practical implementation of digital logic in access control systems.