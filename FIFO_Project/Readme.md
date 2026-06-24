# 8-bit FIFO Memory Design using Verilog

## Overview

This project implements a synchronous **First-In First-Out (FIFO)** memory using Verilog HDL. The FIFO stores 8-bit data and supports write and read operations controlled by enable signals.

A comprehensive testbench is included to verify FIFO functionality, including reset, write, read, full flag, empty flag, overflow, and underflow conditions.

---

## Features

* 8-bit data width
* FIFO depth of 8 locations
* Separate write and read enable signals
* Full and Empty status flags
* Synchronous operation using a clock
* Asynchronous reset
* Self-checking testbench

---

## FIFO Specifications

| Parameter     | Value         |
| ------------- | ------------- |
| Data Width    | 8 bits        |
| FIFO Depth    | 8 locations   |
| Write Pointer | 3 bits        |
| Read Pointer  | 3 bits        |
| Counter Width | 4 bits        |
| Reset Type    | Asynchronous  |
| Clock Edge    | Positive Edge |

---

## Block Diagram

```text
           +----------------+
data_in -->|                |
wr_en ---->|                |
rd_en ---->|     FIFO       |--> data_out
clk ------>|                |
rst ------>|                |
           +----------------+
             |          |
            full      empty
```

---

## Project Structure

```text
FIFO_Project/
│
├── fifo.v           # FIFO Design
├── fifo_tb.v        # Testbench
├── README.md        # Documentation
└── waveform.png     # Simulation Waveform
```

---

## FIFO Operation

### Write Operation

When:

```verilog
wr_en = 1
full  = 0
```

The input data is stored in the FIFO memory and the write pointer advances.

---

### Read Operation

When:

```verilog
rd_en = 1
empty = 0
```

The oldest stored data is read from the FIFO and the read pointer advances.

---

### Full Condition

The FIFO becomes full when:

```verilog
count == 8
```

Output:

```verilog
full = 1
```

Further write operations are blocked.

---

### Empty Condition

The FIFO becomes empty when:

```verilog
count == 0
```

Output:

```verilog
empty = 1
```

Further read operations are blocked.

---

## Testbench Verification

The testbench performs the following checks:

### 1. Reset Test

* Applies reset
* Verifies FIFO becomes empty

### 2. Write Test

* Writes:

  * 10
  * 20
  * 30
* Verifies FIFO is no longer empty

### 3. Read Test

* Reads stored data
* Verifies FIFO order:

  * 10
  * 20
  * 30

### 4. Empty Flag Test

* Verifies empty flag after all data is read

### 5. Full Flag Test

* Fills all 8 FIFO locations
* Verifies full flag assertion

### 6. Overflow Test

* Attempts writing when FIFO is full
* Verifies no corruption occurs

### 7. Underflow Test

* Attempts reading when FIFO is empty
* Verifies proper FIFO behavior

---

## Simulation Results

Expected Console Output:

```text
RESET TEST PASS
WRITE TEST PASS
READ1 PASS
READ2 PASS
READ3 PASS
EMPTY FLAG PASS
FULL FLAG PASS
OVERFLOW TEST PASS
UNDERFLOW TEST PASS

=================================
ALL TESTS PASSED
=================================
```

---

## Tools Used

* Verilog HDL
* Xilinx Vivado Simulator
* Behavioral Simulation

---

## Concepts Demonstrated

* FIFO Architecture
* Sequential Logic Design
* Memory Arrays
* Read/Write Pointers
* Occupancy Counter
* Full and Empty Flags
* Verification using Testbench
* Overflow and Underflow Handling

---

## Future Improvements

* Parameterized FIFO Depth
* Parameterized Data Width
* Simultaneous Read/Write Support
* Almost Full Flag
* Almost Empty Flag
* Dual Clock Asynchronous FIFO
* FPGA Hardware Implementation

---

## Author

Sreeram Krishna

B.Tech Electronics and Communication Engineering (ECE)
