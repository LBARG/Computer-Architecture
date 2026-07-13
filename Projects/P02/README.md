# 2-bit Arithmetic Logic Unit (ALU) in VHDL

## Description

This project implements a **2-bit Arithmetic Logic Unit (ALU)** using VHDL. The ALU performs both arithmetic and logical operations on two 2-bit operands and demonstrates the implementation of combinational digital logic using the IEEE `numeric_std` library.

The operation executed by the ALU is selected through a 3-bit control signal (`Z`), while the carry input (`C0`) modifies the behavior of several arithmetic operations.

This project was developed as part of a **Computer Architecture** laboratory.

---

## Features

- 2-bit operands (`A` and `B`)
- 3-bit operation selector (`Z`)
- Carry/Borrow input (`C0`)
- 3-bit result output (`R`)
- Carry-out output (`Cout`)
- Fully combinational design
- Synthesizable on FPGA devices
- Uses the IEEE `numeric_std` library

---

## Inputs

| Signal | Width | Description |
|---------|:-----:|-------------|
| `A` | 2 bits | First operand |
| `B` | 2 bits | Second operand |
| `Z` | 3 bits | Operation selector |
| `C0` | 1 bit | Carry/Borrow input |

---

## Outputs

| Signal | Width | Description |
|---------|:-----:|-------------|
| `R` | 3 bits | Result of the selected operation |
| `Cout` | 1 bit | Carry-out (Most Significant Bit of the result) |

---

## Supported Operations

| `Z` | Operation | Description |
|:---:|-----------|-------------|
| `000` | **A OR B** | Bitwise OR |
| `001` | **A XOR B** | Bitwise XOR |
| `010` | **A AND B** | Bitwise AND |
| `011` | **NOT A** | Bitwise complement of A |
| `100` | **A / A + 1** | If `C0 = 0` → Output A<br>If `C0 = 1` → Output A + 1 |
| `101` | **A + B (+C0)** | Addition with optional carry input |
| `110` | **A − B (Borrow)** | If `C0 = 1` → A − B<br>If `C0 = 0` → A − B − 1 |
| `111` | **A − 1 / A** | If `C0 = 0` → A − 1<br>If `C0 = 1` → Output A |

---

## Internal Architecture

The ALU converts the input operands from `std_logic_vector` to `unsigned` in order to perform arithmetic operations using the IEEE `numeric_std` package.

The architecture includes:

- Input conversion
- Combinational process
- Operation decoder (`case` statement)
- Arithmetic and logical computation
- Carry-out generation

---

## Functional Description

### Logical Operations

The ALU supports four logical operations:

- OR
- XOR
- AND
- NOT

For these operations, the upper bit of the 3-bit output remains **0**.

### Arithmetic Operations

The ALU also supports:

- Pass-through
- Increment
- Addition
- Addition with carry
- Subtraction
- Subtraction with borrow
- Decrement

The carry input (`C0`) determines the exact behavior of several arithmetic instructions.

---

## Carry Output

The carry output is generated from the most significant bit of the internal result:

```vhdl
Cout <= RESULT(2);
```

Depending on the selected operation, this bit represents:

- Carry generated during addition.
- Borrow indication during subtraction (unsigned arithmetic).

---

## Design Characteristics

- Combinational circuit
- No clock required
- No registers
- No sequential logic
- FPGA synthesizable
- IEEE Standard VHDL (`numeric_std`)

---

## Project Structure

```
.
├── Practica2.vhd
└── README.md
```

---

## Example

### Inputs

| Signal | Value |
|--------|-------|
| A | `10` |
| B | `01` |
| Z | `101` |
| C0 | `1` |

Selected operation:

```
A + B + C0
```

Calculation:

```
2 + 1 + 1 = 4
```

Output:

| Signal | Value |
|--------|-------|
| R | `100` |
| Cout | `1` |

---

## Learning Objectives

This project demonstrates:

- Design of a simple Arithmetic Logic Unit (ALU)
- Combinational digital circuit design
- Arithmetic operations using `numeric_std`
- Binary addition and subtraction
- Carry and borrow generation
- Operation selection using a `case` statement
- FPGA-oriented VHDL design practices

---

## Requirements

- Intel Quartus Prime
- ModelSim or QuestaSim (optional for simulation)
- VHDL-2008 compatible compiler

---

## Author

**Luis Ambrosi**

Computer Systems Engineering

---

## Copyright

Copyright © 2026 Luis Ambrosi. All rights reserved.

This repository and its contents are protected under applicable copyright laws. No permission is granted to copy, modify, redistribute, or use this work, in whole or in part, without the express written permission of the copyright holder.
