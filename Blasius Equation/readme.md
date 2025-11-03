# 2D Boundary Layer Over Flat Plate – Finite Difference (MATLAB)

## Overview
This project solves the 2D laminar boundary layer over a flat plate using finite difference methods in MATLAB.

## Problem Setup
- Simulates incompressible flow over a flat plate.
- Uses dimensionless variables for velocity and length.
- Solves for streamwise (\(u\)) and wall-normal (\(v\)) velocity profiles.

## Method Summary
- Discretizes the governing equations using forward, central, and backward differences.
- Marches solution downstream (in \(x\)), solving for the velocity field at each location.
- Supports grid sensitivity analysis and comparison to the Blasius analytical solution.

## Boundary Conditions
- At \(y = 0\): \(u = v = 0\) (no-slip)
- At \(y \to \infty\): \(u = 1\) (free stream)
- At \(x = 0\): \(u = 1\) except at the wall, where \(u = 0\)

## Parameters
All numerical and physical parameters (domain size, grid spacing) can be set at the top of the script for easy adjustment.

---

**For full details on formulation, numerical implementation, results, and validation, see the [Group_10_Report_Task_2.pdf](Group_10_Report_Task_2.pdf) report included in this folder.**
