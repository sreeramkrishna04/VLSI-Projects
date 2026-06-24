# VLSI Projects using Verilog HDL

## Overview

This repository contains a collection of digital design and VLSI projects developed using Verilog HDL. The projects cover fundamental concepts such as combinational logic, sequential logic, finite state machines (FSMs), communication protocols, memory design, and verification through simulation.

All projects were designed, simulated, and verified using Xilinx Vivado.

---

## Repository Structure

```text
VLSI-Projects/
│
├── ALU_4BIT/
├── Counter_Project/
├── FIFO_Project/
├── MUX_32to1/
├── Traffic_Light_Controller/
├── UART/
├── Vending_Machine/
│
└── README.md
```

---

## Projects Included

### 1. 4-Bit ALU

A 4-bit Arithmetic Logic Unit capable of performing:

* Addition
* Subtraction
* AND
* OR
* XOR
* NOT
* Left Shift
* Right Shift

**Concepts:** Combinational Logic, Arithmetic Circuits, Multiplexing

---

### 2. Counter Project

A digital counter implemented using sequential logic.

**Concepts:** Registers, Clocked Logic, State Transitions

---

### 3. FIFO Memory

An 8-bit First-In First-Out memory with:

* Read Operation
* Write Operation
* Full Flag
* Empty Flag

**Concepts:** Memory Design, Pointers, Sequential Logic

---

### 4. 32:1 Multiplexer

A combinational logic circuit that selects one of 32 input lines and forwards it to a single output based on a 5-bit select signal.

**Features:**

* 32 Input Lines
* 1 Output Line
* 5-bit Select Signal
* Verilog HDL Implementation
* Functional Verification using Testbench

**Concepts:** Multiplexers, Combinational Logic, Vector Signals, Functional Verification

---

### 5. Traffic Light Controller

FSM-based traffic signal controller implementing:

* Red State
* Green State
* Yellow State

**Concepts:** Finite State Machines (FSM), State Transitions

---

### 6. UART Communication System

Basic UART implementation including:

* UART Transmitter
* UART Receiver
* Loopback Verification

**Concepts:** Serial Communication, FSM Design, Data Serialization

---

### 7. Vending Machine Controller

FSM-based vending machine that:

* Accepts ₹5 and ₹10 coins
* Dispenses product after collecting ₹15

**Concepts:** State Machines, Sequential Logic

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Vivado Simulator (XSim)
* Git
* GitHub

---

## Key Concepts Covered

* Combinational Logic Design
* Sequential Logic Design
* Finite State Machines (FSM)
* Arithmetic Logic Units (ALU)
* Multiplexer Design
* Memory Design
* UART Communication
* Counters and Registers
* Testbench Development
* Functional Verification
* RTL Design

---

## Simulation

Each project contains:

* RTL Design Files
* Testbench Files
* Simulation Results
* Project Documentation

All designs were verified through behavioral simulation before being added to this repository.

---

## Learning Objectives

The purpose of this repository is to strengthen understanding of:

* Digital System Design
* RTL Coding in Verilog
* VLSI Design Flow
* FPGA-Oriented Development
* Hardware Verification Techniques

---

## Author

**Sreeram Krishna**

B.Tech Electronics and Communication Engineering (ECE)

Passionate about Digital Design, Embedded Systems, FPGA Development, and VLSI Design.
