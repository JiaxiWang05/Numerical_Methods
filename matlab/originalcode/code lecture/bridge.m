% Script to compute the catenary problem for a cable part of a suspended
% bridge.
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       29/10/20
%

% Number of subdivisions for the finite difference method
n = 60;

% Computation of the solution for the bridge problem
[x,u_bridge]=fdode_bridge(0,60,n,@f_bridge,0,0,10^3);
plot(x,u_bridge,'-o')

function f=f_bridge(x)
% f_bridge   Function to compute the forces in the case of the support cable
%           for a bridge. The bridge is attached at the cable every 10 m
%           and the force is 100 N at each connection.
% 
%
% usage:    f = f_bridge(x)
%
% example:    f = f_bridge(1)
%
% inputs:   x - Position of the nodes
%
% output:  f - Value of the force at the nodes
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       29/10/20
%
    % Preallocate f
    f = zeros(length(x),1);
    
    % Check each x to determine if it is at a connection with the bridge
    for i= 1:length(x)
       if  mod(x(i),10) == 0 
           f(i) = 100; 
       else
           f(i) = 0;
       end
    end
end

function [x,u] = fdode_bridge(a,b,n,f,alpha,beta,coef)
% fdode_bridge   Finite Differcence method to solve elliptic ODEs.
%         This routine solves the problem -coef*u''(x) = f(x) in [a,b] with
%         u(a) = alpha, u(b) = beta
%
% usage:    [x,u] = fdode_bridge(a,b,n,f,alpha,beta,coef)
%
% example:    f = @(x)sin(x);[x,u]=fdode_bridge(0,pi,5,f,0,0,10^2);
%
% inputs:   a,b - Extrema
%           n - Number of subintervals
%           f - Function on the rhs
%           alpha - Left value for the BC
%           beta - Right value for the BC
%           coef - coefficient for the stiffness of the material
%
% output:  x - Nodes of the partition
%          u - Values of the computed solution at the nodes
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       29/10/20
%

    h = (b-a)/n; % calculate the size of h

    x = (a:h:b)'; % generate the nodes

    A = gallery('tridiag',n-1,1,-2,1); % generate the tridiagonal matrix

    F = h^2.*f(x(2:n))/coef; % compute the values for the rhs vector

    F(1) = F(1) + alpha; % apply left BC

    F(n-1) = F(n-1) + beta; % apply right BC

    u = zeros(n+1,1); % inizialize solution

    u(2:n) = A\F; % compute solution at the interior nodes

    u(1) = alpha; % apply left BC to solution

    u(n+1) = beta; % apply right BC to solution
end