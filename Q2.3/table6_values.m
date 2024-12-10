function table6_values()
% Parameters from Table 7
L = 1;
c = 2;
A = [1, 2, 3];
B = [-1, 0, 2, -1];

    % Create vectors for t and x values
    t = [0; 1; 2];
    x = [0.2; 0.5; 0.9];
    
    % Initialize results matrix
    results = zeros(length(t)*length(x), 3);
    idx = 1;
    
    % Calculate all values
    for i = 1:length(t)
        for j = 1:length(x)
            results(idx,:) = [t(i), x(j), hyperbolic_analytical(x(j), t(i), L, c, A, B)];
            idx = idx + 1;
        end
    end
    
    % Create table and round to 3 significant figures
    T = array2table(results, 'VariableNames', {'t', 'x', 'u'});
    T.u = round(T.u, 3, 'significant');
    
    % Write to Excel file
    %Values oscillate between positive and negativ
    %The magnitudes are bounded
    %The pattern shows periodic behavior
    writetable(T, 'table6_results.xlsx', 'Sheet', 'Table 6');
    
    % Also display in command window
    %wave-like behavior
    %Show expected symmetry
    %Match the initial conditions
    %These values have the same magnitude but opposite signs, which is correct due to the periodic nature of the solution. 

    disp('Table 6: Values of the solution of the hyperbolic problem')
    disp(T)
end