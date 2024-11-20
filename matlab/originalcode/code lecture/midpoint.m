function y = midpoint( f, h, n, t0, y0 )
% midpoint   Midpoint Method
%
% usage:    y = midpoint( f, h, n, t0, y0 )
%
% example:    f = @(t,y)sin(t); y = midpoint( f, pi/10, 10, 0, 0 )
%
% inputs:   f - Function to be integrated with respect to t and y
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
   y2 = yi + h/2 * f(ti,yi);
   y = yi + h * f(ti+h/2,y2);
   yi = y;
   ti = ti + h;
end 

