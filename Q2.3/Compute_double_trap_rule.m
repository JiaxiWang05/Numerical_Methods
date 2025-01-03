function task22() %a double integral over a rectangular region . This rule is an extension of the trapezoidal rule to two dimensions, and it works by dividing the region into smaller rectangles, evaluating the function at each rectangle.s corner and edge, and then applying appropriate weights to compute the integral

 
    % Define test anonymous functions functions
    f1 = @(x,y) ones(size(x));  % f(x,y) = 1 a constant function
    f2 = @(x,y) x.*y;           % f(x,y) = xy a linear function
    f3 = @(x,y) sin(pi*x).*sin(pi*y); % f(x,y) = sin(πx)sin(πy) a trigonometric function
 
    % Values of n and m to test
    
    % Values of n and m to test,The array n_values defines the different numbers of panels or subintervals used for integration in the x and y directions. These values represent the resolutions of the grid.
    n_values = [1 5 10];
    
    % Initialize results matrix (3 functions x 3 n values)
    results = zeros(3, 3);
    
    % Calculate approximations for each function and n value. This loop iterates over each n value (from n_values array) and computes the double integral for each of the three test functions (f1, f2, f3) over the unit square
    for i = 1:3 % Loop over n values 
        n = n_values(i); % gives the current number of panels in the x-direction.
        m = n; % Using same number of panels in both directions
        
   % Calculate integrals for each function with limits [0,π] instead of [0,1]
    results(1,i) = double_trap_rule(f1, [0,1], n, [0,1], m);
    results(2,i) = double_trap_rule(f2, [0,1], n, [0,1], m);
    results(3,i) = double_trap_rule(f3, [0,1], n, [0,1], m);
end

    
    % Create table variable names and row names
    varNames = {'n=m=1', 'n=m=5', 'n=m=10'}; %A cell array with the names of the test functions to use as column headers in the final table.
    rowNames = {'f(x,y)=1', 'f(x,y)=xy', 'f(x,y)=sin(πx)sin(πy)'}; %This creates the row names using arrayfun to format the string into n=m=<value> for each n value.
    
    % Round results to 6 decimal places
    results = round(results, 6);
    
    % Create and display table
    T = table(results(:,1), results(:,2), results(:,3), ...
              'VariableNames', varNames, 'RowNames', rowNames);
    
    disp('Double Trapezoidal Rule Results:')
    disp(T)
    
    % Save to Excel
    filename = 'double_trap_results.xlsx';
    
    % Write header
    header = [{'Function'}, varNames];
    writecell(header, filename, 'Sheet', 1, 'Range', 'A1');
    
    % Write data with row names
    data = [rowNames', num2cell(results)];
    writecell(data, filename, 'Sheet', 1, 'Range', 'A2');
    
    fprintf('Results saved to %s\n', filename);
end

function S = double_trap_rule(f, x, n, y, m)
    % Calculate step sizes approximate the double integrals of three different functions over a unit square 
    hx = (x(2)-x(1))/n; %The step sizes hx and hy are computed as the width of the intervals divided by the number of panels in each direction.
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
%Approach 2 is more readable as it clearly separates the different types of points (corners, edges, interior)The weights are more explicit and easier to understand
%Approach 2 avoids redundant conditional checks by separating the loops. It's more readable and maintainable
%More efficient (fewer conditional checks)
%Less prone to logical errors
%Easier to debug and modify