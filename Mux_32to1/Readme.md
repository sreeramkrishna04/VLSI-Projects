# 32:1 Multiplexer (MUX) using Verilog

## Overview

This project implements a 32:1 Multiplexer (MUX) using Verilog HDL. A multiplexer is a combinational logic circuit that selects one input from multiple inputs and forwards it to a single output based on the value of the select lines.

In this design, 32 input lines are connected to a single output line. A 5-bit select signal determines which input is routed to the output.

---

## Features

* 32 input lines
* 1 output line
* 5-bit select signal
* Pure combinational logic design
* Behavioral simulation in Vivado
* Verilog HDL implementation

---

## Theory

A multiplexer selects one of many inputs and connects it to the output.

Since:

2⁵ = 32

a 5-bit select signal is required to choose among the 32 inputs.

### Functional Equation

If:

* sel = 0 → out = in[0]
* sel = 1 → out = in[1]
* sel = 2 → out = in[2]
* ...
* sel = 31 → out = in[31]

---

## Module Interface

### Inputs

| Signal | Width   | Description      |
| ------ | ------- | ---------------- |
| in     | 32 bits | Input data lines |
| sel    | 5 bits  | Select signal    |

### Output

| Signal | Width | Description     |
| ------ | ----- | --------------- |
| out    | 1 bit | Selected output |

---

## Project Structure

```text
MUX_32to1
│
├── mux32to1.v
├── mux32to1_tb.v
├── waveform.png
└── README.md
```

---

## Simulation

The testbench applies a fixed input pattern:

```text
10101010101010101010101010101010
```

The select line is varied from 0 to 7.

Expected output sequence:

```text
0 → 1 → 0 → 1 → 0 → 1 → 0 → 1
```

Simulation results confirm correct operation of the multiplexer.

---

## Waveform

Add your Vivado simulation screenshot here:

```text
waveform.png
```

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* XSim Simulator
* GitHub

---

## Concepts Learned

* Combinational Logic
* Multiplexer Design
* Vector Signals
* Select Line Operation
* Verilog HDL
* Testbench Development
* Functional Verification
* Waveform Analysis

---

## Author

Sreeram

B.Tech Electronics and Communication Engineering (ECE)
