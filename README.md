# Lava-Walls
An Embedded Systems game I made in Verilog.This was a team effort and we got this game to work great and the professor chose it to showcase Verilogs abilities. 

<br>
Unfortunately I have removed all Verilog Compilers at this moment and can only give my best advice not knowing if this will work:<br><br>
Before getting started with actual examples, here are a few notes on conventions. First, command lines and sequences take the same arguments on all supported operating environments, including Linux, Windows and the various Unix systems. When an example command is shown in a figure, the generic prompt character "% " takes the place of whatever prompt string is appropriate for your system. Under Windows, the commands are invoked in a command window. 
<br>
Go to the path of the .v file (the file here is named lavawalls.v) and enter:
% iverilog -o Lava-Walls lavawalls.v <br>
The results of this compile are placed into the file "Lava-Walls", because the "-o" flag tells the compiler where to place the compiled result. Next, execute the compiled program like so: % vvp Lava-Walls<br>
