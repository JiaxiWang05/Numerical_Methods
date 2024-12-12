% Define test functions
f1 = @(x,y) ones(size(x));           % Exact result: 1
f2 = @(x,y) x.*y;                    % Exact result: 0.25
f3 = @(x,y) sin(pi*x).*sin(pi*y);    % Exact result: 4/π² ≈ 0.4053

% Values of n and m to test
n_values = [1 5 10];

% Initialize results matrix
results = zeros(3, 3);

% Calculate approximations
for i = 1:3
    n = n_values(i);
    m = n;
    results(1,i) = double_trap_rule(f1, [0,1], n, [0,1], m);
    results(2,i) = double_trap_rule(f2, [0,1], n, [0,1], m);
    results(3,i) = double_trap_rule(f3, [0,1], n, [0,1], m);
end

% Theoretical results
theoretical = [1; 0.25; 4/pi^2];

% Create table
varNames = {'n=m=1', 'n=m=5', 'n=m=10', 'Theoretical'};
rowNames = {'f(x,y)=1', 'f(x,y)=xy', 'f(x,y)=sin(πx)sin(πy)'};

% Combine numerical and theoretical results
combined_results = [results, theoretical];

% Round results to 6 decimal places
combined_results = round(combined_results, 6);

% Create and display table
T = table(combined_results(:,1), combined_results(:,2), combined_results(:,3), combined_results(:,4), ...
          'VariableNames', varNames, 'RowNames', rowNames);

% Display table
disp('Double Trapezoidal Rule Results with Theoretical Comparison:')
disp(T)

% Calculate and display errors
disp('Absolute Errors:')
errors = abs(results - theoretical);
E = table(errors(:,1), errors(:,2), errors(:,3), ...
          'VariableNames', {'n=m=1', 'n=m=5', 'n=m=10'}, ...
          'RowNames', rowNames);
disp(E)