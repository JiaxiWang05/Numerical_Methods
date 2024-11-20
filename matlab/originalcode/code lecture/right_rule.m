function S = right_rule( f, x, n )
% right_rule   Right Endpoint Rule
%
% usage:    S = right_rule( f, x, n )
%
% example:    S = right_rule( @sin, [0,pi], 10 )
%
% inputs:   f - Function to be integrated with respect to x
%           x - Extrems of the integral region
%           n - Number of panels
%
% output:  S - numerically evaluated integral by
%                     right endpoint rule
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       17/11/13
%

h = (x(2)-x(1))/n;

xi = x(1)+(0:n-1)*h;

ti = xi+h;

fi = f(ti);

S = sum(fi*h);
