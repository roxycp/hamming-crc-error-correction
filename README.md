# Error Detection & Number Representation (Assembly x86 / C++)

Implementations of error-detecting/correcting codes and number representations, built for the
*Basics of Information Technology* course.

## Contents
| File | Description |
|---|---|
| `assembly/hamming16.asm` | Hamming code encoder on 16 bits, in 8086 assembly (team project): computes the parity bits p1, p2, p4, p8 with bitwise operations and builds the final code word |
| `cpp/hamming74.cpp` | Hamming (7,4): encodes 4 data bits, detects and corrects a single-bit error |
| `cpp/crc.cpp` | CRC encoding through binary polynomial division (XOR) |
| `cpp/fixed_point.cpp` | Fixed-point representation: sign-magnitude, one's complement, two's complement |
| `cpp/floating_point_ieee754.cpp` | IEEE 754 single-precision floating-point representation |

## Running
- C++: `g++ cpp/crc.cpp -o crc && ./crc`
- Assembly: assemble with TASM/MASM in DOSBox (`tasm hamming16.asm`, `tlink hamming16.obj`) and inspect `cod_final` in the debugger.
