Here is the rewritten README file with plain text for formulas to ensure compatibility with GitHub's Markdown rendering:

---

# Numerical Integration Using the Trapezoidal Rule

This function numerically computes the integral of a given function `f(x)` over a specified interval `[a, b]` using the **Trapezoidal Rule**. The rule divides the interval into smaller subintervals (panels) and approximates the area under the curve as trapezoids.

---

## Purpose

The purpose of this function is to evaluate an integral numerically. It is particularly useful when:
- An analytical solution is difficult or impossible to compute.
- You only have access to the function values at specific points.

---

## Trapezoidal Rule

The Trapezoidal Rule approximates the integral of a function by dividing the interval `[a, b]` into `n` panels (subintervals). Each panel forms a trapezoid, and the area of the trapezoid is calculated as:

**Area of one trapezoid** = (Base Length * (Height1 + Height2)) / 2

Where:
- The base length is the step size `h = (b - a) / n`.
- The heights are the function values at the endpoints of each subinterval.

The total integral is the sum of the areas of all trapezoids.

---

## Inputs and Outputs

### Inputs
1. **`f`**: The function to integrate, provided as a function handle (e.g., `@sin`).
2. **`x`**: A 2-element vector specifying the limits of integration `[a, b]`.
3. **`n`**: The number of panels (subintervals) into which the interval `[a, b]` is divided.

### Output
- **`S`**: The numerical approximation of the integral using the Trapezoidal Rule.

---

## Code Breakdown

### 1. Step Size Calculation
```matlab
h = (x(2)-x(1))/n;
```
- **Purpose**: Calculate the step size `h`, which determines the width of each panel.
- **Formula**: `h = (b - a) / n`, where:
  - `a = x(1)`: Start of the integration interval.
  - `b = x(2)`: End of the integration interval.
  - `n`: Number of panels.

---

### 2. Defining Panel Boundaries
```matlab
xim1 = x(1)+(0:n-1)*h;
xi = x(1)+(1:n)*h;
```
- **Purpose**: Compute the `x`-coordinates of the panel boundaries.
  - `xim1`: The starting points of each subinterval, including `a` and excluding `b`.
  - `xi`: The ending points of each subinterval, including `b` and excluding `a`.

#### Example:
If `[a, b] = [0, π]` and `n = 3`:
- `h = (π - 0) / 3 = π / 3`.
- `xim1 = [0, π/3, 2π/3]`.
- `xi = [π/3, 2π/3, π]`.

---

### 3. Function Values at Panel Boundaries
```matlab
fim1 = f(xim1);
fi = f(xi);
```
- **Purpose**: Evaluate the function `f(x)` at the boundaries of each panel:
  - `fim1 = f(xim1)`: Function values at the starting points.
  - `fi = f(xi)`: Function values at the ending points.

#### Example:
If `f(x) = sin(x)`, `[a, b] = [0, π]`, and `n = 3`:
- `fim1 = [sin(0), sin(π/3), sin(2π/3)] = [0, sqrt(3)/2, sqrt(3)/2]`.
- `fi = [sin(π/3), sin(2π/3), sin(π)] = [sqrt(3)/2, sqrt(3)/2, 0]`.

---

### 4. Trapezoidal Rule Implementation
```matlab
S = sum((fim1 + fi)*h/2);
```
- **Purpose**: Compute the sum of the areas of all trapezoids.
- **Formula**:
  S = (h / 2) * sum(f(xim1) + f(xi))

#### Example:
Using the sine function example:
S = (π / 3) * (1 / 2) * [(0 + sqrt(3)/2) + (sqrt(3)/2 + sqrt(3)/2) + (sqrt(3)/2 + 0)]

---

## Usage Example
```matlab
S = trap_rule(@sin, [0, pi], 10);
```
- **Inputs**:
  - Function: `sin(x)`.
  - Interval: `[0, π]`.
  - Panels: `n = 10`.
- **Output**:
  - `S` will be a numerical approximation of:
    Integral from 0 to π of sin(x) dx = 2

---

## Key Points
1. **Advantages**:
   - Simple to implement.
   - Works well for smooth functions over small intervals.

2. **Limitations**:
   - The Trapezoidal Rule is only **first-order accurate**. The error decreases proportionally to `h^2` (the square of the step size).
   - It may not perform well for functions with significant curvature or discontinuities.

3. **Efficiency**:
   - The use of vectorized operations (`fim1`, `fi`, and `sum`) ensures the function runs efficiently in MATLAB.

---
 
