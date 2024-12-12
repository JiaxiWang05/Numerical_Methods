function [x,t,u] = fdhyperbolic_neumann(a,b,n,T,m,c,f,g)
% fdhyperbolic_neumann   Finite Difference method to solve a hyperbolic PDE with mixed BC.
%         This routine solves the problem u_tt(x,t) = c^2 u_xx(x,t) in 
%         [a,b] x [0,T] with u(a,t) = 0, u_x(b,t) = 0 and u(x,0) = f(x),
%         u_t(x,0) = g(x)
%
% inputs:   a,b - Extrema (required)
%           n - Number of subintervals (required)
%           T - Final time (required)
%           m - Number of steps in time (required)
%           c - Coefficient c (required)
%           f - Initial value for u (required)
%           g - Initial value for u_t (required)
%
% output:  x - Nodes of the partition
%          t - Nodes in time
%          u - Values of the computed solution at the nodes

% Input validation
if nargin < 8
    error('Not enough input arguments. This function requires 8 inputs: a,b,n,T,m,c,f,g');
end

h = (b-a)/n;                     % Calculate spatial step size
k = T/m;                         % Calculate time step size
x = (a:h:b)';                    % Generate spatial nodes
t = (0:k:T);                     % Generate time nodes
r = c*k/h;                       % CFL number

u = zeros(n+1,m+1);              % Initialize solution matrix

% Apply initial conditions
u(:,1) = f(x);                   % u(x,0) = f(x)

% First time step using modified equation for u_t(x,0) = g(x)
% Interior points
u(2:n,2) = (1-r^2)*u(2:n,1) + k*g(x(2:n)) + (r^2/2)*(u(3:n+1,1) + u(1:n-1,1));

% Apply Dirichlet BC at x=a
u(1,:) = 0;                      % u(a,t) = 0

% Apply Neumann BC at x=b for first time step
u(n+1,2) = (1-r^2)*u(n+1,1) + k*g(x(n+1)) + r^2*u(n,1);

% Main time-stepping loop
for j = 2:m
    % Interior points
    u(2:n,j+1) = 2*(1-r^2)*u(2:n,j) + r^2*(u(3:n+1,j) + u(1:n-1,j)) - u(2:n,j-1);
    
    % Apply Neumann BC at x=b using ghost point method
    u(n+1,j+1) = 2*(1-r^2)*u(n+1,j) + 2*r^2*u(n,j) - u(n+1,j-1);
end
