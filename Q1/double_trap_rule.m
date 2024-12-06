function S = double_trap_rule(f, x, n, y, m)
    % Calculate step sizes
    hx = (x(2) - x(1))/n;
    hy = (y(2) - y(1))/m;
    
    % Initialize sum
    S = 0;
    
    % Generate grid points
    for i = 0:n
        for j = 0:m
            % Calculate current points
            xi = x(1) + i*hx;
            yj = y(1) + j*hy;
            
            % Determine weight based on position
            weight = 1;
            if (i == 0 || i == n) && (j == 0 || j == m)
                weight = 1/4;  % corner points
            elseif (i == 0 || i == n) || (j == 0 || j == m)
                weight = 1/2;  % edge points
            end
            
            % Add weighted function value
            S = S + weight * f(xi, yj);
        end
    end
    
    % Multiply by area element
    S = S * (hx * hy);
end

function test_double_trap_rule()
    % Define the test functions
    f1 = @(x,y) 1;                           % f(x,y) = 1
    f2 = @(x,y) x.*y;                        % f(x,y) = xy
    f3 = @(x,y) sin(pi*x).*sin(pi*y);       % f(x,y) = sin(πx)sin(πy)

    % Domain [0,1]²
    x = [0, 1];
    y = [0, 1];

    % Values to test
    n_values = [1, 5, 10];

    % Calculate and display results
    fprintf('n = m\t\tf = 1\t\tf = xy\t\tf = sin(πx)sin(πy)\n');
    fprintf('------------------------------------------------\n');

    for n = n_values
        result1 = double_trap_rule(f1, x, n, y, n);
        result2 = double_trap_rule(f2, x, n, y, n);
        result3 = double_trap_rule(f3, x, n, y, n);
        
        fprintf('%d\t\t%.3f\t\t%.3f\t\t%.3f\n', n, result1, result2, result3);
    end
end