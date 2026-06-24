# 4-Bit Arithmetic Logic Unit (ALU) using Verilog

## Overview

This project implements a **4-bit Arithmetic Logic Unit (ALU)** in Verilog HDL and verifies its functionality using a testbench in Xilinx Vivado Simulator.

The ALU performs both arithmetic and logical operations based on a 3-bit select input (`sel`).

---

## Features

The ALU supports the following operations:

| Select (`sel`) | Operation          |
| -------------- | ------------------ |
| 000            | A + B              |
| 001            | A - B              |
| 010            | A AND B            |
| 011            | A OR B             |
| 100            | A XOR B            |
| 101            | NOT A              |
| 110            | Left Shift A by 1  |
| 111            | Right Shift A by 1 |

---

## Project Structure

```text
ALU4/
│
├── alu4.v          # ALU design module
├── alu4_tb.v       # Testbench
├── README.md       # Project documentation
└── waveform.png    # Simulation waveform (optional)
```

---

## Design Description

### Inputs

* `A` : 4-bit input operand
* `B` : 4-bit input operand
* `sel` : 3-bit operation selector

### Output

* `Y` : 4-bit result output

---

## Testbench Details

The testbench applies:

```verilog
A = 4'b0101;   // Decimal 5
B = 4'b0011;   // Decimal 3
```

and cycles through all possible select values from `000` to `111` with a delay of 10 ns between operations.

---

## Expected Results

| sel | Operation | Result (Binary) | Result (Decimal) |
| --- | --------- | --------------- | ---------------- |
| 000 | 5 + 3     | 1000            | 8                |
| 001 | 5 - 3     | 0010            | 2                |
| 010 | 5 AND 3   | 0001            | 1                |
| 011 | 5 OR 3    | 0111            | 7                |
| 100 | 5 XOR 3   | 0110            | 6                |
| 101 | NOT 5     | 1010            | 10               |
| 110 | 5 << 1    | 1010            | 10               |
| 111 | 5 >> 1    | 0010            | 2                |

---

## Simulation Tool

* Xilinx Vivado
* Verilog HDL
* Behavioral Simulation

---

## Learning Outcomes

Through this project, the following concepts were practiced:

* Combinational Circuit Design
* Verilog `always @(*)` Block
* Case Statements
* Arithmetic Operations
* Logical Operations
* Shift Operations
* Testbench Development
* Functional Verification

---

## Author

Sreeram Krishna

B.Tech Electronics and Communication Engineering (ECE)

---

## Future Improvements

* Add carry and borrow outputs
* Add overflow detection
* Design an 8-bit ALU
* Implement the design on FPGA hardware
* Create a parameterized ALU for variable bit widths
