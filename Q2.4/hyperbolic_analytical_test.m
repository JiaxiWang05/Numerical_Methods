function u = hyperbolic_analytical(x, t, L, c, A, B) 
    % Example usage:
    % For f(x) = 1*sin(λ0*x) - 3*sin(λ2*x)
    % and g(x) = λ0*1*sin(λ0*x) + λ1*2*sin(λ1*x)
    % Call: u = hyperbolic_analytical(0.5, 1.0, 1.0, 1.0, [1, 0, -3], [1, 2])
    %one-dimensional wave equation
    % Initialize solution
    %The solution is obtained using separation of variables and is represented as a Fourier sine series.
    u = 0; 
    %The variable u is initialized to zero. This variable will hold the final solution of the PDE.
    
    % For the example:
    % A = [1, 0, -3] corresponds to coefficients for n = 0,1,2
    % B = [1, 2] corresponds to coefficients for n = 0,1
    
    % Get number of terms from input coefficients
    nA = length(A);
    nB = length(B);
    %The function uses two input arrays A and B for the coefficients of the solution series. The length of these arrays, nA and nB, determines the number of terms to include in the series.
    
    % Loop through terms in the series solution
    for n = 0:max(nA-1, nB-1) 
        %The loop runs over the terms in the solution series. It iterates from n = 0 to the maximum length of the coefficient arrays A and B minus 1. This ensures that all terms in the series are accounted for.
        % Calculate lambda_n = (2n+1)pi/(2L)
        lambda_n = (2*n + 1)*pi/(2*L); 
        %Calculate the eigenvalue ​
        %The eigenvalue is derived from the boundary conditions. From separation of variables, the general solution to the hyperbolic PDE involves sine functions, and the value of is determined by the boundary conditions
        
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
        %The general solution to the hyperbolic PDE is a sum of terms of
        %the form:comes from the initial displacement+ initial velocity 
 
        %Dirichlet and Neumann boundary conditions
        %The solution is expressed as a Fourier series (sine series), where each term involves oscillatory functions of time and space.
    end
end 