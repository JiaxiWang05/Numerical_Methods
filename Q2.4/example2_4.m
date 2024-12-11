% Example computation for hyperbolic PDE with Neumann BC
% Define the initial conditions
f = @(x)(sin(pi*x)+sin(2*pi*x));
g = @(x)(0*x);

% Compute solution in domain [0,1]×[0,0.5]
[x,t,u] = fdhyperbolic_neumann(0,1,10,0.5,20,2,f,g);

% Visualize the solution
surf(t,x,u);
xlabel('Time');
ylabel('Space');
zlabel('Solution u(x,t)');
title('Solution of Wave Equation with Neumann BC');
