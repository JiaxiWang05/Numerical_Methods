function y = rk( f, h, n, t0, y0 )
% midpoint   Runge-Kutta Method
%
% usage:    y = rk( f, h, n, t0, y0 )
%
% example:   f = @(t,y)sin(t);  y = rk(f, pi/10, 10, 0, 0 )
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
   k1 = h * f(ti,yi);
   k2 = h * f(ti+h/2,yi+k1/2);
   k3 = h * f(ti+h/2,yi+k2/2);
   k4 = h * f(ti+h,yi+k3);
   y = yi + 1/6*(k1+2*k2+2*k3+k4);
   yi = y;
   ti = ti + h;
end 

