# 2D Lid-Driven Cavity Flow – Artificial Compressibility (MATLAB)

## Overview
This project numerically solves the 2D lid-driven cavity flow using the artificial compressibility method.  
The code simulates unsteady, incompressible Navier–Stokes equations on a unit square in MATLAB.

## Problem Setup
- **Domain:** Square cavity (1 × 1)
- **Top Wall:** Moves right at \( u = 1, v = 0 \)
- **Other Walls:** Stationary, no-slip (\( u = v = 0 \))
- **Flow Regime:** Low Reynolds number (default \( Re = 1 \)), laminar, incompressible

## Method Summary
- **Numerical Scheme:** Explicit finite differences; Chorin’s artificial compressibility
- **Algorithm:** Iterative time-marching, updating velocity and pressure fields until divergence residual meets a target tolerance
- **Visualization:** MATLAB contour plots for velocity and pressure fields

## Boundary Conditions
- **Top (lid):** \( u = 1, v = 0 \)
- **Bottom, Left, Right:** \( u = 0, v = 0 \) (no-slip)

## Parameters
All numerical and physical parameters are defined at the top of the main MATLAB script for easy modification.

---

**Full methodology, detailed results, validation, and discussion are provided in [`Group_10_Report_Task_3.pdf`](Group_10_Report_Task_3.pdf). Please see the report for all technical details.**
