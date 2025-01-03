

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

    % Exact values for integrals from -1 to 1
    exact = [0, 2/3, 0, 2/5, 0, 2/7, 0, 2/9];

    % Initialize results matrix (8 functions x 3 rules)
    results = zeros(8,3);
    errors = zeros(8,3);

    % Calculate approximations and errors for each function using each rule
    funcs = {f1, f2, f3, f4, f5, f6, f7, f8};
    for i = 1:8
        for rule = 1:3
            results(i,rule) = gauss(rule, funcs{i});
            errors(i,rule) = abs(results(i,rule) - exact(i));
        end
    end

    % Display results (rounded to 3 significant figures)
    fprintf('Function\tRule 1\t\tRule 2\t\tRule 3\t\tError 1\t\tError 2\t\tError 3\n');
    fprintf('------------------------------------------------------------------------\n');
    for i = 1:8
        fprintf('x^%d\t\t%.3g\t\t%.3g\t\t%.3g\t\t%.3g\t\t%.3g\t\t%.3g\n', ...
            i, results(i,1), results(i,2), results(i,3), ...
            errors(i,1), errors(i,2), errors(i,3));
    end
end





