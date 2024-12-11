function u = hyperbolic_analytical(x, t, L, c, A, B)
    % Input validation
    if nargin < 6
        error('Not enough input arguments. Required: x, t, L, c, A, B');
    end
    
    % Initialize solution
    u = 0;
    
    % Get number of terms from input coefficients
    nA = length(A);
    nB = length(B);
    
    % Loop through terms in the series solution
    for n = 0:max(nA-1, nB-1)
        % Calculate lambda_n = (2n+1)pi/(2L)
        lambda_n = (2*n + 1)*pi/(2*L);
        
        % Get An coefficient (0 if not provided)
        An = 0;
        if n < nA
            An = A(n+1);
        end
        
        % Get Bn coefficient (0 if not provided)
        Bn = 0;
        if n < nB
            Bn = B(n+1);
        end
        
        % Add term to solution
        u = u + (An*cos(c*lambda_n*t) + Bn*sin(c*lambda_n*t))*sin(lambda_n*x);
    end
end