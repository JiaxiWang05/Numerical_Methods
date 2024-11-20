Below is a detailed explanation of the **bisection method** implemented in the MATLAB function `bisection` along with its formatted display for a GitHub README file.

---

# `bisection` - Root-Finding Using the Bisection Method

The `bisection` function implements the **bisection method**, a numerical approach to finding roots of a given function \( f(x) \) within a specified interval \([a, b]\).

---

## **Mathematical Background**

The bisection method relies on the **Intermediate Value Theorem**, which states:
- If \( f(a) \cdot f(b) < 0 \), then there exists at least one root \( c \) in the interval \([a, b]\), such that \( f(c) = 0 \).

The method iteratively reduces the interval \([a, b]\) by evaluating the function at the midpoint \( c = \frac{a+b}{2} \), replacing either \( a \) or \( b \) with \( c \) based on the sign of \( f(c) \).

### Algorithm Steps
1. Compute the midpoint \( c = \frac{a+b}{2} \).
2. Evaluate \( f(c) \).
3. If \( |f(c)| \) is sufficiently small (less than the tolerance), \( c \) is the root.
4. Otherwise:
   - Replace \( a \) with \( c \) if \( \text{sign}(f(c)) = \text{sign}(f(a)) \).
   - Replace \( b \) with \( c \) otherwise.
5. Repeat until the root is found or a maximum number of iterations is reached.

---

## **Function Syntax**

```matlab
c = bisection(a, b, f)
```

### **Inputs**
- `a`: Lower bound of the interval.
- `b`: Upper bound of the interval.
- `f`: The function handle for which the root is being found.

### **Output**
- `c`: The approximate root of the function within the interval \([a, b]\).

---

## **How It Works**

### Initial Setup
```matlab
n = 1;        % Iteration counter
y = f(b);     % Evaluate the function at the upper bound
```
- `n`: Tracks the number of iterations (to prevent infinite loops).
- `y`: Stores the function value at \( b \).

---

### Loop with Stopping Criteria
```matlab
while n < 1000
   c = (a + b) / 2;    % Compute the midpoint
   y_old = y;          % Store the old value of y for comparison
   y = f(c);           % Evaluate the function at the midpoint
```
- The midpoint \( c = \frac{a+b}{2} \) is calculated.
- The function \( f(c) \) is evaluated at the midpoint to check its value.

---

#### Stopping Conditions
```matlab
   if abs(f(c)) < 1e-8 || abs(y-y_old)/2 < 1e-8
       break
   end
```
1. **\( |f(c)| < 1e{-8} \):** If the function value at \( c \) is close enough to zero, \( c \) is accepted as the root.
2. **\( |y-y_{\text{old}}|/2 < 1e{-8} \):** If the change in \( y \) between iterations is sufficiently small, the process is terminated.

---

### Updating the Interval
```matlab
   if sign(y) == sign(f(a))
       a = c;
   else
       b = c;
   end
   n = n + 1;    % Increment iteration counter
end
```
- The interval is updated based on the sign of \( f(c) \) relative to \( f(a) \):
  - If \( \text{sign}(f(c)) = \text{sign}(f(a)) \), set \( a = c \).
  - Otherwise, set \( b = c \).

---

## **Example Usage**

```matlab
f = @(x) x^3 - x - 2;   % Define a function
root = bisection(1, 2, f);  % Find the root within [1, 2]
disp(root);             % Display the approximated root
```

### Expected Output
For \( f(x) = x^3 - x - 2 \), the bisection method finds the root approximately as:
```
c ≈ 1.5214
```

---

## **Advantages**
1. **Guaranteed Convergence**:
   - The method is guaranteed to converge if \( f(a) \cdot f(b) < 0 \).
2. **Simplicity**:
   - The algorithm is straightforward to implement.

---

## **Limitations**
1. **Slow Convergence**:
   - The bisection method converges linearly, making it slower than other methods like Newton-Raphson or Secant methods.
2. **Requires Sign Change**:
   - The function must change signs over the interval \([a, b]\), which may not always be the case.

 

### GitHub-Compatible Example Output:

```
Iteration 1: c = 1.5, f(c) = -0.125
Iteration 2: c = 1.625, f(c) = 0.666
...
Final root approximation: c ≈ 1.5214
```

This format ensures compatibility with GitHub Markdown, where equations are represented in plain text, and includes detailed explanations of every part of the function.
