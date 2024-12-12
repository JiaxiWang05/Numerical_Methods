function task22table5() %a double integral over a rectangular region . This rule is an extension of the trapezoidal rule to two dimensions, and it works by dividing the region into smaller rectangles, evaluating the function at each rectangle.s corner and edge, and then applying appropriate weights to compute the integral

 
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