function u = hyperbolic_analytical(x, t, L, c, A, B)
%HYPERBOLIC_ANALYTICAL Compute analytical solution of wave equation
%   u = HYPERBOLIC_ANALYTICAL(x, t, L, c, A, B) computes the solution of the
%   wave equation u_tt = c^2 * u_xx at point (x,t) with:
%   - Boundary conditions: u(0,t) = 0, u_x(L,t) = 0
%   - Initial conditions: u(x,0) = f(x), u_t(x,0) = g(x)
%
%   Inputs:
%       x - Spatial coordinate (0 <= x <= L)
%       t - Time coordinate (t >= 0)
%       L - Domain length (L > 0)
%       c - Wave speed coefficient
%       A - Coefficients for f(x) expansion
%       B - Coefficients for g(x) expansion
%
%   Output:
%       u - Solution value at point (x,t)
%
%   Example:
%       x = 0.5; t = 1; L = 1; c = 2;
%       A = [1, 2, 3]; B = [-1, 0, 2, -1];
%       u = hyperbolic_analytical(x, t, L, c, A, B)
%
%   See also: SIN, COS, SUM

    % Input validation
    validateattributes(x, {'numeric'}, {'scalar', '>=', 0, '<=', L}, ...
        'hyperbolic_analytical', 'x');
    validateattributes(t, {'numeric'}, {'scalar', '>=', 0}, ...
        'hyperbolic_analytical', 't');
    validateattributes(L, {'numeric'}, {'scalar', '>', 0}, ...
        'hyperbolic_analytical', 'L');
    validateattributes(c, {'numeric'}, {'scalar'}, ...
        'hyperbolic_analytical', 'c');
    validateattributes(A, {'numeric'}, {'vector'}, ...
        'hyperbolic_analytical', 'A');
    validateattributes(B, {'numeric'}, {'vector'}, ...
        'hyperbolic_analytical', 'B');

    % Convert input vectors to column vectors if they're row vectors
    A = A(:);
    B = B(:);

    % Determine number of terms in series, determined by the longest of A and B. proper indexing for MATLAB
    n_max = max(length(A), length(B)) - 1;
    
    % Create index vector for computations (as column vector)
    n_vector = (0:n_max)';
    
    % Precompute common terms,This computes the eigenvalues  based on the boundary conditions, where  n = 0, 1, 2...
    lambda_n = (2*n_vector + 1) * (pi/(2*L));
    
    % Precompute trigonometric terms. These are the terms that will be used in the summation for the final solution. 
    sin_x = sin(lambda_n * x); %  spatial distribution of the wave, how the wave behaves across the spatial domain.
    cos_t = cos(c * lambda_n * t); %temporal evolution of the wave, how the wave changes over time.
    sin_t = sin(c * lambda_n * t); % dynamics of the wave (specifically the velocity or “motion” of the wave). It is responsible for the time-varying behavior of the wave, and the presence of this term is important to match the initial velocity condition
    
    % Pad coefficient vectors with zeros to match maximum length
    A_padded = zeros(n_max + 1, 1);
    B_padded = zeros(n_max + 1, 1);
    
    A_padded(1:length(A)) = A;
    B_padded(1:length(B)) = B;
    
    % Compute solution using vectorized operations
    u = sum(sin_x .* (A_padded .* cos_t + B_padded .* sin_t));
end
