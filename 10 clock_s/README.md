# clock_s<br />
Created : 2021-05-11 <br />
Author : Rongye<br />
Description : Designing a Second timer<br />
1. The clk frequency is 32.768KHz.
2. rst_n is an asynchronous reset input.
3. start is the start signal, a positive pulse of a clk clock cycle, synchronized with clk. alarm[7:0] is the configuration information, in seconds, synchronized with clk.
4. Working mode: After receiving start, the seconds counter sec_cnt counts in seconds from zero. When the count reaches the value specified by alarm[7:0], a positive pulse of one clock cycle is generated, and the seconds counter returns to zero. Stop. <br />
**.zip is the vivado project.**
