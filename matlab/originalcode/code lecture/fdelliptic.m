function [p,u] = fdelliptic(a,b,n,f)
% fdelliptic   Finite Differcence method to solve an elliptic PDEs.
%         This routine solves the problem -u_xx(x,y)-u_yy(x,y) = f(x,y) in 
%         [a,b]^2 with u = 0 along the boundary.
%
% usage:    [p,u] = fdelliptic(a,b,n,f)
%
% example:  n = 20;  
%           f=@(x,y)(1+0.*x);[p,u] = fdelliptic(0,1,n,f);
%           surf(reshape(p(:,1),n+1,n+1),reshape(p(:,2),n+1,n+1),reshape(u,n+1,n+1))
%
% inputs:   a,b - Extrema
%           n - Number of subintervals in each direction
%           f - Data
%
% output:  p - Coordinates of the points
%          u - Values of the computed solution at the nodes
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       10/06/15
%

h = (b-a)/n; % calculate the size of h


x = (a:h:b)'; % generate x coordinates of the nodes

y = (a:h:b)'; % generate y coordinates  of the nodes

% determine indices of nodes in the interior
ind =  n+1+1:(n+1)^2-(n+1);
ind(1:n+1:(n+1)^2-2*(n+1)) = [];
ind(n:n:n^2-n) = [];

% generate points in the interior
p(:,1) = reshape(repmat(x,1,n+1),(n+1)^2,1);
p(:,2) = reshape(repmat(y,1,n+1)',(n+1)^2,1);


F = h^2*f(p(ind,1),p(ind,2)); % evaluate f at points in the interior

% apply diagonal part of the stencil
tmp = ones((n-1)^2, 1) ;
A = diag(-4 * tmp, 0);

% apply off-diagonal part of the stencil
tmp = ones((n-1)^2-1, 1);
tmp(n-1:n-1:(n-1)^2-1) = 0;
A = A +diag(tmp, 1);
A = A +diag(tmp, -1);
tmp = ones((n-1)^2, 1) ;
A = A +diag(tmp(1:(n-1)^2-(n-1)), n-1);
A = A +diag(tmp(1:(n-1)^2-(n-1)), -(n-1));

u = zeros((n+1)^2,1); % init solution


u(ind)=-A\F; % compute solution



