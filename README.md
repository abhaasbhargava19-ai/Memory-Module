# Memory Module

A collection of synthesizable memory designs implemented in Verilog, covering the core building blocks used in digital systems: single port RAM, dual port RAM, and ROM. Each module is simulated and verified using Icarus Verilog and GTKWave, with waveform driven testbenches demonstrating correct synchronous read/write behavior.

## Components

### [Single_Port_RAM](./Single_Port_Ram/README(Single_Port_Ram).md)
A single read/write port synchronous RAM. Supports one address bus shared between read and write operations, gated by write-enable.

### [Dual_Port_RAM](./Dual_Port_Ram/README(Dual_Port_Ram).md)
A true dual port RAM supporting simultaneous independent read/write access via two separate address/data ports. Includes debugging around access-hazard scenarios (e.g. simultaneous read/write to the same address).

### [ROM](./Sync_Rom/README(Sync_Rom).md)
A synchronous, registered-output ROM. Demonstrates one-cycle read latency and race-condition-free testbench design by asserting inputs off the clock grid.

## Tools Used
- **Icarus Verilog** for simulation
- **GTKWave** for waveform analysis
- **VS Code** as development environment

## AUTHOR

Abhaas Bhargava
