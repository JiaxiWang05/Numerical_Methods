Sure! Let's go through both functions in detail and understand their role in solving the same hyperbolic partial differential equation (PDE) in different ways—one analytically using Fourier series (`hyperbolic_analytical.m`) and the other numerically using the finite difference method (`fdhyperbolic.m`).

---

### 1. **`hyperbolic_analytical.m`**: Analytical Solution Using Fourier Series

This function computes the exact solution to the hyperbolic PDE:

\[
u_{tt}(x,t) = c^2 u_{xx}(x,t)
\]

with boundary conditions:

- \( u(0,t) = 0 \) (at the left end),
- \( u(L,t) = 0 \) (at the right end),

which represents a vibrating string with fixed ends (a typical wave equation scenario). The exact solution is derived using **separation of variables** and **Fourier series**.

#### Key Components:

1. **Eigenvalues \( \lambda_n \)**:
   The general solution to the wave equation with fixed boundary conditions at \( x = 0 \) and \( x = L \) is a Fourier series. The spatial part of the solution involves the eigenvalues \( \lambda_n \), which are determined by the boundary conditions:
   
   \[
   \lambda_n = \frac{(2n+1)\pi}{2L}
   \]
   
   These are the "modes" or eigenfrequencies of the system, which come from solving the spatial equation using separation of variables.

2. **Fourier Coefficients \( A_n \) and \( B_n \)**:
   The Fourier series representation of the solution is:
   
   \[
   u(x,t) = \sum_{n=1}^{\infty} \left[ A_n \cos(\lambda_n c t) + B_n \sin(\lambda_n c t) \right] \sin(\lambda_n x)
   \]
   
   The coefficients \( A_n \) and \( B_n \) depend on the initial conditions:
   - \( u(x,0) = f(x) \) gives the \( A_n \)'s.
   - \( u_t(x,0) = g(x) \) gives the \( B_n \)'s.

   These coefficients are calculated using **Fourier transforms** of the initial conditions \( f(x) \) and \( g(x) \).

3. **Series Summation**:
   The solution is represented as an infinite sum, but in practice, we sum only a finite number of terms (say, the first \( N \) terms). This gives an approximate solution, and the accuracy improves as \( N \) increases.

4. **Time Evolution**:
   The solution involves trigonometric functions in both space (via \( \sin(\lambda_n x) \)) and time (via \( \cos(\lambda_n c t) \) and \( \sin(\lambda_n c t) \)).

---

### 2. **`fdhyperbolic.m`**: Numerical Solution Using Finite Difference Method

This function implements the **finite difference method** (FDM) to solve the same hyperbolic PDE numerically. The PDE is solved using a discretization of the space and time domains, followed by an iterative computation at each time step.

#### Key Components:

1. **Grid Setup**:
   - **Spatial Grid**: The domain \( [a, b] \) is divided into \( n \) subintervals, creating a grid of \( n+1 \) spatial points. The step size is \( h = \frac{b - a}{n} \).
   - **Time Grid**: The time interval \( [0, T] \) is divided into \( m \) steps, creating \( m+1 \) time points. The step size is \( k = \frac{T}{m} \).

2. **Initial Conditions**:
   - \( u(x,0) = f(x) \): This specifies the initial displacement of the wave.
   - \( u_t(x,0) = g(x) \): This specifies the initial velocity of the wave.
   
   The function assigns these initial conditions to the solution grid:
   - \( u(2:n, 1) = f(x(2:n)) \): Initial displacement.
   - The second time step is calculated using a combination of \( f(x) \) and \( g(x) \), and it’s stored in \( u(2:n, 2) \).

3. **Finite Difference Scheme** (Numerical Method):
   - The key update formula for the finite difference method is:

     \[
     u_i^{n+1} = (2 - 2r^2) u_i^n + r^2 (u_{i+1}^n + u_{i-1}^n) - u_i^{n-1}
     \]
     
     where:
     - \( i \) indexes space,
     - \( n \) indexes time,
     - \( r = \frac{c k}{h} \) is the **Courant-Friedrichs-Lewy (CFL) number**, a parameter that affects the stability of the method.

   This formula computes the value of \( u(x,t) \) at the next time step \( t_{n+1} \) by using the values at the previous two time steps (\( t_n \) and \( t_{n-1} \)) and the neighboring spatial points.

4. **Boundary Conditions**:
   The boundary conditions \( u(a,t) = 0 \) and \( u(b,t) = 0 \) are directly applied:
   - \( u(1, :) = 0 \) (at \( x = a \)),
   - \( u(n+1, :) = 0 \) (at \( x = b \)).

5. **Iterative Computation**:
   The function then iterates over time steps and updates the solution matrix `u` at each time step based on the finite difference formula.

---

### Relationship Between the Two Functions:

- **Analytical vs. Numerical**: 
  - `hyperbolic_analytical.m` computes the exact solution to the wave equation using Fourier series. It assumes the solution can be expressed in terms of an infinite sum, and it leverages the known boundary and initial conditions to calculate the Fourier coefficients.
  - `fdhyperbolic.m` provides a numerical approximation by discretizing both space and time and iterating step by step to compute the solution.

- **Verification and Comparison**:
  - You can use the **analytical solution** from `hyperbolic_analytical.m` to verify the accuracy of the numerical solution from `fdhyperbolic.m`. If you plot both solutions, you should see that as the number of grid points (both in space and time) increases, the numerical solution should converge to the analytical one.
  
- **Convergence and Error Analysis**:
  - By comparing the two methods, you can study the **convergence rates** of the numerical method. The finite difference method is conditionally stable, meaning it requires the **CFL condition** \( r \leq 1 \) to ensure numerical stability.
  - The difference between the exact and numerical solutions gives an indication of the **numerical error**.

- **Practical Usage**:
  - The analytical method is limited to simpler problems where an exact solution can be derived using Fourier series.
  - The numerical method (`fdhyperbolic.m`) is more versatile as it can handle more complex initial conditions and boundary conditions that may not have simple analytical solutions.

### Important Notes:

- **Stability**: 
  The finite difference method (`fdhyperbolic.m`) is conditionally stable. The stability depends on the choice of \( r \), the CFL number, which must satisfy \( r \leq 1 \). If \( r \) is too large, the solution can become unstable.
  
- **Fourier Coefficients**:
  The `hyperbolic_analytical.m` method relies on the ability to calculate Fourier coefficients \( A_n \) and \( B_n \), which depend on the initial displacement and velocity. These coefficients are calculated via integrals of the initial conditions.

- **Boundary and Initial Conditions**:
  The analytical solution requires that you can express the initial displacement and velocity in terms of Fourier series, while the numerical method can handle a wider range of initial conditions through arbitrary functions \( f(x) \) and \( g(x) \).

---

### Summary:
- **`hyperbolic_analytical.m`** provides the exact solution using Fourier series and is typically used for simple cases where an analytical solution is available.
- **`fdhyperbolic.m`** uses the finite difference method for numerical solutions and can be applied to more complex scenarios.
- The two functions can be used together to verify the accuracy of numerical methods, study convergence, and analyze errors.
