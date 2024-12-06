function S = gauss(rule, f)
   % Gauss-Legendre quadrature rules for integrating functions on [-1,1]
   % rule: 1, 2, or 3 (for the number of points: 2, 3, or 4)
   %f: function handle (e.g., @sin, @cos, etc.
   % Define the Gauss-Legendre quadrature points and weights
   % Output:
   %   S    - approximation of integral using specified Gauss-Legendre rule
    if ~isa(f, 'function_handle')
        error('Second argument must be a function handle');
    end
    
    if rule == 1  % 2-point rule
        x = [-sqrt(1/3), sqrt(1/3)];
        w = [1, 1];
    elseif rule == 2  % 3-point rule
        x = [-sqrt(3/5), 0, sqrt(3/5)];
        w = [5/9, 8/9, 5/9];
    elseif rule == 3  % 4-point rule
        a = sqrt(3/7 - 2/7*sqrt(6/5));
        b = sqrt(3/7 + 2/7*sqrt(6/5));
        x = [a, -a, b, -b];
        w = [(18+sqrt(30))/36, (18+sqrt(30))/36, 
             (18-sqrt(30))/36, (18-sqrt(30))/36];
        else
        error('Invalid rule number. Use 1, 2, or 3.');
    end
    
    % Compute quadrature sum 
    % Compute Gauss-Legendre quadrature sum S = sum(f(xi)*wi)
    S = 0;
    for i = 1:length(x)
        S = S + w(i)*f(x(i));% Implements the summation formula directly
    end
end
