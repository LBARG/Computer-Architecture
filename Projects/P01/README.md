# VHDL - Incremental Counter with Initial Load

## Description

This project implements a **5-bit incremental counter** in VHDL for FPGA devices.

The design allows the user to:

- Display an initial value using switches.
- Load the initial value on the first increment.
- Continue counting upward with each clock pulse.
- Reset the system at any time.
- Hold the display at zero after reset until the input switches change.

The implementation is intended for educational purposes in Digital Design and FPGA development.

---

## Features

- 5-bit counter
- Initial value loaded from switches
- Increment on each rising edge
- Manual reset
- Zero-hold mechanism after reset
- LED status indicator

---

## Inputs

| Signal | Width | Description |
|--------|------|-------------|
| `sw_cero` | 1 | Reset input |
| `sw_inc` | 1 | Increment pulse |
| `sw_datos` | 5 | Initial value |

---

## Outputs

| Signal | Width | Description |
|--------|------|-------------|
| `leds` | 6 | Counter output and status indicator |

The LEDs are assigned as follows:

- **LED[4:0]** → Current value
- **LED[5]**
  - `0` → Display mode
  - `1` → Increment mode

---

## Operation

### 1. Display Mode

After power-up (or after changing the switches), the LEDs display the value present on `sw_datos`.

Example:

```
sw_datos = 01010

LEDS = 001010
```

---

### 2. First Increment

The first rising edge on `sw_inc` loads:

```
Counter = sw_datos + 1
```

The mode indicator turns on.

---

### 3. Counting

Each additional pulse increments the counter.

```
Counter = Counter + 1
```

---

### 4. Reset

When `sw_cero` is asserted:

- Counter is cleared.
- LEDs display zero.
- The output remains at zero until the user changes `sw_datos`.

---

## State Diagram

```
Power On
    │
    ▼
Display sw_datos
    │
First Increment
    ▼
Counter = sw_datos + 1
    │
Next Pulses
    ▼
Counter++
    │
Reset
    ▼
Display 00000
```

---

## Project Structure

```
Practica1.vhd
README.md
```

---

## Requirements

- Intel Quartus Prime
- FPGA development board
- VHDL-93 compatible synthesizer

---

## Educational Objectives

This project demonstrates:

- Sequential logic
- Rising edge detection
- Internal registers
- State behavior
- Signal assignment
- Basic FPGA implementation
- LED output control

---

## Author

Luis Ambrosi

Copyright © 2026 Luis Ambrosi. All rights reserved.

This repository is provided for educational reference only.
No permission is granted to copy, redistribute, modify, or submit this work as your own without the author's explicit permission.
