function [x,u] = fdodev2(a,b,n,f,beta)
% fdode   Finite Differcence method to solve elliptic ODEs.
%         This routine solves the problem u''(x) = f(x) in [a,b] with
%         u'(a) = 0, u(b) = beta
%
% usage:    [x,u] = fdodev2(a,b,n,f,beta)
%
% example:    f = @(x)sin(x);[x,u]=fdodev2(0,pi,5,f,0);
%
% inputs:   a,b - Extrema
%           n - Number of subintervals
%           f - Function on the rhs
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

A(1,1) = -1; % apply left BC to matrix

F = h^2.*f(x(2:n)); % compute the values for the rhs vector

F(n-1) = F(n-1) + beta; % apply right BC

u = zeros(n+1,1); % inizialize solution

u(2:n) = A\F; % compute solution at the interior nodes

u(1) = u(2); % apply left BC to solution

u(n+1) = beta; % apply right BC to solution

