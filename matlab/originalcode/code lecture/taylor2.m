function y = taylor2( f, fp, h, n, t0, y0 )
% euler   2nd order Taylor method
%
% usage:    y = taylor2( f, fp, h, n, t0, y0 )
%
% example:    f = @(t,y)sin(t); g = @(t,y)cos(t); y = taylor2( f, g, pi/10, 10, 0, 0 )
%
% inputs:   f - Function to be integrated with respect to t and y
%           fp- First derivative of f respect to t
%           h - Time step
%           n - Number of steps
%           t0- Initial time value
%           y0- boundary conditions at t0
%
% output:  y - numerically computed value of the solution
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       17/11/13
%

yi = y0;

ti = t0;

for i=1:n
   y = yi + h * f(ti,yi) + 0.5 * h^2 * fp(ti,yi);
   yi = y;
   ti = ti + h;
end 
