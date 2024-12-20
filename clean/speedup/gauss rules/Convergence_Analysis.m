   f = @(x) x.^6;  % For x^6
   exact = 2/7;    % Corresponding exact value

% Initialize error array
error = zeros(1,3);  % Only 3 rules are implemented in your gauss.m

% Test with all available quadrature rules
for n = 1:3
    error(n) = abs(gauss(n, f) - exact);
end

% Plot the convergence
figure;
semilogy(1:3, error, 'o-');
grid on;
xlabel('Number of Gauss points (rule number)');
ylabel('Absolute Error');
title('Convergence of Gauss Quadrature for x^4');                                                                                    