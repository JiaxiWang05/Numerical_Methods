function [x,t,u] = fdparabolic(a,b,n,T,m,c,f)
% fdparabolic   Finite Differcence method to solve a parabolic PDEs.
%         This routine solves the problem u_t(x,t) = c u_xx(x,t) in 
%         [a,b] x [0,T] with u(a,t) = 0, u(b,t) = 0 and u(x,0) = f(x).
%
% usage:    [x,u] = fdparabolic(a,b,n,T,m,c,f)
%
% example:    f = @(x)(4*x-4*x.^2);[x,t,u]=fdparabolic(0,1,5,0.2,10,1,f);
%             surf(t,x,u)
%             This is example 10.3 in John H. Mathews "Numerical Methods"
%
% inputs:   a,b - Extrema
%           n - Number of subintervals
%           T - Final time
%           m - Number of steps in time
%           c - Coefficient c
%           f - Initial value
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

r = c*k/(h^2);

u = zeros(n+1,m+1); % inizialize solution

u(2:n,1) = f(x(2:n)); % apply the initial value to u

u(1,:) = 0; % apply left BC to solution

u(n+1,:) = 0; % apply right BC to solution

for ct=1:m
    u(2:n,ct+1) = (-2*r+1)*u(2:n,ct)+r*u(3:n+1,ct)+r*u(1:n-1,ct);
    % apply the stencil
end



