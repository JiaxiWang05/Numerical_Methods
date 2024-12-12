

function task21()
    % Define test functions
    f1 = @(x) x;
    f2 = @(x) x.^2;
    f3 = @(x) x.^3;
    f4 = @(x) x.^4;
    f5 = @(x) x.^5;
    f6 = @(x) x.^6;
    f7 = @(x) x.^7;
    f8 = @(x) x.^8;

    % Exact values for integrals from -1 to 1 (analytically computed)
    exact = [0, 2/3, 0, 2/5, 0, 2/7, 0, 2/9];

    % Initialize results matrix (8 functions x 3 rules)
    results = zeros(8,3);
    errors = zeros(8,3);

    % Calculate approximations and errors for each function using each rule
    funcs = {f1, f2, f3, f4, f5, f6, f7, f8};
    % Loop over each function
    for i = 1:8
    % Loop over each Gauss-Legendre rule
        for rule = 1:3
            % Compute the Gauss-Legendre approximation for this function using the given rule
            results(i,rule) = gauss(rule, funcs{i});
            % Calculate the error as the difference between the exact and approximate values
            errors(i,rule) = abs(results(i,rule) - exact(i));
        end
    end

    % Create table variable names and row names
    varNames = {'G-L rule 1', 'G-L rule 2', 'G-L rule 3', 'Error rule 1', 'Error rule 2', 'Error rule 3'};
    rowNames = arrayfun(@(x) sprintf('x^%d', x), 1:8, 'UniformOutput', false);
    
    % Combine results and errors into one matrix and round to 3 decimal places
    tableData = round([results, errors], 3);
    
    % Create table
    T = table(tableData(:,1), tableData(:,2), tableData(:,3), ...
              tableData(:,4), tableData(:,5), tableData(:,6), ...
              'VariableNames', varNames, 'RowNames', rowNames);
    
    % Display formatted table
    disp('Gauss-Legendre Quadrature Results:')
    disp(T)
    
    % Save to Excel with 'Function' header
    filename = 'gauss_legendre_results.xlsx';
    
    % Write header first
    header = [{'Function'}, varNames];
    writecell(header, filename, 'Sheet', 1, 'Range', 'A1');
    
    % Write data with row names
    data = [rowNames', num2cell(tableData)];
    writecell(data, filename, 'Sheet', 1, 'Range', 'A2');
    
    fprintf('Results saved to %s\n', filename);
end








