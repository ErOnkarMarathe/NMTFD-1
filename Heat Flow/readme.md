# 2D Heat Equation – Finite Difference (MATLAB)

## Overview
This project numerically solves the 2D steady-state heat conduction equation in MATLAB using finite difference methods.

## Problem Setup
- Simulates steady-state temperature distribution in a square 2D plate.
- Implements constant or prescribed boundary conditions on all edges.
- Appropriate for demonstrating classical numerical simulation of heat flow.

## Method Summary
- Uses the finite difference method to discretize Laplace’s equation (\( \nabla^2 T = 0 \)).
- Each interior grid point’s temperature is updated based on neighbor values.
- Iterative solution continues until specified convergence tolerance is reached.

## Boundary Conditions
- Dirichlet (fixed temperature) or Neumann (fixed flux) conditions may be set on each edge as defined in inputs.
- Standard configuration: known \(T\) on all or some sides; other conditions can be specified in the code.

## Parameters
- Grid size (number of nodes in x and y)
- Plate length (physical dimensions)
- Boundary temperatures/fluxes (as set in the script)
- Convergence tolerance (stopping criterion)

---
**For full problem description, numerical method details, results, and plots, see the report [`Group10_Report_Practical_1.pdf`](Group10_Report_Practical_1.pdf) included in this folder.**
