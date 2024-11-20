# README for Coursework on Numerical Methods in Engineering Mathematics 2

## Introduction

This coursework is part of the ENGI 2211 module and focuses on implementing and analyzing numerical methods for solving ODEs and PDEs. The tasks involve developing MATLAB codes for Gauss-Legendre quadrature rules, composite trapezoidal rules, and hyperbolic problems. Additionally, analytical and numerical solutions for hyperbolic PDEs are computed and compared.

---

## Files Overview

### 1. **gauss.m**
   - Implements Gauss-Legendre quadrature rules.
   - **Input:**
     - `rule` - The rule to use (1, 2, or 3).
     - `f` - Function handle to integrate.
   - **Output:**
     - `S` - Result of the quadrature.

### 2. **double_trap_rule.m**
   - Computes double integrals using the composite trapezoidal rule.
   - **Input:**
     - `f` - Function handle for integration.
     - `x` - Interval for `x`.
     - `n` - Panels in `x` direction.
     - `y` - Interval for `y`.
     - `m` - Panels in `y` direction.
   - **Output:**
     - `S` - Result of the integral.

### 3. **hyperbolic_analytical.m**
   - Computes the analytical solution for a hyperbolic PDE using separation of variables.
   - **Input:**
     - `x`, `t` - Position and time.
     - `L`, `c` - Domain length and wave speed.
     - `A`, `B` - Coefficients for initial conditions.
   - **Output:**
     - `u` - Value of the solution.

### 4. **fdhyperbolic_neumann.m**
   - Implements the finite difference method for solving hyperbolic PDEs with Neumann boundary conditions.
   - **Input:**
     - `a, b` - Extrema of the spatial domain.
     - `n` - Number of subintervals in space.
     - `T` - Final time.
     - `m` - Number of time steps.
     - `c` - Coefficient in the PDE.
     - `f, g` - Function handles for initial conditions.
   - **Output:**
     - `x`, `t` - Spatial and temporal nodes.
     - `u` - Solution values at the nodes.

---

## How to Run the Code

### 1. **Table 6: Numerical Solution**
   - Use **fdhyperbolic_neumann.m** to compute the solution.
   - **Parameters:**
     - `L = 1`, `c = 2`, `T = 0.5`
     - `A = [1, 2, 3]`, `B = [-1, 0, 2, -1]`
   - Example MATLAB command:
     ```matlab
     f = @(x) (sin(pi*x) + sin(2*pi*x));
     g = @(x) (0*x);
     [x, t, u] = fdhyperbolic_neumann(0, 1, 100, 0.5, 200, 2, f, g);
     ```

### 2. **Table 8: Solution and Error**
   - Compare results of **fdhyperbolic_neumann.m** and **hyperbolic_analytical.m**.
   - **Parameters:**
     - `a = 0`, `b = 1`, `n = 1000`, `m = 1000`
     - `c = 2`, `T = 0.5`
     - `f(x) = sin((π/2)x)`, `g(x) = (2π/2)sin((π/2)x)`
   - Example MATLAB command:
     ```matlab
     A = [1, 2, 3];
     B = [-1, 0, 2, -1];
     uref = hyperbolic_analytical(0.5, 0.1, 1, 2, A, B);
     ```

---

## Notes for Submission
- Ensure **code files are error-free** and well-commented.
- Follow the naming convention for submission: `SURNAME-Firstname_ENGI2211_NM.zip`.
- Report must not exceed 5 A4 pages, including tables.
- Numerical results should be rounded to **3 significant figures**.

---

## Acknowledgments
Any use of generative AI must be acknowledged, as per module guidelines. Include a section in your report for this purpose.

For additional details, refer to the coursework brief provided.
