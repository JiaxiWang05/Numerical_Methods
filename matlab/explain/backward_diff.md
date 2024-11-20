To deeply understand the given MATLAB function `backward_diff`, we will break it down into every detail, analyzing the code's purpose, structure, and why each part exists. 

---
To ensure that all formulas, such as \( f'(x) = \lim_{h \to 0} \frac{F(x) - F(x-h)}{h} \), can be displayed correctly in a GitHub README file, here’s how to structure the explanation. Since GitHub Markdown does not natively support MathJax or LaTeX rendering, you need to either:

1. **Use plain text with inline formatting for math.**
2. **Leverage code blocks for clearer formatting.**

Below is a GitHub-compatible README section for the function, with properly formatted equations and detailed explanation:

---

# `backward_diff` - Backward Difference Gradient

The `backward_diff` function computes the numerical derivative of a given function \( F(x) \) at a specific point \( x \) using the **backward difference method**. This method approximates derivatives by evaluating the function at \( x \) and \( x-h \), where \( h \) is a small step size.

---

## **Mathematical Definition**

The derivative of \( F(x) \) using the backward difference method is approximated as:

```
f'(x) ≈ (F(x) - F(x - h)) / h
```

This formula comes from the limit definition of a derivative:

```
f'(x) = lim (h → 0) [(F(x) - F(x - h)) / h]
```

Here:
- \( F(x) \) is the function being differentiated.
- \( x \) is the point of evaluation.
- \( h \) is the step size.

---

## **Function Syntax**

```matlab
gradient = backward_diff(F, x, h)
```

### **Inputs**
- `F`: Function handle for the function to differentiate (e.g., `@cos`).
- `x`: Point where the derivative is evaluated.
- `h`: Step size for the approximation.

### **Output**
- `gradient`: The numerical gradient at \( x \) computed using the backward difference method.

---

## **Example Usage**

```matlab
gradient = backward_diff(@cos, pi/6, 0.1);
disp(gradient);
```

For \( F(x) = \cos(x) \), \( x = \frac{\pi}{6} \), and \( h = 0.1 \):
```
f'(x) ≈ (cos(pi/6) - cos(pi/6 - 0.1)) / 0.1
```

---

## **How It Works**

The backward difference formula is implemented as:

```matlab
gradient = (F(x) - F(x - h)) / h;
```

### **Step-by-Step Process**
1. Compute the function value at \( x \): `F(x)`.
2. Compute the function value at \( x-h \): `F(x-h)`.
3. Subtract the two values: `F(x) - F(x-h)`.
4. Divide by the step size \( h \): `(F(x) - F(x-h)) / h`.

---

## **Advantages**
- **Simplicity**: Easy to implement and requires only two function evaluations (\( F(x) \) and \( F(x-h) \)).
- **Backward Compatibility**: Useful when future values (\( x+h \)) are unavailable.

---

## **Limitations**
1. **Accuracy**:
   - The method introduces **truncation errors**, especially for large \( h \).
   - Errors decrease as \( h \) becomes smaller, but extremely small \( h \) can cause numerical instability due to floating-point precision limits.
2. **Asymmetry**:
   - Only uses backward information (\( x-h \)), unlike **central difference**, which uses symmetric points (\( x+h \) and \( x-h \)).

---
 

This layout ensures readability and compatibility with GitHub's Markdown renderer. The formulas are written in plain text to avoid requiring MathJax or special LaTeX rendering, making them universally displayable on GitHub.
### **Function Purpose**
The function `backward_diff` computes the numerical gradient (derivative) of a given function \( F \) at a specific point \( x \) using the **backward difference method**. This method approximates the derivative by considering the difference between the function value at \( x \) and \( x-h \), divided by the step size \( h \).

#### **Why Use Backward Difference?**
In numerical differentiation, the derivative of a function \( F \) at \( x \) is defined as:
\[
f'(x) = \lim_{h \to 0} \frac{F(x) - F(x-h)}{h}
\]
- The **backward difference method** approximates this by taking a finite (non-zero) step \( h \) backward from \( x \).
- It is particularly useful when \( F(x) \) is not differentiable symbolically or cannot be expressed analytically, such as data-driven functions or black-box models.

---

### **Code Walkthrough**

#### **Function Declaration**
```matlab
function gradient = backward_diff( F, x, h )
```
1. **Keyword `function`:** Declares that this script defines a MATLAB function.
2. **`gradient`:** The output of the function, which will store the computed numerical gradient.
3. **Inputs:**
   - `F`: The function whose derivative is being calculated. Passed as a **function handle** (e.g., `@cos`).
   - `x`: The point where the derivative is approximated.
   - `h`: The step size used in the calculation. Smaller values of \( h \) increase accuracy but may introduce numerical errors (round-off errors).

---

#### **Comment Block**
```matlab
% backward_diff   Backward Difference Gradient
%
% usage:    gradient = backward_diff( F, x, h )
%
% example:    gradient = backward_diff( @cos, pi/6, 0.5 )
%
% inputs:   F - Function to be differentiated with respect to x
%           x - Coordinate where F is evaluated
%           h - Value of the step size h
%
% output:  gradient - numerically evaluated gradient by
%                     backward difference
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       17/11/13
%
```

This is a **documentation block**. It provides:
- The function name and description.
- **Usage** examples to help the user call the function correctly.
- Descriptions of inputs (`F`, `x`, `h`) and outputs (`gradient`).
- Attribution (authorship, email, creation date).

---

#### **Core Computation**
```matlab
gradient = (F(x)-F(x-h))./h;
```

This is the heart of the function. Let’s dissect it step by step:

1. **`F(x)`**:
   - Calls the input function handle `F` and evaluates it at the point \( x \).
   - Example: If \( F = \cos \), then `F(x)` computes \( \cos(x) \).

2. **`F(x-h)`**:
   - Evaluates the function at a point **backward** by \( h \), i.e., \( x - h \).
   - This reflects the **backward difference** method.

3. **`F(x) - F(x-h)`**:
   - Computes the difference in the function’s value between \( x \) and \( x-h \).

4. **Division by `h`**:
   - Dividing the difference by \( h \) normalizes the difference into a rate of change, approximating the derivative.
   - The smaller \( h \), the closer this approximation is to the exact derivative.

5. **Output `gradient`**:
   - Stores the result of the backward difference computation. This is the approximate gradient at \( x \).

#### **Why Use Element-wise Division (`./`)**:
- `./` ensures that the operation is performed element-wise, which is important if \( x \) or \( F(x) \) are vectors or matrices.
- For scalar inputs, this behaves like regular division.

---

### **Backward Difference Method in Depth**

#### **Definition**
The backward difference method approximates the derivative of \( F \) as:
\[
f'(x) \approx \frac{F(x) - F(x-h)}{h}
\]
This uses points \( x \) and \( x-h \) to calculate the slope of the secant line approximating the tangent at \( x \).

#### **Advantages**
1. **Ease of Computation**:
   - Only requires function values at two points: \( x \) and \( x-h \).
   - No need for additional data or symbolic differentiation.

2. **Simple Implementation**:
   - Requires only subtraction and division.

3. **Backward Compatibility**:
   - Useful for edge cases where forward values (\( F(x+h) \)) are unavailable (e.g., in time-series data where past values are known but future values are not).

#### **Limitations**
1. **Truncation Error**:
   - The error from the approximation can be expressed as:
     \[
     \text{Error} = \frac{h}{2} F''(c), \quad \text{for some } c \in [x-h, x]
     \]
   - As \( h \to 0 \), the approximation becomes more accurate, but too small \( h \) introduces **round-off errors** due to finite-precision arithmetic.

2. **Asymmetric Sampling**:
   - Unlike the **central difference method**, backward difference does not use information symmetrically around \( x \), potentially reducing accuracy.

---

### **Usage Example**
#### Code
```matlab
gradient = backward_diff(@cos, pi/6, 0.5);
disp(gradient);
```

#### Explanation:
1. `@cos`:
   - Passes the cosine function as the input function handle `F`.
2. `pi/6`:
   - Evaluates the derivative at \( x = \frac{\pi}{6} \).
3. `0.5`:
   - Specifies the step size \( h = 0.5 \).

#### Expected Output:
The approximate gradient using backward difference is:
\[
\text{Gradient} \approx \frac{\cos\left(\frac{\pi}{6}\right) - \cos\left(\frac{\pi}{6} - 0.5\right)}{0.5}
\]

---

### **Key Takeaways**
1. **What It Does**: Computes the gradient numerically using the backward difference method.
2. **When to Use It**: Suitable for numerical differentiation when symbolic derivatives are unavailable.
3. **Accuracy Consideration**: Balance \( h \) to reduce both truncation and round-off errors.
4. **Efficiency**: Simple and computationally inexpensive.

By following these details, anyone, regardless of prior knowledge, should be able to understand and implement `backward_diff` confidently.
