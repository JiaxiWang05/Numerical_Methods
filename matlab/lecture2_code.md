# Numerical Differentiation using Finite Difference Methods

This MATLAB script demonstrates the calculation of numerical derivatives for the cosine function at \( x = \frac{\pi}{6} \) using three finite difference methods:
- **Forward Difference**
- **Backward Difference**
- **Central Difference**

The script computes the derivatives for varying step sizes \( h \), compares the results with the exact derivative (\(-0.5\)), and evaluates the errors.


---

## Code Features

### Display Format
- Numerical outputs are displayed in **short engineering notation** using:
  ```matlab
  format shorteng
  ```

### Step Sizes
- Step sizes are defined as:
  ```matlab
  h = 0.1 ./ 2.^(0:5);
  ```
  This results in:
  \[
  h = [0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125]
  \]

### Derivative Approximation Methods
The script calculates numerical derivatives using:
1. **Forward Difference**:
   \[
   f'(x) \approx \frac{f(x+h) - f(x)}{h}
   \]
2. **Backward Difference**:
   \[
   f'(x) \approx \frac{f(x) - f(x-h)}{h}
   \]
3. **Central Difference**:
   \[
   f'(x) \approx \frac{f(x+h) - f(x-h)}{2h}
   \]

### Error Analysis
- The exact derivative of \( \cos(x) \) at \( x = \pi/6 \) is:
  \[
  f'(\pi/6) = -0.5
  \]
- Errors are computed as:
  \[
  \text{Error} = | \text{Exact Value} - \text{Approximated Value} |
  \]

---

## Workflow

1. **Initialize Step Sizes**  
   Define a vector of decreasing step sizes \( h \) to observe how accuracy changes with smaller intervals.

2. **Preallocate Vectors**  
   Preallocate memory for storing derivative results and errors for efficiency:
   ```matlab
   gradf = zeros(6,1); % Forward Difference Results
   gradb = zeros(6,1); % Backward Difference Results
   gradc = zeros(6,1); % Central Difference Results
   ```

3. **Compute Derivatives**  
   Use a `for` loop to calculate numerical derivatives for each step size \( h \):
   ```matlab
   for i = 1:6
       gradf(i) = forward_diff( @cos, pi/6, h(i) );
       gradb(i) = backward_diff( @cos, pi/6, h(i) );
       gradc(i) = central_diff( @cos, pi/6, h(i) );
   end
   ```

4. **Calculate Errors**  
   Compute the absolute error for each method by comparing with the exact derivative (\(-0.5\)):
   ```matlab
   errf = abs(-0.5 - gradf);
   errb = abs(-0.5 - gradb);
   errc = abs(-0.5 - gradc);
   ```

5. **Summarize Results**  
   Create a table displaying the step sizes, derivative approximations, and errors:
   ```matlab
   T = table(h', gradf, errf, gradb, errb, gradc, errc);
   disp(T)
   ```

---

## Output

The script produces a table with the following columns:
1. **\( h \)**: Step sizes.
2. **`gradf`**: Gradients using forward difference.
3. **`errf`**: Errors for forward difference.
4. **`gradb`**: Gradients using backward difference.
5. **`errb`**: Errors for backward difference.
6. **`gradc`**: Gradients using central difference.
7. **`errc`**: Errors for central difference.

Example output:
```
     h       gradf        errf       gradb        errb       gradc        errc
    ______    _______    _______    _______    _______    ________    _______
    0.1       -0.499     1.0e-03    -0.498     2.0e-03    -0.4995     0.5e-03
    0.05      -0.4995    0.5e-03    -0.4990    1.0e-03    -0.4998     0.2e-03
    ...
```

---

## Insights

1. **Accuracy of Methods**:
   - **Central Difference** is typically more accurate because it uses information from both sides of the point of interest.
   - Errors in **Forward** and **Backward Difference** methods are larger and dependent on \( h \).

2. **Effect of Step Size**:
   - Reducing \( h \) improves accuracy up to a point, but very small \( h \) can introduce **floating-point errors**.

3. **Applications**:
   - This script demonstrates fundamental concepts of numerical differentiation, error analysis, and the trade-offs between truncation and round-off errors.

---

## Prerequisites

Ensure the following functions are implemented and available in the same directory:
1. `forward_diff`
2. `backward_diff`
3. `central_diff`

---

## Usage

1. Copy the script and required functions to a MATLAB workspace.
2. Run the script to compute numerical derivatives and display the results table.

---

## Contact

For any questions or issues, please contact **Stefano Giani** at:  
📧 **stefano.giani@durham.ac.uk**
