markdown: kramdown
kramdown:
  math_engine: mathjax


Here is a detailed explanation of the `trap_rule` function. This function numerically computes the integral of a given function \( f(x) \) over a specified interval \([a, b]\) using the **Trapezoidal Rule**. The rule divides the interval into smaller subintervals (panels) and approximates the area under the curve as trapezoids.

---

## **Purpose**

The purpose of this function is to evaluate an integral numerically. It is particularly useful when:
- An analytical solution is difficult or impossible to compute.
- You only have access to the function values at specific points.

---

## **Trapezoidal Rule**

The Trapezoidal Rule approximates the integral of a function by dividing the interval \([a, b]\) into \( n \) panels (subintervals). Each panel forms a trapezoid, and the area of the trapezoid is calculated as:
\[
\text{Area of one trapezoid} = \frac{\text{Base Length} \cdot (\text{Height}_1 + \text{Height}_2)}{2}
\]
Where:
- The base length is the step size \( h = \frac{b-a}{n} \).
- The heights are the function values at the endpoints of each subinterval.

The total integral is the sum of the areas of all trapezoids.

---

## **Inputs and Outputs**

### **Inputs**
1. **`f`**: The function to integrate, provided as a function handle (e.g., `@sin`).
2. **`x`**: A 2-element vector specifying the limits of integration \([a, b]\).
3. **`n`**: The number of panels (subintervals) into which the interval \([a, b]\) is divided.

### **Output**
- **`S`**: The numerical approximation of the integral using the Trapezoidal Rule.

---

## **Code Breakdown**

### 1. **Step Size Calculation**
```matlab
h = (x(2)-x(1))/n;
```
- **Purpose**: Calculate the step size \( h \), which determines the width of each panel.
- **Formula**: \( h = \frac{b-a}{n} \), where:
  - \( a = x(1) \): Start of the integration interval.
  - \( b = x(2) \): End of the integration interval.
  - \( n \): Number of panels.

---

### 2. **Defining Panel Boundaries**
```matlab
xim1 = x(1)+(0:n-1)*h;
xi = x(1)+(1:n)*h;
```
- **Purpose**: Compute the \( x \)-coordinates of the panel boundaries.
- \( \text{xim1} \): The starting points of each subinterval, including \( a \) and excluding \( b \).
- \( \text{xi} \): The ending points of each subinterval, including \( b \) and excluding \( a \).

#### Example:
If \( [a, b] = [0, \pi] \) and \( n = 3 \):
- \( h = \frac{\pi - 0}{3} = \frac{\pi}{3} \).
- \( \text{xim1} = [0, \frac{\pi}{3}, \frac{2\pi}{3}] \).
- \( \text{xi} = [\frac{\pi}{3}, \frac{2\pi}{3}, \pi] \).

---

### 3. **Function Values at Panel Boundaries**
```matlab
fim1 = f(xim1);
fi = f(xi);
```
- **Purpose**: Evaluate the function \( f(x) \) at the boundaries of each panel:
  - \( \text{fim1} = f(\text{xim1}) \): Function values at the starting points.
  - \( \text{fi} = f(\text{xi}) \): Function values at the ending points.

#### Example:
If \( f(x) = \sin(x) \), \( [a, b] = [0, \pi] \), and \( n = 3 \):
- \( \text{fim1} = [\sin(0), \sin(\frac{\pi}{3}), \sin(\frac{2\pi}{3})] = [0, \frac{\sqrt{3}}{2}, \frac{\sqrt{3}}{2}] \).
- \( \text{fi} = [\sin(\frac{\pi}{3}), \sin(\frac{2\pi}{3}), \sin(\pi)] = [\frac{\sqrt{3}}{2}, \frac{\sqrt{3}}{2}, 0] \).

---

### 4. **Trapezoidal Rule Implementation**
```matlab
S = sum((fim1 + fi)*h/2);
```
- **Purpose**: Compute the sum of the areas of all trapezoids.
- **Formula**:
  \[
  S = \sum_{i=1}^{n} \frac{h}{2} \cdot \left[ f(x_{i-1}) + f(x_i) \right]
  \]
- Here:
  - \( h/2 \): Common factor representing the width of each trapezoid divided by 2.
  - \( \text{fim1} + \text{fi} \): Sum of the heights (function values) of each trapezoid.
  - `sum(...)`: Adds up the contributions of all trapezoids.

#### Example:
Using the sine function example:
\[
S = \frac{\pi}{3} \cdot \frac{1}{2} \cdot \left[ (0 + \frac{\sqrt{3}}{2}) + (\frac{\sqrt{3}}{2} + \frac{\sqrt{3}}{2}) + (\frac{\sqrt{3}}{2} + 0) \right]
\]

---

## **Usage Example**
```matlab
S = trap_rule(@sin, [0, pi], 10);
```
- **Inputs**:
  - Function: \( \sin(x) \).
  - Interval: \([0, \pi]\).
  - Panels: \( n = 10 \).
- **Output**:
  - `S` will be a numerical approximation of:
    \[
    \int_0^\pi \sin(x) \, dx = 2
    \]

---

## **Key Points**
1. **Advantages**:
   - Simple to implement.
   - Works well for smooth functions over small intervals.

2. **Limitations**:
   - The Trapezoidal Rule is only **first-order accurate**. The error decreases proportionally to \( h^2 \) (the square of the step size).
   - It may not perform well for functions with significant curvature or discontinuities.

3. **Efficiency**:
   - The use of vectorized operations (`fim1`, `fi`, and `sum`) ensures the function runs efficiently in MATLAB.

---

## **Contact**
For questions or clarifications, contact **Stefano Giani**:  
📧 **stefano.giani@durham.ac.uk**  
