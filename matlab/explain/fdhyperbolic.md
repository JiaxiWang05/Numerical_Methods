 
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


Alright, let's explain this in a simple way!

Imagine you’re trying to solve a puzzle where you need to find out how a rope or string moves over time. This puzzle is a **hyperbolic equation**, which is a type of math that helps us understand how things like waves or vibrations move, such as a vibrating guitar string.

### 1. **`hyperbolic_analytical.m`**: The Perfect Solution (Like Magic!)

This is like having a **magic formula** that can tell us exactly how the string moves at any time. It uses a special trick called a **Fourier series** (don’t worry about the big word!) which is just a way of breaking the string's movement into simpler parts, like adding up different waves of movement.

We know:
- The string starts at a certain position (that's like the first photo of the string when we start the experiment).
- The string has a certain speed of movement (how fast it shakes or vibrates).

Using this magic formula, we can perfectly predict where the string will be at any time. This is great because it tells us the **exact answer**. It’s like solving the puzzle perfectly!

### 2. **`fdhyperbolic.m`**: The Approximate Solution (Step-by-Step)

Now, sometimes we can’t use the magic formula, or maybe the puzzle is too complicated. That’s when we use a method called **finite differences**. This is like **guessing** the answer step by step, starting with small guesses and getting closer to the right answer as we go.

Here’s how it works:
- We divide the rope into small parts (like breaking the rope into little pieces) and check how each piece moves over time.
- We use simple math to make guesses about the movement, based on the neighboring pieces.
- We repeat this over and over, making better guesses each time.

We use **two rules** to make sure our guesses are okay:
1. **Initial conditions**: Where does the string start? How fast is it moving?
2. **Boundary conditions**: What happens at the ends of the string? Does it stay fixed at the ends?

### Why Use Both?

- **Magic formula (`hyperbolic_analytical.m`)**: This is the **perfect solution**, but it can only be used when the problem is simple enough to solve with a formula.
- **Finite differences (`fdhyperbolic.m`)**: This is more like **making good guesses** when the problem is too complicated or we don’t have a magic formula.

So, we can use both methods together to check if our guesses are good! If our guesses are close to the perfect solution, we know we did a good job.

In simple terms:
- The **magic formula** tells us exactly what will happen (like a map to guide us).
- The **finite difference method** lets us **guess step by step** and get closer to the right answer, like following the path and adjusting our steps as we go.

### Example

Imagine you're bouncing a ball on a string:
- The **magic formula** can tell us exactly how the ball moves.
- The **finite difference method** can help us guess the ball's movement by looking at small steps and making better guesses.

In the end, both methods help us solve the puzzle of how the string moves!
