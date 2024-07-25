# FPGA_UDEC_MCF
FPGA project for the control system of the Muliticore fiber interferometer. FPGA prepares a set of voltages to drive phase fiber modulators, and aquires counts from 4 detectors. This project is meant to work along a GUI written in C#.
## GUI
C# project and FINAL Graphical User  Interface (GUI), located in `FINAL\driver_PM_software.exe`
- Click on Conexion and select the FPGA COM port. Set this port settings in your host computer, go to `Device Manager` and set baudrate to 115200 bauds.
- `Modo medicion` Establish what kind of measurement FPGA is doing
    0. Set Voltages to PM to V0_i all times
    1. During phase compensation (from FPGA1) Sets the voltages to V0_i, and then during measurement to V1,V2,V3,V4
    2. Creates a ramp voltage for phase caracterization
    3. Set Voltages to PM to V1,V2,V3,V4 all times
    4. Instant Tomography. During phase compensation (from FPGA1) Sets the voltages to V0_i, and then during measurement Measures first MUB2, then MUB3, ..., MUB5 and repeat
- `EnablePM_i` enables the voltage to control the PMs
- `PM stabilization` is the wait time since the control signal to the implementation of the measurement
- `Dead time APD` 1 = 10 ns
- `Numero de muestras` number of experiments to be recorded in a single txt file
- `V_i` Sets the voltages for modes 1,2,3
- `Caracterization PM_i` Sets the voltages for the PMs to prepare 0,pi/2,pi,3pi/2, to be implemented in Instant tomography
- `APD_i` Sets theoretical probabilities in the plots and to calculate fidelity
- `States` Fixes `APD_i` to predefined values for an old experiment (we can modifiy them, no problem)
- `MUBs` if you are working in `Modo medicion = 3` then you can easily select a MUB to Measure by clicking any button here. You will see `V_i` changing depending on this button and the values on `Caracterization PM_i` 
- `Dark counts` substract dark counts per measurement by controlling this 
- `Decoy state` The idea is using the FPGA output voltage `PM4` (currently not used) to control and Intesity Fiber Modulator. With the proper calibration You can select the Decoy intensity with `V Decoy`, Vaccum with `V Vaccum` and Signal with `V Signal`. The number of pulses are controlled by `N xxx` 

## FPGA
- FPGA2_measurement contains the Vivado project in `\FPGA\FPGA2_measurement\`, 
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