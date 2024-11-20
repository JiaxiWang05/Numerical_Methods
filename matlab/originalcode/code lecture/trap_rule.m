function S = trap_rule( f, x, n )
% trap_rule   Trapezoidal Rule
%
% usage:    S = trap_rule( f, x, n )
%
% example:    S = trap_rule( @sin, [0,pi], 10 )
%
% inputs:   f - Function to be integrated with respect to x
%           x - Extrems of the integral region
%           n - Number of panels
%
% output:  S - numerically evaluated integral by
%                     trapezoidal rule
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       17/11/13
%

h = (x(2)-x(1))/n;

xim1 = x(1)+(0:n-1)*h;

xi = x(1)+(1:n)*h;

fim1 = f(xim1);

fi = f(xi);

S = sum((fim1+fi)*h/2);
