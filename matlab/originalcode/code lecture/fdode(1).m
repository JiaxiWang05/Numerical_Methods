function [x,u] = fdode(a,b,n,f,alpha,beta)
% fdode   Finite Differcence method to solve elliptic ODEs.
%         This routine solves the problem u''(x) = f(x) in [a,b] with
%         u(a) = alpha, u(b) = beta
%
% usage:    [x,u] = fdode(a,b,n,f,alpha,beta)
%
% example:    f = @(x)sin(x);[x,u]=fdode(0,pi,5,f,0,0);
%
% inputs:   a,b - Extrema
%           n - Number of subintervals
%           f - Function on the rhs
%           alpha - Left value for the BC
%           beta - Right value for the BC
%
% output:  x - Nodes of the partition
%          u - Values of the computed solution at the nodes
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       10/06/15
%

h = (b-a)/n; % calculate the size of h

x = (a:h:b)'; % generate the nodes

A = gallery('tridiag',n-1,1,-2,1); % generate the tridiagonal matrix

F = h^2.*f(x(2:n)); % compute the values for the rhs vector

F(1) = F(1) -alpha; % apply left BC

F(n-1) = F(n-1) - beta; % apply right BC

u = zeros(n+1,1); % inizialize solution

u(2:n) = A\F; % compute solution at the interior nodes

u(1) = alpha; % apply left BC to solution

u(n+1) = beta; % apply right BC to solution



