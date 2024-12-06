Here’s a sample `README.md` file you can use for your GitHub repository:

```markdown
# Trapezoidal Rule Integration

This repository contains a MATLAB implementation of the **Trapezoidal Rule** for numerical integration. The function approximates the definite integral of a given function over a specified interval using trapezoids. It is particularly useful for approximating integrals when an analytical solution is not feasible or when you are working with discrete data.

## Function: `trap_rule`

The `trap_rule` function evaluates the integral of a function \( f(x) \) over a specified interval \([x_1, x_2]\) using the Trapezoidal Rule. The interval is divided into \( n \) subintervals, and the function sums up the areas of the trapezoids formed at each subinterval.

### Usage

```matlab
S = trap_rule(f, x, n)
```

### Inputs

- `f`  : Function handle for the function to integrate. (e.g., `@sin`, `@cos`)
- `x`  : A 2-element vector specifying the integration limits \([x_1, x_2]\), where \(x_1\) is the start and \(x_2\) is the end of the integration range.
- `n`  : The number of subintervals (or "panels") to divide the range \([x_1, x_2]\) into.

### Output

- `S`  : The numerically approximated value of the integral of \(f(x)\) over the interval \([x_1, x_2]\) using the Trapezoidal Rule.

### Example

To calculate the integral of \( \sin(x) \) from \(0\) to \( \pi \) with 10 subintervals:

```matlab
S = trap_rule(@sin, [0, pi], 10)
```

This will return the numerical approximation of the integral of \( \sin(x) \) over the interval \([0, \pi]\).

### Code Implementation

```matlab
function S = trap_rule( f, x, n )
    % trap_rule   Trapezoidal Rule
    %
    % usage:    S = trap_rule( f, x, n )
    %
    % inputs:   f - Function to be integrated with respect to x
    %           x - Extrems of the integral region
    %           n - Number of panels
    %
    % output:  S - numerically evaluated integral by
    %                     trapezoidal rule
    %
    % Written by: Stefano Giani
    %             stefano.giani@durham.ac.uk
    %
    % Created: 17/11/13

    h = (x(2)-x(1))/n;

    xim1 = x(1)+(0:n-1)*h;
    xi = x(1)+(1:n)*h;

    fim1 = f(xim1);
    fi = f(xi);

    S = sum((fim1+fi)*h/2);
end
```

### Explanation of the Code

- **Step 1**: The interval \([x_1, x_2]\) is divided into \(n\) subintervals, and the width of each subinterval is computed as \(h = \frac{x_2 - x_1}{n}\).
- **Step 2**: The function \(f(x)\) is evaluated at the left (`xim1`) and right (`xi`) endpoints of each subinterval.
- **Step 3**: The area of each trapezoid is calculated using the average of the left and right function values, multiplied by the width \(h\).
- **Step 4**: The total sum of all trapezoidal areas gives the numerical approximation of the integral.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Contact

For any questions or feedback, feel free to reach out to:
- Stefano Giani
- Email: stefano.giani@durham.ac.uk

---

Happy coding and happy integrating!
```

This `README.md` includes:
- A description of the repository.
- Instructions on how to use the `trap_rule` function.
- Example usage.
- The implementation of the function.
- Explanation of the code.
- Contact information for the author.

You can customize it further based on your needs.
