# Parameterized PWM (Pulse Width Modulation) Generator in Verilog

## 📌 Overview
This project implements a **parameterized PWM generator** in Verilog.  
The design produces a digital square wave with a configurable **frequency** and **duty cycle** using standard FPGA logic.

A PWM signal is used to create an *average analog-like voltage* by rapidly switching a digital output between HIGH and LOW.  
Applications include:
- LED dimming
- DC motor speed control
- Audio signal generation
- Power regulation

---

## ⚡ Features
- **Parameterized counter width** to set PWM frequency.
- **Adjustable duty cycle** through a duty register or parameter.
- **Synthesizable** on FPGA hardware.
- **Comprehensive testbench** for functional verification.

---

## 🔧 How It Works
1. A counter increments each clock cycle until it reaches the configured **period value** (defining the output frequency).
2. The PWM output is driven **HIGH** while the counter is less than the **duty cycle threshold**, and **LOW** otherwise.
3. Changing the duty threshold changes the percentage of time the output stays HIGH, controlling the signal’s average voltage.

---

## 🗂 Repository Structure
rtl/ – Verilog source files (pwm.v)
tb/ – Testbench files (pwm_tb.v)
sim/ – Simulation outputs (ignored in .gitignore)
docs/ – Documentation and waveform screenshots


---

## 🛠️ Simulation
- Tested using **ModelSim / Questa**.
- Includes a self-checking testbench that sweeps duty cycle values and captures waveforms.

---

## 📜 License
This project is licensed under the [MIT License](LICENSE).
