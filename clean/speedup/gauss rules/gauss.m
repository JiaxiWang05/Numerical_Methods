function S = gauss(rule, f)
   % Gauss-Legendre quadrature rules for integrating functions on [-1,1]
   % rule: 1, 2, or 3 (for the number of points: 2, 3, or 4)
   %f: function handle (e.g., @sin, @cos, etc.
   % Define the Gauss-Legendre quadrature points and weights
   %   S    - approximation of integral using specified Gauss-Legendre rule
    if ~isa(f, 'function_handle')
        error('Second argument must be a function handle');
    end
    
    % Pre-compute constants
    persistent x1 w1 x2 w2 x3 w3
    if isempty(x1)
        x1 = [-sqrt(1/3), sqrt(1/3)];
        w1 = [1, 1];
        x2 = [-sqrt(3/5), 0, sqrt(3/5)];
        w2 = [5/9, 8/9, 5/9];
        a = sqrt(3/7 - 2/7*sqrt(6/5));
        b = sqrt(3/7 + 2/7*sqrt(6/5));
        x3 = [a, -a, b, -b];
        w3 = [(18+sqrt(30))/36, (18+sqrt(30))/36, (18-sqrt(30))/36, (18-sqrt(30))/36];
    end
    
    % Direct array access instead of conditionals
    switch rule
        case 1
            x = x1; w = w1;
        case 2  
            x = x2; w = w2;
        case 3
            x = x3; w = w3;
        otherwise
            error('Invalid rule number. Use 1, 2, or 3.');
    end
    
    % Vectorized computation instead of loop
    S = sum(w .* f(x));

end
  