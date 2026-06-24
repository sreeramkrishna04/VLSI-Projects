# Traffic Light Controller using Verilog HDL

## Overview

This project implements a finite state machine (FSM) based Traffic Light Controller using Verilog HDL. The controller cycles through three traffic light states:

* Red
* Green
* Yellow

The design is verified using a Verilog testbench and simulated in Xilinx Vivado.

---

## Features

* FSM-based design
* Three traffic light states
* Automatic state transitions
* Synchronous operation using clock signal
* Reset functionality
* Behavioral simulation support

---

## State Diagram

```text id="5dtr0z"
        +---------+
        |   RED   |
        +---------+
             |
             | 5 Clock Cycles
             v
        +---------+
        |  GREEN  |
        +---------+
             |
             | 5 Clock Cycles
             v
        +---------+
        | YELLOW  |
        +---------+
             |
             | 2 Clock Cycles
             v
        +---------+
        |   RED   |
        +---------+
```

---

## State Encoding

| State        | Binary Value |
| ------------ | ------------ |
| RED_STATE    | 00           |
| GREEN_STATE  | 01           |
| YELLOW_STATE | 10           |

---

## Timing Specification

| State  | Duration       |
| ------ | -------------- |
| Red    | 5 Clock Cycles |
| Green  | 5 Clock Cycles |
| Yellow | 2 Clock Cycles |

---

## Inputs

| Signal | Width | Description       |
| ------ | ----- | ----------------- |
| clk    | 1 bit | System Clock      |
| reset  | 1 bit | Active High Reset |

---

## Outputs

| Signal | Width | Description         |
| ------ | ----- | ------------------- |
| red    | 1 bit | Red Light Output    |
| yellow | 1 bit | Yellow Light Output |
| green  | 1 bit | Green Light Output  |

---

## Project Structure

```text id="5ywwl7"
Traffic_Light_Controller/
│
├── traffic_light.v      # Traffic Light Controller Design
├── traffic_light_tb.v   # Testbench
├── README.md            # Documentation
└── waveform.png         # Simulation Waveform
```

---

## Working Principle

### Reset Condition

When reset is asserted:

```verilog id="f39fzz"
reset = 1
```

The controller initializes to:

```text id="pd0nq0"
State = RED
Counter = 0
```

---

### State Transitions

#### RED State

```text id="8vk79m"
RED → GREEN
```

Transition occurs after:

```text id="g9b2m2"
5 clock cycles
```

---

#### GREEN State

```text id="qmpmyk"
GREEN → YELLOW
```

Transition occurs after:

```text id="g9e9ah"
5 clock cycles
```

---

#### YELLOW State

```text id="z8djlwm"
YELLOW → RED
```

Transition occurs after:

```text id="8h9i0i"
2 clock cycles
```

---

## Output Behavior

| State  | Red | Yellow | Green |
| ------ | --- | ------ | ----- |
| RED    | 1   | 0      | 0     |
| GREEN  | 0   | 0      | 1     |
| YELLOW | 0   | 1      | 0     |

---

## Testbench Description

The testbench performs the following operations:

1. Generates a clock signal with 10 ns period.
2. Applies reset for 20 ns.
3. Releases reset.
4. Allows the controller to cycle through multiple traffic light states.
5. Terminates simulation after 300 ns.

Clock generation:

```verilog id="t1rsgl"
always #5 clk = ~clk;
```

---

## Expected State Sequence

```text id="nq6q1i"
RED
 ↓
GREEN
 ↓
YELLOW
 ↓
RED
 ↓
GREEN
 ↓
YELLOW
 ...
```

---

## Simulation Results

The waveform should show:

* Red light active for 5 clock cycles
* Green light active for 5 clock cycles
* Yellow light active for 2 clock cycles
* Continuous repetition of the traffic light sequence

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Vivado Simulator

---

## Concepts Demonstrated

* Finite State Machines (FSM)
* Sequential Logic Design
* State Encoding
* State Transition Logic
* Combinational Output Logic
* Counters
* Testbench Development
* Digital System Verification

---

## Future Improvements

* Four-way traffic intersection control
* Pedestrian crossing support
* Emergency vehicle priority system
* Traffic density-based adaptive timing
* FPGA implementation
* Parameterized timing control

---

## Author

Sreeram Krishna

B.Tech Electronics and Communication Engineering (ECE)
