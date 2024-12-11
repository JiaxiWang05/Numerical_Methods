% Create a verification script The solution is continuous and smooth
%exhibits wave-like behavior,The boundary conditions are satisfied
clear all; close all;
%It satisfies the expected properties of a hyperbolic equation (wave propagation)

% Original test point
x_test = 0.5;
t_test = 1.0;
L = 1.0;
c = 1.0;
A = [1, 0, -3];
B = [1, 2];

% Test 1: Compute at original point
u_test = hyperbolic_analytical(x_test, t_test, L, c, A, B);
fprintf('Value at test point (x=0.5, t=1.0): %f\n', u_test);

% Test 2: Plot solution across space at fixed time
x_values = linspace(0, L, 100);
u_space = zeros(size(x_values));
for i = 1:length(x_values)
    u_space(i) = hyperbolic_analytical(x_values(i), t_test, L, c, A, B);
end

figure(1);
plot(x_values, u_space, 'b-', 'LineWidth', 2);
hold on;
plot(x_test, u_test, 'ro', 'MarkerSize', 10);
grid on;
xlabel('x');
ylabel('u(x,t=1)');
title('Solution across space at t=1');
legend('Solution', 'Test point');

% Test 3: Plot solution across time at fixed position
t_values = linspace(0, 2, 100);
u_time = zeros(size(t_values));
for i = 1:length(t_values)
    u_time(i) = hyperbolic_analytical(x_test, t_values(i), L, c, A, B);
end

figure(2);
plot(t_values, u_time, 'b-', 'LineWidth', 2);
hold on;
plot(t_test, u_test, 'ro', 'MarkerSize', 10);
grid on;
xlabel('t');
ylabel('u(x=0.5,t)');
title('Solution across time at x=0.5');
legend('Solution', 'Test point');

% Test 4: Create a space-time plot
[X, T] = meshgrid(x_values, t_values);
U = zeros(size(X));
for i = 1:size(X,1)
    for j = 1:size(X,2)
        U(i,j) = hyperbolic_analytical(X(i,j), T(i,j), L, c, A, B);
    end
end

figure(3);
surf(X, T, U);
colorbar;
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Space-time solution');