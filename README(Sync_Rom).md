## SYNCHRONOUS ROM 

As the name suggests it only performs read function. Address is fed from CPU but data travels from memory to CPU. Being Synchronous ROM its read operation executes at an active clock edge only holding value stable like a register until next clock edge.


## ARCHITECTURE 

<img width="561" height="339" alt="Screenshot 2026-08-08 233011" src="https://github.com/user-attachments/assets/a25bf2a6-cb53-4f9f-93ac-98bbee0007b9" />

## Synchronous Latency

Deliberately address is sampled at 2 second after an active edge so that it creates a mechanism for the memory to be actually synthesizable and testbench holds under real condition. It achieved 2 major goals -:  
1. Eliminated the Race Condition:  Inputs (addr, en) settle well before the clock edge arrives, giving the simulator unambiguous data to sample.
2. Cycle Latency: The waveform shows address/enable arriving mid cycle and being sampled on the next active clock edge, with valid data appearing on the following edge confirming one clock cycle of registered read latency.

<img width="986" height="410" alt="Screenshot 2026-08-09 001853" src="https://github.com/user-attachments/assets/95e8814e-d4dc-422f-b559-217874d7b848" />

Obtained Waveform
