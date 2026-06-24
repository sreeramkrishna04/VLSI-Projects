# Vending Machine Controller using Verilog HDL

## Overview

This project implements a simple Finite State Machine (FSM) based Vending Machine Controller using Verilog HDL.

The vending machine accepts:

* ₹5 coin
* ₹10 coin

A product is dispensed when the total inserted amount reaches ₹15.

The design is verified using a Verilog testbench and simulated in Xilinx Vivado.

---

## Features

* FSM-based design
* Accepts ₹5 and ₹10 coins
* Product dispensing at ₹15
* Automatic state reset after dispensing
* Asynchronous reset support
* Behavioral simulation

---

## Vending Machine Specifications

| Parameter        | Value         |
| ---------------- | ------------- |
| Product Cost     | ₹15           |
| Accepted Coins   | ₹5, ₹10       |
| Number of States | 4             |
| Reset Type       | Asynchronous  |
| Clock Edge       | Positive Edge |

---

## State Description

The machine tracks the accumulated amount using four states.

| State | Amount Collected       |
| ----- | ---------------------- |
| S0    | ₹0                     |
| S5    | ₹5                     |
| S10   | ₹10                    |
| S15   | ₹15 (Dispense Product) |

---

## State Diagram

```text id="2vl8s9"
           ₹5
      +----------+
      |          v
   +------+    +------+
   | S0   |--->| S5   |
   +------+    +------+
      |           |
     ₹10         ₹5
      |           |
      v           v
   +------+---->+------+
   | S10  |     | S15  |
   +------+<----+------+
      |
     ₹5/₹10
      |
      v
    S15
```

After dispensing:

```text id="w9cmkp"
S15 → S0
```

---

## Inputs

| Signal | Width | Description       |
| ------ | ----- | ----------------- |
| clk    | 1 bit | System Clock      |
| rst    | 1 bit | Active High Reset |
| coin5  | 1 bit | ₹5 Coin Input     |
| coin10 | 1 bit | ₹10 Coin Input    |

---

## Outputs

| Signal   | Width | Description             |
| -------- | ----- | ----------------------- |
| dispense | 1 bit | Product Dispense Signal |

---

## Working Principle

### Initial State

After reset:

```text id="3k6rmz"
State = S0
Dispense = 0
```

---

### Coin Insertion Logic

#### From S0

| Coin Inserted | Next State |
| ------------- | ---------- |
| ₹5            | S5         |
| ₹10           | S10        |

---

#### From S5

| Coin Inserted | Next State |
| ------------- | ---------- |
| ₹5            | S10        |
| ₹10           | S15        |

---

#### From S10

| Coin Inserted | Next State |
| ------------- | ---------- |
| ₹5            | S15        |
| ₹10           | S15        |

---

#### From S15

```text id="ggkm3l"
Dispense Product
Return to S0
```

---

## Example Transaction

### Case 1

```text id="njvk8v"
Insert ₹5
Insert ₹10
```

Total:

```text id="z4w8ww"
₹15
```

Result:

```text id="18crtm"
Product Dispensed
```

---

### Case 2

```text id="r6jlwm"
Insert ₹10
Insert ₹5
```

Result:

```text id="ej3v7h"
Product Dispensed
```

---

### Case 3

```text id="xgq47o"
Insert ₹5
Insert ₹5
Insert ₹5
```

Result:

```text id="1uwkgf"
Product Dispensed
```

---

## Testbench Description

The testbench performs:

### Reset Operation

```verilog id="j1hycw"
rst = 1;
```

Initializes the vending machine.

---

### Coin Sequence

The following sequence is applied:

```text id="50k8d8"
Insert ₹5
Insert ₹10
```

Expected state progression:

```text id="25fx8q"
S0 → S5 → S15
```

Expected output:

```text id="g8mjlwm"
dispense = 1
```

---

## Expected Waveform Behavior

```text id="tuyx5v"
Time
 |
 +--> Reset
 |
 +--> Coin5 Inserted
 |
 +--> Coin10 Inserted
 |
 +--> Dispense Pulse
 |
 +--> Return to Idle
```

---

## Project Structure

```text id="j0wjlwm"
Vending_Machine_Controller/
│
├── vending_machine.v      # FSM Design
├── vending_machine_tb.v   # Testbench
├── README.md              # Documentation
└── waveform.png           # Simulation Waveform
```

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Vivado Simulator

---

## Concepts Demonstrated

* Finite State Machines (FSM)
* Sequential Logic Design
* State Transition Logic
* Coin-Based Decision Making
* Digital System Verification
* Testbench Development

---

## Future Improvements

* Support additional coin denominations
* Return change functionality
* Multiple product selection
* LCD display interface
* Inventory management
* FPGA implementation
* Parameterized product pricing

---

## Author

Sreeram Krishna

B.Tech Electronics and Communication Engineering (ECE)
