Description
This project numerically solves the 2D lid-driven cavity flow using the artificial compressibility method. The code computes the unsteady, incompressible Navier–Stokes equations on a unit square domain in MATLAB. All major physical mechanisms—advection, diffusion, and pressure correction—are handled using explicit finite difference schemes.

Problem Setup
Domain: Square cavity (
1
×
1
1×1)

Objective: Simulate the velocity and pressure fields driven by a moving top lid

Top Wall: Moves right at 
u
=
1
u=1, 
v
=
0
v=0

Other Walls: Stationary, no-slip (
u
=
v
=
0
u=v=0)

Flow Regime: Low Reynolds number (default 
R
e
=
1
Re=1), laminar, incompressible

Algorithm Overview
Numerical Method: Finite difference discretization with artificial compressibility (Chorin's method)

Solution Loop: Time-marching iteration until divergence residual falls below the specified tolerance

Major Steps:

Initialize velocity and pressure fields

Update u and v velocities with advection, diffusion, and pressure gradient terms

Correct pressure using artificial compressibility

Apply boundary conditions after each step

Check for convergence using divergence (mass conservation)

Visualization: Contour plots for pressure, u, and v fields at selected time steps

Boundary Conditions
Top Wall (Lid): 
u
=
1
,
v
=
0
u=1,v=0 (drives the flow)

Bottom, Left, Right Walls: 
u
=
0
,
v
=
0
u=0,v=0 (no-slip)
