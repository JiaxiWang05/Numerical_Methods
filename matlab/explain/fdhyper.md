# Hyperbolic PDEs: Analytical vs. Numerical Solutions

This document explains two approaches to solving the hyperbolic partial differential equation (PDE):

\[
u_{tt}(x,t) = c^2 u_{xx}(x,t)
\]

### 1. `hyperbolic_analytical.m`: Analytical Solution Using Fourier Series

This function computes the **exact solution** to the hyperbolic PDE with the following boundary conditions:
- \( u(0,t) = 0 \)
- \( u(L,t) = 0 \)

The solution is given by a **Fourier series** of the form:

\[
u(x,t) = \sum_{n=1}^{\infty} \left[ A_n \cos(\lambda_n c t) + B_n \sin(\lambda_n c t) \right] \sin(\lambda_n x)
\]

where:
- \( \lambda_n = \frac{(2n+1)\pi}{2L} \) are the eigenvalues,
- \( A_n \) and \( B_n \) are the Fourier coefficients determined by the initial conditions \( u(x,0) = f(x) \) and \( u_t(x,0) = g(x) \),
- \( c \) is the wave speed,
- \( L \) is the length of the domain,
- \( x \) is the spatial coordinate,
- \( t \) is time.

#### Key Components:
1. **Eigenvalues \( \lambda_n \)**: 
   The eigenvalues are determined by the boundary conditions and are used to form the spatial part of the solution.

2. **Fourier Coefficients \( A_n \) and \( B_n \)**: 
   - \( u(x,0) = f(x) \) gives the coefficients \( A_n \).
   - \( u_t(x,0) = g(x) \) gives the coefficients \( B_n \).

3. **Time Evolution**: 
   The solution evolves over time through the cosine and sine terms.

4. **Series Summation**: 
   The solution is approximated by summing a finite number of terms of the Fourier series (usually up to \( N \) terms).

---

### 2. `fdhyperbolic.m`: Numerical Solution Using Finite Difference Method

This function implements the **finite difference method** (FDM) to solve the same PDE numerically. The PDE is discretized in both space and time, and the solution is computed iteratively.

#### Key Components:
1. **Grid Setup**:
   - **Spatial Grid**: The domain \( [a, b] \) is divided into \( n \) subintervals, creating a grid of \( n+1 \) spatial points. The step size is:
   
   \[
   h = \frac{b - a}{n}
   \]
   
   - **Time Grid**: The time interval \( [0, T] \) is divided into \( m \) steps, creating \( m+1 \) time points. The step size is:
   
   \[
   k = \frac{T}{m}
   \]

2. **Initial Conditions**:
   - \( u(x,0) = f(x) \) (initial displacement),
   - \( u_t(x,0) = g(x) \) (initial velocity).

   These initial conditions are applied to the solution grid at time \( t = 0 \):
   - \( u(2:n, 1) = f(x(2:n)) \),
   - The second time step is calculated as:

   \[
   u(2:n, 2) = (1 - r^2)f(x(2:n)) + k g(x(2:n)) + \frac{r^2}{2} \left( f(x(3:n+1)) + f(x(1:n-1)) \right)
   \]

3. **Finite Difference Scheme**:
   The solution is computed iteratively using the following update formula:

   \[
   u_i^{n+1} = (2 - 2r^2) u_i^n + r^2 (u_{i+1}^n + u_{i-1}^n) - u_i^{n-1}
   \]

   where:
   - \( i \) indexes space,
   - \( n \) indexes time,
   - \( r = \frac{c k}{h} \) is the **Courant-Friedrichs-Lewy (CFL) number**.

4. **Boundary Conditions**:
   The boundary conditions are enforced at both ends of the domain:
   - \( u(1, :) = 0 \) (at \( x = a \)),
   - \( u(n+1, :) = 0 \) (at \( x = b \)).

5. **Iterative Computation**:
   The function iterates over time steps, updating the solution matrix \( u \) at each time step based on the finite difference scheme.

---

### Relationship Between the Two Functions

- **Analytical vs. Numerical**: 
  - `hyperbolic_analytical.m` gives the exact solution using Fourier series.
  - `fdhyperbolic.m` provides a numerical approximation via finite differences.

- **Verification and Comparison**:
  - You can use the analytical solution to verify the accuracy of the numerical method by comparing the results visually or calculating the error.

- **Convergence and Error Analysis**:
  - By comparing the two methods, you can study the **convergence rates** of the numerical solution. The accuracy of the finite difference method depends on the grid resolution and time step.

- **Stability**:
  - The finite difference method is conditionally stable, requiring the CFL number \( r \leq 1 \) to ensure stability.
  
---

### Important Notes

- **Stability**: The finite difference method (`fdhyperbolic.m`) is conditionally stable. For stability, the **CFL condition** must be satisfied:
  
  \[
  r = \frac{c k}{h} \leq 1
  \]
  
  If \( r \) is too large, the solution may become unstable.

- **Fourier Coefficients**: The analytical method (`hyperbolic_analytical.m`) requires the calculation of Fourier coefficients \( A_n \) and \( B_n \), which are derived from the initial conditions \( f(x) \) and \( g(x) \).

- **Boundary and Initial Conditions**: 
  - The analytical method assumes known initial and boundary conditions that allow for Fourier series expansion.
  - The numerical method can handle more general initial conditions through arbitrary functions \( f(x) \) and \( g(x) \).

---

### Summary

- `hyperbolic_analytical.m` gives the **exact solution** using Fourier series, ideal for simpler problems where an analytical solution is possible.
- `fdhyperbolic.m` provides a **numerical approximation** using finite differences, suitable for more complex problems where an analytical solution is not available.
- Both methods can be used together to verify the accuracy of the numerical solution and analyze convergence and errors.
