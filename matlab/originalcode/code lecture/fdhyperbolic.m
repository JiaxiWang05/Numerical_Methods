function [x,t,u] = fdhyperbolic(a,b,n,T,m,c,f,g)
% fdhyperbolic   Finite Differcence method to solve a hyperbolic PDEs.
%         This routine solves the problem u_tt(x,t) = c^2 u_xx(x,t) in 
%         [a,b] x [0,T] with u(a,t) = 0, u(b,t) = 0 and u(x,0) = f(x),
%         u_t(x,0) = g(x)
%
% usage:    [x,u] = fdhyperbolic(a,b,n,T,m,c,f,g)
%
% example:    f = @(x)(sin(pi*x)+sin(2*pi*x));g = @(x)(0*x);[x,t,u]=fdhyperbolic(0,1,10,0.5,10,2,f,g);
%             surf(t,x,u)
%             This is example 10.1 in John H. Mathews "Numerical Methods"
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
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       10/06/15
%

h = (b-a)/n; % calculate the size of h

k = T/m; % calculate the size of k, the timestep

x = (a:h:b)'; % generate the nodes

t = (0:k:T); % generate the nodes in time

r = c*k/(h);

u = zeros(n+1,m+1); % inizialize solution

u(2:n,1) = f(x(2:n)); % apply the initial value to u

u(2:n,2) = (1-r^2)*f(x(2:n))+k*g(x(2:n))+r^2/2*(f(x(3:n+1))+f(x(1:n-1))); % apply the initial value to u_t

u(1,:) = 0; % apply left BC to solution

u(n+1,:) = 0; % apply right BC to solution

for ct=2:m
    u(2:n,ct+1) = (2-2*r^2)*u(2:n,ct)+r^2*u(3:n+1,ct)+r^2*u(1:n-1,ct)-u(2:n,ct-1);
    % apply the stencil
end



