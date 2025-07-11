# 🏁 Tire Data Analysis – Formula Student (GNU Octave)

## 📌 Project Overview

This project focuses on the analysis of experimental tire data from the **FSAE Tire Test Consortium (Round 9)**, tested at the **Calspan Tire Research Facility**, with application to vehicle dynamics in **Formula Student**.  
It targets specifically the **Hoosier 20.5×7.0-13 R20** tire mounted on a **7.0" rim**, using `.dat` files in **TIRF format**.

The goal is to generate and interpret key force/moment curves using custom Octave scripts.

---

## 📂 Supported Data Format

- File format: `.dat` (ASCII, SI units)  
- File naming: `B2356runXX.dat`  
- Typical columns include:  
  - `SA` – Slip Angle  
  - `FY` – Lateral Force  
  - `FZ` – Vertical Load  
  - `FX` – Longitudinal Force  
  - `MZ` – Self-Aligning Moment  
  - `P` – Pressure  
  - `IA` – Camber  
  - `V` – Speed

---

## ✅ Main Features

- 🧠 Modular Octave scripts (read, filter, process, plot)
- 🔍 Filter by:
  - Tire name and rim
  - Slip angle (SA)
  - Vertical load (FZ)
  - Test type (Cornering / DriveBrake)
- 📊 Generate tire performance curves:
  - **FY vs SA** (Lateral Force vs Slip Angle)
  - **MZ vs SA** (Aligning Moment vs Slip Angle)
  - **FX vs FZ** (Longitudinal Force vs Vertical Load)
- 🧮 Polynomial fitting for data smoothing
- ⚡ Optimized for performance with large datasets

---

## ▶️ How to Use

1. **Place the `.m` script files** in the same folder as the `.dat` tire files.  
2. Open **GNU Octave** and set the current directory to the working folder:
   ```octave
   cd path/to/your/folder
