# UART Transmitter and Receiver using Verilog HDL

## Overview

This project implements a basic Universal Asynchronous Receiver Transmitter (UART) system using Verilog HDL. The design consists of:

* UART Transmitter (TX)
* UART Receiver (RX)
* Top-Level Integration Module
* Verification Testbench

The transmitter serializes 8-bit parallel data and sends it through a serial communication line. The receiver captures the serial data and reconstructs the original 8-bit data.

---

## Features

* UART Transmitter FSM
* UART Receiver FSM
* 8-bit Data Transmission
* Start Bit Generation
* Stop Bit Generation
* Loopback Communication
* Self-checking Testbench
* Behavioral Simulation Support

---

## System Architecture

```text id="o8f2zc"
            +-----------+
            | UART TX   |
            +-----------+
                 |
                 | Serial Data Line
                 v
            +-----------+
            | UART RX   |
            +-----------+
                 |
                 v
              rx_data
```

---

## Module Description

### UART Transmitter (uart_tx)

The transmitter converts parallel data into serial data.

#### Inputs

| Signal   | Width | Description        |
| -------- | ----- | ------------------ |
| clk      | 1     | System Clock       |
| rst      | 1     | Active High Reset  |
| tx_start | 1     | Start Transmission |
| tx_data  | 8     | Data to Transmit   |

#### Outputs

| Signal  | Width | Description           |
| ------- | ----- | --------------------- |
| tx      | 1     | Serial Output         |
| tx_done | 1     | Transmission Complete |

---

### UART Receiver (uart_rx)

The receiver converts serial data back into parallel form.

#### Inputs

| Signal | Width | Description       |
| ------ | ----- | ----------------- |
| clk    | 1     | System Clock      |
| rst    | 1     | Active High Reset |
| rx     | 1     | Serial Input      |

#### Outputs

| Signal  | Width | Description        |
| ------- | ----- | ------------------ |
| rx_data | 8     | Received Data      |
| rx_done | 1     | Reception Complete |

---

### Top Module (uart_top)

Connects transmitter and receiver through an internal serial wire.

```text id="jlwmqv"
TX ---> serial_wire ---> RX
```

This creates a UART loopback system for verification.

---

## UART Frame Format

The implemented UART frame contains:

```text id="pd39o0"
+-----------+----------------+-----------+
| Start Bit | 8 Data Bits    | Stop Bit  |
+-----------+----------------+-----------+
|     0     |    D0 ... D7   |     1     |
+-----------+----------------+-----------+
```

Example transmission:

```text id="77cfz8"
Data = 8'hA5

Binary:
10100101
```

UART Frame:

```text id="9xh76e"
0 1 0 1 0 0 1 0 1 1
^                 ^
Start           Stop
```

---

## Transmitter FSM

### States

| State | Description       |
| ----- | ----------------- |
| IDLE  | Wait for tx_start |
| START | Send Start Bit    |
| DATA  | Send 8 Data Bits  |
| STOP  | Send Stop Bit     |

State Flow:

```text id="3i4mxw"
IDLE
  |
  v
START
  |
  v
DATA
  |
  v
STOP
  |
  v
IDLE
```

---

## Receiver FSM

### States

| State | Description         |
| ----- | ------------------- |
| IDLE  | Wait for Start Bit  |
| DATA  | Receive 8 Data Bits |
| STOP  | Receive Stop Bit    |

State Flow:

```text id="35u2t4"
IDLE
  |
  v
DATA
  |
  v
STOP
  |
  v
IDLE
```

---

## Testbench Verification

The testbench performs the following operations:

### Reset

```verilog id="0h1jyu"
rst = 1;
```

Initializes the UART system.

---

### Data Transmission

The testbench sends:

```verilog id="lq1l6z"
tx_data = 8'hA5;
tx_start = 1;
```

---

### Reception Verification

The received data is compared with the transmitted data:

```verilog id="w8a2rb"
if(rx_data == 8'hA5)
```

Expected result:

```text id="4oiz5e"
UART TEST PASS
```

---

## Expected Simulation Output

```text id="krxjlwm"
UART TEST PASS
```

---

## Project Structure

```text id="p4f7ng"
UART_Project/
│
├── uart_tx.v       # UART Transmitter
├── uart_rx.v       # UART Receiver
├── uart_top.v      # Top-Level Module
├── uart_tb.v       # Testbench
├── README.md       # Documentation
└── waveform.png    # Simulation Waveform
```

---

## Simulation Flow

```text id="40qprv"
Reset
   |
   v
Load Data (A5)
   |
   v
Transmit Serial Bits
   |
   v
Receive Serial Bits
   |
   v
Compare Data
   |
   v
PASS
```

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Vivado Simulator

---

## Concepts Demonstrated

* Finite State Machines (FSM)
* Serial Communication
* UART Protocol Basics
* Data Serialization
* Data Deserialization
* Module Integration
* Testbench Development
* Digital Design Verification

---

## Future Improvements

* Configurable Baud Rate Generator
* UART Parity Bit Support
* Multiple Stop Bit Support
* Framing Error Detection
* FIFO-based UART
* Full Duplex UART Communication
* FPGA Hardware Implementation

---

## Author

Sreeram Krishna

B.Tech Electronics and Communication Engineering (ECE)
