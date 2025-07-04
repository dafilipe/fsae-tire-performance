# 📄 README — Tire Data Analysis in Octave

## 🏎️ Formula Student — Tire Dynamics
This code allows you to **load, filter, and visualize tire force curves** based on `.dat` files from the **FSAE Tire Test Consortium – Round 9**, tested at **Calspan Tire Research Facility**.

## 📁 Expected Data Format
Data files should be in **ASCII format with SI units**, for example:  
```
B2356runXX.dat
```

Each file contains columns representing:  
`SA`, `FY`, `FZ`, `P`, `IA`, `V`, `MZ`, `FX`, and others.

## ✅ Main Features
- 📂 Load raw Calspan test data  
- 🔎 Filter by slip angle (SA), vertical load (FZ), speed (V), pressure (P), camber (IA)  
- 📈 Plot force and moment curves:
  - FY vs SA
  - MZ vs SA
  - FX vs FZ  
- 📊 Support for multiple curves per load or pressure

## ⚙️ Requirements
- GNU Octave (recommended ≥ v6.2)
- `signal` package (optional, for `movavg` smoothing)
```octave
pkg install -forge signal
pkg load signal
```

## 📝 Notes
- All data follows **SAE sign conventions** 
- For deeper analysis, consider:
  - Tire temperature channels (TSTC, TSTI, TSTO)
  - Camber and pressure levels

## 👤 Author
**Diogo** — Formula Student tire analysis project on the  
**Hoosier 20.5×7.0-13 R20 tire on a 7.0" rim**,  
based on *Race Car Vehicle Dynamics* (Milliken & Milliken).
