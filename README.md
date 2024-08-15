# Four-Bit Register with Mode Selection Using D Flip-Flops and Multiplexers
## Overview
This project demonstrates the design and implementation of a four-bit register using D flip-flops and 4x1 multiplexers in Verilog. The register can operate in four different modes depending on the values of the select lines (s1 and s0), offering various operations such as holding the current value, complementing the output, shifting bits to the right, and shifting bits to the left.

## Features
### Mode Selection: The register operates based on the values of the mode selection inputs (s1, s0):
00: No change.
01: Complement the output.
10: Shift bits to the right.
11: Shift bits to the left.
### D Flip-Flops: Used to store the bits of the register.
### Multiplexers: Used to implement the different modes of operation.

## Design Components
### Modules
Invert Module: Complements a single bit.
D Flip-Flop Module: Stores a single bit, with a clock and reset functionality.
4x1 Multiplexer Module: Selects one of the four inputs based on the mode selection inputs.
Register Module: Combines the above modules to form the four-bit register with the required operations.
Testbench
The testbench (newtb.v) provides various test cases to verify the correct operation of the register under different mode selections.

## Getting Started
### Prerequisites
Icarus Verilog: For simulation and synthesis of Verilog code.
GTKWave: For waveform visualization.

### Running the Simulation

Clone the repository to your local machine.
'''bash 
git clone https://github.com/Nagathejas-M-S/Four-Bit-Register-with-Mode-Selection-Using-D-Flip-Flops-and-Multiplexers.git

Navigate to the project directory.
'''bash 
cd four-bit-register-verilog

Compile and run the simulation using Icarus Verilog.
'''bash 
iverilog -o register_sim new.v newtb.v
vvp register_sim

View the waveform in GTKWave.
'''bash 
gtkwave waveform.vcd

## Project Structure
new.v: Contains the Verilog code for the four-bit register, D flip-flops, and multiplexers.
newtb.v: Contains the testbench for simulating the register.
waveform.vcd: Generated waveform file for analysis in GTKWave.

## Test Cases
Case 1: No change in output when s1s0 = 00.
Case 2: Output complement when s1s0 = 01.
Case 3: Shift bits to the right when s1s0 = 10.
Case 4: Shift bits to the left when s1s0 = 11.
