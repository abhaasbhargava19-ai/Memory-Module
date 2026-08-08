## SINGLE PORT RAM

This module implements a Single Port RAM  modeled in Verilog with a self checking Testbench . I have focused on keeping the RTL clean and timing diagram matches with expectations of how a real SRAM memory would behave.

## Architecture 

<img width="537" height="451" alt="Singleportram" src="https://github.com/user-attachments/assets/9a589500-3332-4c38-86e7-a10dc8f4732b" />

## Testbench Race Condition

Waveform showed addr and addr_reg changing in the same cycle — meaning addr_reg appeared to track addr instantly, with no latency at all. That didn't match the RTL, which clearly registers addr on posedge clk. 

Root Cause -: testbench was changing stimulus (addr, data, wr) at exactly the same simulation time as the clock's rising edge. This created a race between the testbench assignment and the DUT's always @(posedge clk) block 

<img width="1046" height="558" alt="waveform  before correction" src="https://github.com/user-attachments/assets/1df1e39d-80f2-4440-926c-8fd4a2be73fd" />


In the above waveform  addr and addr_reg change on the exact same clock edge, with no visible one-cycle offset.

## FIX 

Changed the stimulus delay from #10 to #12 so addr becomes stable well before each posedge arrives. By the time addr_reg <= addr fires, there's zero ambiguity about which value it captures that is no race.

<img width="1046" height="558" alt="final waveform" src="https://github.com/user-attachments/assets/c708df8e-a8b9-4a35-934a-49ae2b32e77d" />

Serves a reminder that design can be functionally correct while the testbench's timing can misrepresent the behavior in simulation





