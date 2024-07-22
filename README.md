# FPGA_UDEC_MCF
FPGA project for the control system of the Muliticore fiber interferometer. FPGA prepares a set of voltages to drive phase fiber modulators, and aquires counts from 4 detectors. This project is meant to work along a GUI written in C#.
## GUI
- C# project and final .exe file, located in FINAL\driver_PM_software.exe
## FPGA
- FPGA2_measurement contains the Vivado project, 
    - Final bitstream is located in `\FPGA\FPGA2_measurement\nexysA7_driver_PM.runs\impl_1\*.bit`. 
    - You can upload this file into the FPGA using Vivado. Left bottom menu, PROGRAM AND DEBUG, Open Hardware, Auto connect, Program FPGA (with the .bit file)
- `srcs` contains all verilog files, please keep this updated


### How to use this repo?
- Create a GitHub account
- Download Github desktop
- CLONE the repository (ask me for access since it is a private repo)
    - If you want to use this files and not modify them CLONE this repository in the MAIN branch. 
    - If you want to modify it create a new branch and have fun
- Now all the files are in the folder where you cloned the repo.
- If you want to make permanet changes to the MAIN branch, make a commit, but ask me first
- GitHub is not meant to store experiment data, but code, keep this repo as clean as possible.