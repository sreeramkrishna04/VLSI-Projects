# 4-Bit Up Counter

## Overview

This project implements a 4-bit synchronous up counter using Verilog HDL. The counter increments its value on every positive edge of the clock and resets to zero when the reset signal is asserted.

## Features

- 4-bit counter
- Positive-edge triggered clock
- Asynchronous reset
- Counts from 0 to 15
- Automatically rolls over from 15 to 0

## Design File

```text
counter.v
```

## Testbench File

```text
counter_tb.v
```

## Inputs

| Signal | Width | Description |
|----------|----------|----------|
| clk | 1 bit | Clock signal |
| rst | 1 bit | Reset signal |

## Outputs

| Signal | Width | Description |
|----------|----------|----------|
| count | 4 bits | Counter output |

## Counter Sequence

```text
0000
0001
0010
0011
0100
...
1110
1111
0000
```

## Verilog Concepts Used

- Module Declaration
- Registers
- Always Block
- Positive Edge Triggering
- Asynchronous Reset
- Non-Blocking Assignments

## Simulation

The testbench generates:

- Clock signal
- Reset pulse
- Counter operation verification

Expected waveform behavior:

1. Reset asserted
2. Counter becomes 0
3. Reset released
4. Counter increments every clock cycle

## Tools Used

- Verilog HDL
- Xilinx Vivado
- XSim Simulator

## Result

The 4-bit counter was successfully designed, simulated, and verified in Vivado. The output count increased correctly on each clock cycle and reset properly when the reset signal was asserted.