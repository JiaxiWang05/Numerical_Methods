function [x,t,u] = fdhyperbolic_neumann(a,b,n,T,m,c,f,g)
% fdhyperbolic_neumann   Finite Difference method to solve a hyperbolic PDE with Neumann BC.
%         This routine solves the problem u_tt(x,t) = c^2 u_xx(x,t) in 
%         [a,b] x [0,T] with u_x(a,t) = 0, u_x(b,t) = 0 and u(x,0) = f(x), u_t(x,0) = g(x)
%
% usage:   function [x,t,u] = fdhyperbolic_neumann(a,b,n,T,m,c,f,g)
%
% inputs:   a,b - Extrema
%           n - Number of subintervals
%           T - Final time
%           m - Number of steps in time
%           c - Coefficient c
%           f - Initial value for u
%           g - Initial value for u_t
%
% output:  x - Nodes of the partition
%          t - Nodes in time
%          u - Values of the computed solution at the nodes

% Calculate grid parameters
h = (b-a)/n;                     % Spatial step size
k = T/m;                         % Time step size
x = linspace(a,b,n+1)';         % Spatial grid points
t = linspace(0,T,m+1);          % Time grid points
r = c*k/h;                      % CFL number

% Initialize solution matrix
u = zeros(n+1,m+1);

% Set initial conditions
u(:,1) = f(x);                  % u(x,0) = f(x)

% First time step using modified equation for u_t(x,0) = g(x)
% Interior points
u(2:n,2) = (1-r^2)*u(2:n,1) + k*g(x(2:n)) + (r^2/2)*(u(3:n+1,1) + u(1:n-1,1));

% Boundary points (Neumann BC using ghost point method)
u(1,2) = (1-r^2)*u(1,1) + k*g(x(1)) + r^2*u(2,1);
u(n+1,2) = (1-r^2)*u(n+1,1) + k*g(x(n+1)) + r^2*u(n,1);

% Main time-stepping loop
for j = 2:m
    % Interior points
    u(2:n,j+1) = 2*(1-r^2)*u(2:n,j) + r^2*(u(3:n+1,j) + u(1:n-1,j)) - u(2:n,j-1);
    
    % Boundary points (Neumann BC)
    u(1,j+1) = 2*(1-r^2)*u(1,j) + 2*r^2*u(2,j) - u(1,j-1);
    u(n+1,j+1) = 2*(1-r^2)*u(n+1,j) + 2*r^2*u(n,j) - u(n+1,j-1);
end