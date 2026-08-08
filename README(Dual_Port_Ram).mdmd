## Dual Port Ram

Dual-port RAM is a type of computer memory that lets two independent devices or systems access the same memory location at the same time. Along with the code a self verifying testbench has also been set up

## Architecture 

<img width="600" height="600" alt="Screenshot 2026-08-08 000514" src="https://github.com/user-attachments/assets/435298fb-b872-4844-b10c-bea2916e2d9a" />


 ## Testbench Same Address Write Collision

 Testbench initializes addr_a and addr_b to the same location (6'h01) with both ports writing different data (din_a=33, din_b=44) on the same clock edge. ( see code)

 <img width="451" height="907" alt="collision code" src="https://github.com/user-attachments/assets/f0e471b8-cb8c-4a13-a25d-1a86a535e06d" />



So result becomes simulator dependent. Icarus resolved it with port B's write overwriting port A's in the NBA update queue, so mem[1] ends up holding 44, not 33. which is also reflected on the waveform obtained.


<img width="1237" height="396" alt="collision waveform " src="https://github.com/user-attachments/assets/e5993f56-f8bc-4b25-8d98-30cae81736a3" />
Collision Waveform


## Fix

I merged the two separate always blocks into a single block with an added condition: if both ports write to the same address, port A wins and B's write is suppressed, so the memory stores whatever A wrote. (Testbench kept unchanged ,the corrected behavior is reflected in the waveform below.)  


<img width="1112" height="382" alt="image" src="https://github.com/user-attachments/assets/f9baec08-f88f-44bf-a4e7-28f3f6acd779" />
Corrected Waveform


