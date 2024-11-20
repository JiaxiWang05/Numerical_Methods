function S = left_rule( f, x, n )
% left_rule   Left Endpoint Rule
%
% usage:    S = left_rule( f, x, n )
%
% example:    S = left_rule( @sin, [0,pi], 10 )
%
% inputs:   f - Function to be integrated with respect to x
%           x - Extrems of the integral region
%           n - Number of panels
%
% output:  S - numerically evaluated integral by
%                     left endpoint rule
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       17/11/13
%

h = (x(2)-x(1))/n;

xi = x(1)+[0:n-1]*h;

ti = xi;

fi = f(ti);

S = sum(f(ti)*h);
