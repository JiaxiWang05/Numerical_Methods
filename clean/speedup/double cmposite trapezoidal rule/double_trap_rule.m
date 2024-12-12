function S = double_trap_rule(f, x, n, y, m)
    % Input validation
    if nargin < 5
        error('Not enough input arguments. Required: f, x, n, y, m');
    end

    %Calculate step sizes approximate the double integrals of three different functions over a unit square 
    %%The step sizes hx and hy are computed as the width of the intervals divided by the number of panels in each direction.
    hx = (x(2)-x(1))/n;
    hy = (y(2)-y(1))/m;
    
    % Generate grid points
    x_points = x(1):hx:x(2);
    y_points = y(1):hy:y(2);
    
     
    % Initialize sum
    S = 0; %The variable S is initialized to store the result of the double integral.
    
    % Corner points (weight = 1/4)
    S = S + f(x_points(1), y_points(1))/4;
    S = S + f(x_points(end), y_points(1))/4;
    S = S + f(x_points(1), y_points(end))/4;
    S = S + f(x_points(end), y_points(end))/4; %Each of these corner points contributes one-quarter of its function value to the total sum (1/4), as the trapezoidal rule gives a weight of 1/4 for corner points
    
    % Edge points not including corners (weight = 1/2) Looping Over Grid Points
    for i = 2:n
        S = S + f(x_points(i), y_points(1))/2; %The function is evaluated at points along the bottom edge  where i ranges from 2 to n (ignoring the first and last points, which are the corners)
        S = S + f(x_points(i), y_points(end))/2;
    end
    
    for j = 2:m
        S = S + f(x_points(1), y_points(j))/2;
        S = S + f(x_points(end), y_points(j))/2;
    end
    
    % Interior points (weight = 1)
    for i = 2:n
        for j = 2:m
            S = S + f(x_points(i), y_points(j)); %The function is evaluated at points along the left edge  where j ranges from 2 to m.
        end
    end
    
    % Multiply by area element
    S = S * hx * hy;

    
end 

